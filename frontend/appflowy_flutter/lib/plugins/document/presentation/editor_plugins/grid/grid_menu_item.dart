import 'package:appflowy/generated/locale_keys.g.dart';
import 'package:appflowy/plugins/document/presentation/editor_plugins/base/link_to_page_widget.dart';
import 'package:appflowy/plugins/document/presentation/editor_plugins/base/selectable_svg_widget.dart';
import 'package:appflowy_backend/protobuf/flowy-folder2/view.pb.dart';
import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

SelectionMenuItem referenceGridMenuItem = SelectionMenuItem(
  name: LocaleKeys.document_plugins_referencedGrid.tr(),
  icon: (editorState, onSelected, style) => SelectableSvgWidget(
    name: 'editor/grid',
    isSelected: onSelected,
    style: style,
  ),
  keywords: ['referenced', 'grid', 'database'],
  handler: (editorState, menuService, context) {
    final container = Overlay.of(context);
    showLinkToPageMenu(
      container,
      editorState,
      menuService,
      ViewLayoutPB.Grid,
    );
  },
);
