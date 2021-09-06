import 'dart:io';
import 'dart:typed_data';

import 'package:clipboard/clipboard.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/constants/enums.dart';
import 'package:idb/app/services/helpers.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/scaffold_service.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/upload_store.dart';
import 'package:idb/app/widgets/layout/app_button.dart';
import 'package:idb/app/widgets/layout/br.dart';
import 'package:mime/mime.dart';

class UploadImageDialog extends StatefulWidget {
  final PlatformFile file;

  UploadImageDialog({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _UploadImageDialogState createState() => _UploadImageDialogState();
}

class _UploadImageDialogState extends State<UploadImageDialog> {
  final _scaffold = GetIt.I<ScaffoldService>();
  final _upload = GetIt.I<UploadStore>();

  @override
  void dispose() {
    _upload.clearErrors();
    super.dispose();
  }

  bool get _isDisabled {
    if (_upload.isInprogress) return true;
    return false;
  }

  Future<void> _onSubmit() async {
    final mimeType = lookupMimeType(this.widget.file.name);

    if (mimeType == null) {
      _scaffold.createAlert('Can not detect mime type of the file.');
      return;
    }

    // Sign upload
    final result = await _upload.signUpload(this.widget.file.name, mimeType);
    if (result.isError) {
      _scaffold.createAlert('Can not sign url for upload. Something went wrong.', type: AlertType.error);
      return;
    }

    final signedUrl = result.data['signed_url'];
    final uploadTo = result.data['upload_to'];

    print(signedUrl);

    Uint8List bytes;

    if (isWeb) {
      bytes = this.widget.file.bytes!;
    } else {
      final File f = File(this.widget.file.path);
      bytes = await f.readAsBytes();
    }

    final bool isUploaded = await _upload.uploadFile(signedUrl, bytes, mimeType);

    if (isUploaded) {
      // Image info to copy to clipboard and can be inserted in any place of content.
      String info = '[img:$uploadTo]';

      await FlutterClipboard.copy(info);

      _scaffold.createAlert('Image info copied to clipboard', seconds: 1);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Center(
        child: Container(
          width: L.v(300),
          padding: EdgeInsets.all(L.v(20)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(L.v(5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Upload image',
                style: Ts.bold16(Config.gray108Color),
              ),
              BR(20),
              Text('File: ${this.widget.file.name}'),
              BR(10),
              AppButton(
                text: 'Upload file',
                isDisabled: _isDisabled,
                onPressed: _onSubmit,
              ),
            ],
          ),
        ),
      );
    });
  }
}
