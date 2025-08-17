// tool/generate_exports.dart
import 'dart:io';

void main() {
  final libDir = Directory('lib');
  final exportFile = File('lib/google_services.dart');

  final buffer = StringBuffer();

  for (final file in libDir.listSync(recursive: true)) {
    if (file is File &&
        file.path.endsWith('.dart') &&
        !file.path.endsWith('google_services.dart')) {
      String raw = file.path.replaceAll("\\", "/");
      final relativePath = raw.replaceFirst('lib/', 'package:google_services/');
      if(!relativePath.endsWith(".g.dart") && !relativePath.contains("/model")){
        buffer.writeln("export '$relativePath';");
      }
    }
  }

  exportFile.writeAsStringSync(buffer.toString());
}
