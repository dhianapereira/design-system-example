// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:design_system_widgetbook/use_cases/buttons/ds_button_use_cases.dart'
    as _design_system_widgetbook_use_cases_buttons_ds_button_use_cases;
import 'package:design_system_widgetbook/use_cases/buttons/ds_icon_button_use_cases.dart'
    as _design_system_widgetbook_use_cases_buttons_ds_icon_button_use_cases;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookCategory(
    name: 'Components',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'Buttons',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DSButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Playground',
                builder:
                    _design_system_widgetbook_use_cases_buttons_ds_button_use_cases
                        .dsButtonPlaygroundUseCase,
              )
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'DSIconButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Playground',
                builder:
                    _design_system_widgetbook_use_cases_buttons_ds_icon_button_use_cases
                        .dsIconButtonPlaygroundUseCase,
              )
            ],
          ),
        ],
      )
    ],
  )
];
