import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/stores/tag_store.dart';
import 'package:idb/app/widgets/dashboard/tags/tag_box.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class TagsCol extends StatelessWidget {
  const TagsCol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tag = GetIt.I<TagStore>();
    final _layout = GetIt.I<LayoutStore>();

    return Observer(builder: (BuildContext context) {
      final tags = _tag.tags;

      if (tags.length == 0) {
        return Empty();
      }

      return SizedBox(
        height: _layout.height * 0.9,
        child: ListView.builder(
          itemCount: tags.length,
          itemBuilder: (context, index) {
            if (index >= tags.length) {
              return Empty();
            }

            return Observer(builder: (BuildContext context) {
              final tag = tags[index];
              final isActive = _tag.selectedTags.contains(tag);

              return TagBox(
                tag: tag,
                isActive: isActive,
              );
            });
          },
        ),
      );
    });
  }
}
