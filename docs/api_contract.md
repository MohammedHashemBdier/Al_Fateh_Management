# وثيقة عقد واجهة برمجة التطبيقات (API Contract)
## منظومة الفتح لإدارة مزود خدمة الإنترنت - Al-Fateh Enterprise Backend

- **الإصدار:** v5.0 (Enterprise Attendance, Shifts, Tickets & RBAC)
- **البروتوكول:** HTTPS RESTful Web App (Google Apps Script Engine)
- **تاريخ الاعتماد:** 2026-10-06
- **نظام التنسيق:** JSON (MIME type: `application/json`)
- **عنوان الخادم الأساسي (Production Web App URL):**
  `https://script.google.com/macros/s/AKfycbwW7Ii78ftHFew0g2wxCfyWVaiax3VI9g2NtgMFdd8uocI2GaBWcnm1PhQov7Q4-nY4/exec`

---

## 1. المبادئ المعمارية والتواصل (Core Communication Principles)

1. **طريقة الإرسال (HTTP Methods):**
   - يدعم السيرفر كلاً من `GET` و `POST` بنفس الآلية (`doGet` و `doPost` يقومان بتوجيه الطلب لنفس الراوتر `handleRequest`).
   - بالنسبة لـ `POST`، يمكن تمرير المتغيرات إما كـ Query Parameters أو داخل جسم الطلب بتنسيق `JSON body` (`Content-Type: text/plain` أو `application/json`).
2. **آلية القفل والمزامنة (LockService):**
   - كافة الطلبات تخضع لـ `LockService.getScriptLock()` بمهلة 15 ثانية لمنع تعارض الكتابة والتسجيل المزدوج (Concurrency Safe).
3. **التوجيه التلقائي (302 Redirect):**
   - تفرض منصة Google Apps Script إعادة توجيه 302 عند كل استدعاء. يجب أن تضبط مكتبات العميل (`Dio` في Flutter، أو `fetch` في JavaScript/Extension) خاصية اتباع التوجيهات (`followRedirects: true`).
4. **بنية الاستجابة القياسية (Standard Response Envelope):**
   - **في حال النجاح:**
     ```json
     {
       "success": true,
       "message": "نص اختياري يوضح نجاح العملية",
       ... [البيانات المطلوبة]
     }
     ```
   - **في حال الفشل:**
     ```json
     {
       "success": false,
       "error": "رمز أو تفصيل الخطأ التقني",
       "message": "رسالة واضحة للمستخدم باللغة العربية"
     }
     ```

---

## 2. جدول المسارات والأسماء البديلة (Endpoints & Aliases Matrix)

| الوظيفة (Action Function) | الاسم المعتمد (Primary Action) | الأسماء البديلة المقبولة (Aliases) | طريقة الطلب (Method) |
|---|---|---|---|
| تهيئة التطبيق وجلب البيانات العامة والتذاكر | `init` | - | `GET` |
| إعدادات النظام وإعدادات الدوام | `system.getConfig` | `attendance.getSettings`, `getSettings`, `config.get` | `GET` |
| استعراض الورديات وفترات الدوام | `shifts.getAll` | `attendance.getShifts`, `getShifts` | `GET` |
| مواقع العمل والنطاقات الجغرافية | `sites.getAll` | `attendance.getSites`, `getSites` | `GET` |
| استعراض الإشعارات | `notifications.get` | `notifications.getAll` | `GET` |
| حالة دوام الموظف لليوم الحالي | `attendance.getTodayStatus` | `attendance.today` | `GET` / `POST` |
| تسجيل حضور (Check-In) بالـ GPS | `attendance.checkIn` | `attendance.checkin` | `POST` / `GET` |
| تسجيل انصراف (Check-Out) بالـ GPS | `attendance.checkOut` | `attendance.checkout` | `POST` / `GET` |
| استعراض سجلات الحضور والانصراف | `attendance.getRecords` | `attendance.records` | `GET` / `POST` |
| تقديم طلب تصحيح دوام | `corrections.request` | `attendance.correction.req` | `POST` |
| استعراض طلبات التصحيح | `corrections.getAll` | `attendance.getCorrections` | `GET` |
| اعتماد / رفض طلب تصحيح | `corrections.approve` | `attendance.correction.approve` | `POST` |
| جلب جميع تذاكر الدعم الفني | `getAll` | `tickets.getAll` | `GET` |
| إضافة تذكرة دعم فني جديدة | `add` | `tickets.add` | `POST` / `GET` |
| تحديث تذكرة دعم فني | `update` | `tickets.update` | `POST` / `GET` |
| إضافة نوع مشكلة جديدة للقائمة | `addProblem` | `problems.add` | `POST` / `GET` |
| تسجيل الدخول والتحقق | `login` | `auth.login` | `POST` |
| الصلاحيات الفعالة للمستخدم | `perms.getEffective` | - | `GET` / `POST` |
| استعراض سجل التدقيق والرقابة | `audit.getLogs` | - | `GET` |
| استعراض طلبات الاعتماد العامة | `approval.getRequests` | - | `GET` |

---

## 3. تفاصيل ومواصفات كل استدعاء (API Specifications)

### 3.1 تهيئة التطبيق الأساسية (`action=init`)
- **الوصف:** استدعاء خفيف وسريع عند بدء تشغيل التطبيق يجلب التذاكر ومصفوفة المستخدمين والأدوار والإعدادات دفعة واحدة.
- **البارامترات:**
  - `limit` *(اختياري)*: الحد الأقصى للتذاكر المسترجعة (افتراضياً: 1000).
- **الاستجابة الناجحة (200 OK):**
```json
{
  "success": true,
  "problems": ["لا يوجد انترنت", "بطئ انترنت", "يوجد فاتورة", "ضوء DSL لايعمل", ...],
  "statuses": ["تم الحل", "قيد الحل", "لم يتم الحل"],
  "employees": ["مدير النظام", "محمد هاشم بدير", "سام قصاب", "عمار يوسف", "باسم أبو حمرة", "ألاء الساطي", "عبد الرحمن المصطفى"],
  "users": [
    {
      "user_id": "USR-001",
      "username": "admin",
      "full_name": "مدير النظام",
      "department": "MANAGEMENT",
      "role_id": "ROLE_ADMIN",
      "status": "ACTIVE",
      "created_at": "2026-10-01"
    }
  ],
  "roles": [ ... ],
  "permissions": [ ... ],
  "role_permissions": [ ... ],
  "sites": [
    {
      "site_id": "SITE-HQ",
      "site_name": "المقر الرئيسي - شركة الفتح",
      "latitude": 33.5138,
      "longitude": 36.2765,
      "radius_meters": 50,
      "is_active": "نعم"
    }
  ],
  "config": {
    "permissions_version": 1,
    "payroll_locked_until": "2026-08-31"
  },
  "recent_tickets": [
    {
      "row_id": 392,
      "date": "2026/10/06",
      "time": "14:30",
      "subscriber_name": "سامر حموي",
      "landline": "0112345678",
      "problem": "بطئ انترنت",
      "solution": "تعديل التردد في المقسم",
      "status": "تم الحل",
      "description": "تم فحص الخط واستقراره",
      "employee": "محمد هاشم بدير"
    }
  ]
}
```

---

### 3.2 إعدادات الدوام والنظام (`action=system.getConfig` / `attendance.getSettings`)
- **الوصف:** جلب الإعدادات التشغيلية المعتمدة لنظام الحضور والجيوفنس.
- **البارامترات:** لا يوجد.
- **الاستجابة الناجحة:**
```json
{
  "success": true,
  "config": {
    "permissions_version": 1,
    "payroll_locked_until": "2026-08-31"
  },
  "attendance_settings": {
    "default_geofence_radius": 50,
    "max_allowed_gps_accuracy": 30,
    "enable_mock_detection": true,
    "allow_browser_checkin": true,
    "payroll_lock_day": 28
  }
}
```

---

### 3.3 استعراض الورديات (`action=shifts.getAll` / `attendance.getShifts`)
- **الوصف:** جلب كافة الورديات المعرفة في ورقة `Shifts`.
- **البارامترات:** لا يوجد.
- **الاستجابة الناجحة:**
```json
{
  "success": true,
  "count": 2,
  "shifts": [
    {
      "shift_id": "SH-MORNING",
      "shift_name": "الوردية الصباحية",
      "start_time": "09:00:00",
      "end_time": "17:00:00",
      "grace_period_mins": 15,
      "overtime_threshold_mins": 30,
      "work_days": "SAT,SUN,MON,TUE,WED,THU",
      "is_default": true,
      "is_active": true
    }
  ]
}
```

---

### 3.4 مواقع العمل والجيوفنس (`action=sites.getAll` / `attendance.getSites`)
- **الوصف:** استرجاع مواقع فروع ومقرات الشركة مع إحداثيات GPS ونصف القطر المسموح (بالأمتار).
- **الاستجابة الناجحة:**
```json
{
  "success": true,
  "sites": [
    {
      "site_id": "SITE-HQ",
      "site_name": "المقر الرئيسي - شركة الفتح",
      "latitude": 33.5138,
      "longitude": 36.2765,
      "radius_meters": 50,
      "is_active": true,
      "address_details": "دمشق - سوريا"
    }
  ]
}
```

---

### 3.5 حالة الدوام لليوم الحالي (`action=attendance.getTodayStatus` / `attendance.today`)
- **الوصف:** فحص ما إذا كان الموظف قد سجل حضوراً أو انصرافاً اليوم.
- **البارامترات:**
  - `user_id` *(مطلوب)*: معرّف الموظف (مثل `USR-002`).
  - `date` *(اختياري)*: تاريخ اليوم بتنسيق `yyyy-MM-dd` (افتراضياً تاريخ الخادم بتوقيت دمشق).
- **الاستجابة الناجحة (في حال لم يسجل بعد):**
```json
{
  "success": true,
  "has_checked_in": false,
  "has_checked_out": false,
  "status": "NOT_LOGGED",
  "record": null
}
```
- **الاستجابة الناجحة (في حال سجل حضور فقط):**
```json
{
  "success": true,
  "has_checked_in": true,
  "has_checked_out": false,
  "status": "PRESENT",
  "check_in_time": "09:05:12",
  "record": {
    "id": "ATT-20261006-USR-002",
    "user_id": "USR-002",
    "date": "2026-10-06",
    "check_in_time": "09:05:12",
    "check_in_lat": 33.51381,
    "check_in_lng": 36.27652,
    "site_id": "SITE-HQ",
    "status": "PRESENT"
  }
}
```

---

### 3.6 تسجيل الحضور بالـ GPS (`action=attendance.checkIn` / `attendance.checkin`)
- **الوصف:** تسجيل الحضور مع التحقق الصارم من النطاق الجغرافي ودقة الـ GPS ومكافحة التزييف (Anti-Spoofing).
- **البارامترات (Request Body / Parameters):**
  - `user_id` *(مطلوب)*: كود المستخدم (مثال: `USR-002`).
  - `lat` *(مطلوب)*: خط العرض (Latitude) كرقم عشري.
  - `lng` *(مطلوب)*: خط الطول (Longitude) كرقم عشري.
  - `accuracy` *(مطلوب)*: دقة الإشارة بالمتر (يجب أن تكون <= `max_allowed_gps_accuracy` أي <= 30 متر).
  - `is_mock` *(مطلوب)*: قيمة boolean تدل هل الموقع مزيف بواسطة برامج Fake GPS.
  - `device_id` *(اختياري)*: بصمة الجهاز للتحقق من عدم استخدام أجهزة متعددة.
  - `site_id` *(اختياري)*: معرّف الموقع المستهدف (إذا تم اختياره يدوياً أو مطابقته تلقائياً).
- **شروط القبول والتحقق (Business Logic & Geofencing Rules):**
  1. إذا كان `is_mock == true` يُرفض الطلب فوراً ويُدرج تحذير أمني في `AuditLogs`.
  2. إذا كانت `accuracy > 30` متر يُرفض الطلب بسبب ضعف إشارة الـ GPS.
  3. يتم حساب المسافة بواسطة معادلة Haversine بين إحداثيات الموظف وكافة المواقع النشطة في `SitesGeofence`. إذا كانت المسافة > `radius_meters` (افتراضياً 50 متراً) يُرفض الطلب.
  4. إذا كان الموظف مسجل حضور بالفعل لنفس اليوم يُمنع التكرار.
- **الاستجابة الناجحة (200 OK):**
```json
{
  "success": true,
  "message": "تم تسجيل الحضور بنجاح داخل مقر الشركة",
  "record_id": "ATT-20261006-USR-002",
  "check_in_time": "09:05:12",
  "distance_meters": 12.4,
  "site_name": "المقر الرئيسي - شركة الفتح"
}
```
- **نماذج أخطاء الرفض:**
  - تزييف الموقع:
    `{ "success": false, "code": "MOCK_LOCATION_DETECTED", "message": "تم اكتشاف تزييف بالموقع الجغرافي (Mock GPS)، تم حظر التسجيل" }`
  - خارج النطاق:
    `{ "success": false, "code": "GEOFENCE_OUT_OF_BOUNDS", "message": "أنت خارج النطاق الجغرافي المسموح لمقر الشركة (المسافة: 245 متر)" }`
  - دقة غير كافية:
    `{ "success": false, "code": "POOR_GPS_ACCURACY", "message": "دقة الموقع غير كافية (45m)، يرجى الاقتراب من نافذة أو تفعيل الدقة العالية" }`

---

### 3.7 تسجيل الانصراف بالـ GPS (`action=attendance.checkOut` / `attendance.checkout`)
- **الوصف:** تسجيل مغادرة العمل وحساب ساعات العمل الفعلية ودقائق الإضافي (Overtime).
- **البارامترات:**
  - `user_id` *(مطلوب)*: كود المستخدم.
  - `lat` *(مطلوب)*: خط العرض الحالي.
  - `lng` *(مطلوب)*: خط الطول الحالي.
  - `accuracy` *(مطلوب)*: دقة الموقع بالمتر.
  - `is_mock` *(مطلوب)*: فحص الموقع المزيف.
- **الاستجابة الناجحة:**
```json
{
  "success": true,
  "message": "تم تسجيل الانصراف بنجاح",
  "check_out_time": "17:15:00",
  "actual_hours": 8.16,
  "overtime_minutes": 15
}
```

---

### 3.8 استعراض سجلات الدوام (`action=attendance.getRecords` / `attendance.records`)
- **الوصف:** جلب سجلات الحضور والانصراف مع الفلترة حسب الموظف، الشهر، أو التاريخ، خاضعة لـ RBAC Scope (`SELF`, `DEPT`, `ALL`).
- **البارامترات:**
  - `user_id` *(اختياري)*: فلترة لموظف محدد.
  - `month` *(اختياري)*: شهر محدد بتنسيق `yyyy-MM` (مثال: `2026-10`).
  - `limit` *(اختياري)*: عدد السجلات (افتراضياً: 100).
- **الاستجابة الناجحة:**
```json
{
  "success": true,
  "count": 1,
  "records": [
    {
      "id": "ATT-20261006-USR-002",
      "user_id": "USR-002",
      "date": "2026-10-06",
      "check_in_time": "09:05:12",
      "check_in_lat": 33.51381,
      "check_in_lng": 36.27652,
      "check_out_time": "17:15:00",
      "check_out_lat": 33.51379,
      "check_out_lng": 36.27650,
      "actual_hours": 8.16,
      "late_minutes": 0,
      "overtime_hours": 0.25,
      "status": "PRESENT",
      "is_locked": "لا"
    }
  ]
}
```

---

### 3.9 طلبات تصحيح الدوام (`action=corrections.request` / `attendance.correction.req`)
- **الوصف:** تقديم طلب تصحيح لسجل دوام (نسيان تسجيل حضور أو انصراف، أو عطل بالهاتف).
- **البارامترات:**
  - `user_id` *(مطلوب)*: معرّف الموظف مقدم الطلب.
  - `attendance_id` *(اختياري)*: معرّف السجل المراد تصحيحه (إن وجد).
  - `target_date` *(مطلوب)*: تاريخ اليوم المراد تصحيحه `yyyy-MM-dd`.
  - `corrected_check_in` *(اختياري)*: وقت الحضور المقترح `HH:mm`.
  - `corrected_check_out` *(اختياري)*: وقت الانصراف المقترح `HH:mm`.
  - `reason` *(مطلوب)*: سبب طلب التصحيح.
- **الاستجابة الناجحة:**
```json
{
  "success": true,
  "message": "تم إرسال طلب تصحيح الدوام بنجاح للمراجعة والاعتماد",
  "request_id": "REQ-CORR-179129"
}
```

---

### 3.10 استعراض واعتماد طلبات التصحيح
- **جلب الطلبات (`action=corrections.getAll`):**
  - يعيد قائمة الطلبات وحالتها (`PENDING`, `APPROVED`, `REJECTED`).
- **الاعتماد / الرفض (`action=corrections.approve`):**
  - البارامترات:
    - `request_id` *(مطلوب)*: كود الطلب.
    - `approver_id` *(مطلوب)*: كود المسؤول الذي اعتمد الطلب.
    - `decision` *(مطلوب)*: `APPROVED` أو `REJECTED`.
    - `notes` *(اختياري)*: ملاحظات المسؤول.

---

### 3.11 استعراض الإشعارات (`action=notifications.get` / `notifications.getAll`)
- **الوصف:** جلب الإشعارات النظامية والتنبيهات الخاصة بالمستخدم.
- **البارامترات:**
  - `user_id` *(اختياري)*: كود المستخدم المستهدف.
  - `unread_only` *(اختياري)*: `true` / `false`.
- **الاستجابة الناجحة:**
```json
{
  "success": true,
  "count": 0,
  "notifications": []
}
```

---

## 4. قاموس رموز الأخطاء القياسية (Standard Error Codes)

| رمز الخطأ (Error Code) | المعنى التقني | الرسالة الافتراضية للمستخدم |
|---|---|---|
| `ACTION_NOT_FOUND` | الإجراء غير معروف في الراوتر | الإجراء المطلوب غير مدعوم في النظام |
| `MOCK_LOCATION_DETECTED` | تزييف إحداثيات GPS | تم اكتشاف تزييف بالموقع الجغرافي (Mock GPS)، تم حظر التسجيل |
| `GEOFENCE_OUT_OF_BOUNDS` | المستخدم خارج نصف قطر الموقع | أنت خارج النطاق الجغرافي المسموح لمقر الشركة |
| `POOR_GPS_ACCURACY` | دقة الإشارة تتجاوز الحد المسموح | دقة الـ GPS غير كافية، يرجى تفعيل الموقع عالي الدقة |
| `ALREADY_CHECKED_IN` | تسجيل الحضور مسبقاً لهذا اليوم | لقد قمت بتسجيل الحضور مسبقاً لهذا اليوم |
| `NOT_CHECKED_IN` | محاولة تسجيل انصراف دون حضور | لا يمكن تسجيل الانصراف لعدم وجود تسجيل حضور مسجل اليوم |
| `PAYROLL_PERIOD_LOCKED` | الشهر المالي مقفل | تم إقفال هذا الشهر المالي من قبل الإدارة المالية ولا يمكن التعديل |
| `UNAUTHORIZED` | عدم وجود صلاحية كافية | ليس لديك الصلاحية الكافية لإتمام هذا الإجراء |
| `LOCK_TIMEOUT` | السيرفر مشغول بكتابة أخرى | الخادم مشغول حالياً، يرجى إعادة المحاولة بعد ثوانٍ |

---

## 5. ضوابط العمل بدون اتصال والمزامنة (Offline-First Architecture)

1. **طابور العمليات دون اتصال (Offline Mutation Queue):**
   - في حال انقطاع الإنترنت أثناء محاولة تسجيل الحضور، يتم تسجيل الطلب محلياً في قاعدة بيانات الجهاز مع الإحداثيات والوقت المحلي الحقيقي وحالة التحقق من الـ Mock Location.
2. **منع التكرار (Idempotency Key):**
   - يحمل كل طلب معرّفاً فريداً (`client_mutation_id` بصيغة UUID v4). يتأكد السيرفر في `AuditLogs` من عدم تنفيذ نفس المفتاح مرتين.
3. **التدقيق غير القابل للتعديل (Append-Only Audit Log):**
   - كافة الحركات (نجاح، فشل، محاولة تزييف، اعتماد) تدون فوراً في ورقة `AuditLogs` متضمنة هوية المستخدم والجهاز والوقت بدقة.
