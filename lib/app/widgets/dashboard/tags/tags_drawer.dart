import 'package:flutter/material.dart';
import 'package:idb/app/widgets/dashboard/tags/tags_col.dart';

/// Used on Tablet and Mobile on right side
class TagsDrawer extends StatelessWidget {
  const TagsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: TagsCol(),
    );
  }
}
