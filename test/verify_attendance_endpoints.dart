import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final baseUrl =
      'https://script.google.com/macros/s/AKfycbwW7Ii78ftHFew0g2wxCfyWVaiax3VI9g2NtgMFdd8uocI2GaBWcnm1PhQov7Q4-nY4/exec';

  final endpoints = [
    {'name': 'system.getConfig', 'query': 'action=system.getConfig'},
    {
      'name': 'attendance.getSettings (Alias)',
      'query': 'action=attendance.getSettings',
    },
    {'name': 'shifts.getAll', 'query': 'action=shifts.getAll'},
    {
      'name': 'attendance.getShifts (Alias)',
      'query': 'action=attendance.getShifts',
    },
    {
      'name': 'notifications.get',
      'query': 'action=notifications.get&user_id=USR-002',
    },
    {
      'name': 'attendance.getTodayStatus',
      'query': 'action=attendance.getTodayStatus&user_id=USR-002',
    },
    {'name': 'sites.getAll', 'query': 'action=sites.getAll'},
    {
      'name': 'attendance.getSites (Alias)',
      'query': 'action=attendance.getSites',
    },
    {
      'name': 'attendance.getRecords',
      'query': 'action=attendance.getRecords&user_id=USR-002&limit=5',
    },
  ];

  final client = HttpClient();

  print('====================================================');
  print('       Al-Fateh API Live Verification Test          ');
  print('====================================================');

  for (final ep in endpoints) {
    final url = '$baseUrl?${ep['query']}';
    final sw = Stopwatch()..start();
    try {
      final req = await client.getUrl(Uri.parse(url));
      req.followRedirects = true;
      final res = await req.close();
      final body = await utf8.decoder.bind(res).join();
      sw.stop();

      final json = jsonDecode(body) as Map<String, dynamic>;
      final success = json['success'] == true;

      print('\n[${ep['name']}]');
      print(
        'Status: ${res.statusCode} | Latency: ${sw.elapsedMilliseconds}ms | Success: $success',
      );
      if (success) {
        // Print snippet of data
        final keys = json.keys.where((k) => k != 'success').toList();
        print('Keys returned: $keys');
        for (final k in keys) {
          final val = json[k];
          if (val is List) {
            print('  -> $k: Count = ${val.length}');
          } else if (val is Map) {
            print(
              '  -> $k: ${jsonEncode(val).substring(0, val.toString().length > 100 ? 100 : val.toString().length)}...',
            );
          } else {
            print('  -> $k: $val');
          }
        }
      } else {
        print('Error / Message: ${json['message'] ?? json['error']}');
      }
    } catch (e) {
      sw.stop();
      print('FAILED: $e');
    }
    // Small delay between calls to prevent rate-limiting
    await Future.delayed(const Duration(milliseconds: 500));
  }

  client.close();
  print('\n====================================================');
  print('              Test Execution Completed              ');
  print('====================================================');
}
