
import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

import 'package:path_provider/path_provider.dart';

class FileWorkProvider {
  Future<void> writeFile(Uint8List bytes, String title) async {
    var file = await getDownloadsDirectory();
  }
}