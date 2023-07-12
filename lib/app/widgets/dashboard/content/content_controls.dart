import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/services/helpers.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/scaffold_service.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/constants/enums.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:idb/app/widgets/dashboard/items/upload_image_dialog.dart';

class ContentControls extends StatelessWidget {
  final Item item;

  ContentControls({
    Key? key,
    required this.item,
  }) : super(key: key);

  final _item = GetIt.I<ItemStore>();
  final _scaffold = GetIt.I<ScaffoldService>();
  final _user = GetIt.I<UserStore>();

  double get _iconSize {
    return L.v(20);
  }

  Future<void> _onPressSave(BuildContext context) async {
    _item.updateItemFromUI(item);
  }

  Future<void> _onPressUpload(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      final file = result.files.first;

      // ignore: use_build_context_synchronously
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => UploadImageDialog(file: file),
      );
    }
  }

  Future<void> _onPressDelete(BuildContext context) async {
    await showConfirmDialog(
      context,
      'Are you sure?',
      'Item: ${item.name} will be deleted.',
      'Delete',
      _onPressDeleteConfirm,
    );
  }

  Future<void> _onPressDeleteConfirm() async {
    bool isDeleted = await _item.deleteItem(item.guid);
    if (isDeleted) {
      _item.postDeleteItem();
      _scaffold.createAlert('Item deleted');
    } else {
      _scaffold.createAlert('Something went wrong!', type: AlertType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      double opacity = _item.isEditModeEnabled ? 1 : 0;

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_user.isAdmin)
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 500),
              child: AbsorbPointer(
                absorbing: !_item.isEditModeEnabled,
                child: IconButton(
                  constraints: BoxConstraints(),
                  onPressed: () => _onPressSave(context),
                  icon: Icon(
                    Icons.save,
                    color: Config.gray108Color,
                    size: _iconSize,
                  ),
                ),
              ),
            ),
          if (_user.isAdmin)
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 500),
              child: AbsorbPointer(
                absorbing: !_item.isEditModeEnabled,
                child: IconButton(
                  constraints: BoxConstraints(),
                  onPressed: () => _onPressUpload(context),
                  icon: Icon(
                    Icons.upload,
                    color: Config.gray108Color,
                    size: _iconSize,
                  ),
                ),
              ),
            ),
          if (_user.isAdmin)
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 500),
              child: AbsorbPointer(
                absorbing: !_item.isEditModeEnabled,
                child: IconButton(
                  constraints: BoxConstraints(),
                  onPressed: () => _onPressDelete(context),
                  icon: Icon(
                    Icons.delete,
                    color: Config.gray108Color,
                    size: _iconSize,
                  ),
                ),
              ),
            ),
          if (_item.isEditModeEnabled)
            IconButton(
              constraints: BoxConstraints(),
              onPressed: () => _item.setEditModeEnabled(false),
              icon: Icon(
                Icons.arrow_right_alt,
                color: Config.gray108Color,
                size: _iconSize,
              ),
            ),
          if (!_item.isEditModeEnabled)
            IconButton(
              constraints: BoxConstraints(),
              onPressed: () => _item.setEditModeEnabled(true),
              icon: Icon(
                Icons.wysiwyg,
                color: Config.gray108Color,
                size: _iconSize,
              ),
            ),
        ],
      );
    });
  }
}
