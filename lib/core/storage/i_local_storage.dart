/// واجهة التخزين المحلي الموحدة في التطبيق
abstract interface class ILocalStorage {
  /// تهيئة محرك التخزين وفتح الحاويات (Boxes)
  Future<void> init();

  /// كتابة قيمة
  Future<void> write(String boxName, String key, dynamic value);

  /// قراءة قيمة
  Future<T?> read<T>(String boxName, String key);

  /// قراءة كافة القيم في الحاوية
  Future<List<dynamic>> readAll(String boxName);

  /// حذف مفتاح محدد
  Future<void> delete(String boxName, String key);

  /// تفريغ حاوية بالكامل
  Future<void> clear(String boxName);

  /// فحص وجود مفتاح
  Future<bool> containsKey(String boxName, String key);
}
