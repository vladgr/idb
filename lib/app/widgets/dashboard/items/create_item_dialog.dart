import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/scaffold_service.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/stores/tag_store.dart';
import 'package:idb/app/widgets/form/error_block.dart';
import 'package:idb/app/widgets/form/input_wrapper.dart';
import 'package:idb/app/widgets/layout/app_button.dart';
import 'package:idb/app/widgets/layout/br.dart';

class CreateItemDialog extends StatefulWidget {
  const CreateItemDialog({Key? key}) : super(key: key);

  @override
  _CreateItemDialogState createState() => _CreateItemDialogState();
}

class _CreateItemDialogState extends State<CreateItemDialog> {
  final _item = GetIt.I<ItemStore>();
  final _layout = GetIt.I<LayoutStore>();
  final _tag = GetIt.I<TagStore>();
  final _scaffold = GetIt.I<ScaffoldService>();

  final String _content = 'content';
  String _name = '';

  @override
  void dispose() {
    _item.clearErrors();
    super.dispose();
  }

  bool get _isDisabled {
    if (_item.isInprogress) return true;
    if (_name.trim().isEmpty) return true;
    return false;
  }

  Future<void> _onSubmit() async {
    final List<int> ids = _tag.selectedTags.map((x) => x.id).toList();
    final bool isCreated = await _item.createItem(_name, _content, ids);

    if (isCreated) {
      _scaffold.createAlert('Item created', seconds: 1);
      _layout.searchController.text = _name;
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      final tagNames = _tag.selectedTags.map((x) => x.name).join(', ');

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
                'Create item for tags: $tagNames',
                style: Ts.bold16(Config.gray108Color),
              ),
              BR(L.v(20)),
              InputWrapper(
                autofocus: true,
                name: 'name',
                hintText: 'Input item name',
                errors: _item.errors,
                onChanged: (value) => setState(() => _name = value),
              ),
              BR(20),
              ErrorBlock(errors: _item.errors),
              AppButton(
                text: 'Submit',
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
