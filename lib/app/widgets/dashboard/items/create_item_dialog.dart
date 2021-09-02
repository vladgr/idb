import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/stores/tag_store.dart';
import 'package:idb/app/widgets/form/input_wrapper.dart';
import 'package:idb/app/widgets/layout/app_button.dart';
import 'package:idb/app/widgets/layout/br.dart';

class CreateItemDialog extends StatefulWidget {
  CreateItemDialog({Key? key}) : super(key: key);

  @override
  _CreateItemDialogState createState() => _CreateItemDialogState();
}

class _CreateItemDialogState extends State<CreateItemDialog> {
  final _item = GetIt.I<ItemStore>();
  final _tag = GetIt.I<TagStore>();

  String _name = '';

  @override
  Widget build(BuildContext context) {
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
              name: 'name',
              hintText: L.t('Input item name'),
              errors: _item.errors,
              onChanged: (value) => setState(() => _name = value),
            ),
            BR(20),
            AppButton(
              text: 'Submit',
              isDisabled: false,
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
