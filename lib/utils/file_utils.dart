import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class FileUtils {
  static final validExtensions = ['.jpg', '.jpeg', '.png', '.pdf'];

  static Future<String?> processFile(String filePath, String prefix) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        print('File does not exist: $filePath');
        return null;
      }

      final extension = path.extension(filePath).toLowerCase();
      if (!validExtensions.contains(extension)) {
        print('Invalid file type: $extension');
        return null;
      }

      final bytes = await file.readAsBytes();
      final newFileName = '$prefix$extension';
      return await saveFile(newFileName, bytes);
    } catch (e) {
      print('Error processing file: $e');
      return null;
    }
  }

  static Future<String> saveFile(String fileName, List<int> bytes) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = path.join(directory.path, fileName);
      final file = File(filePath);
      await file.writeAsBytes(bytes);
      return filePath;
    } catch (e) {
      throw Exception('Failed to save file: $e');
    }
  }
}
