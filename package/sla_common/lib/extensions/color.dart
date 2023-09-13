import 'package:flutter/material.dart';

extension ColorThemeStyles on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get splashColor => Theme.of(this).splashColor;

  Color get highlightColor => Theme.of(this).highlightColor;

  Color get hoverColor => Theme.of(this).hoverColor;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get canvasColor => Theme.of(this).cardColor;

  Color get dialogBackgroundColor => Theme.of(this).dialogBackgroundColor;

  Color get disabledColor => Theme.of(this).disabledColor;

  Color get dividerColor => Theme.of(this).dividerColor;

  Color get focusColor => Theme.of(this).focusColor;

  Color get hintColor => Theme.of(this).hintColor;

  Color get indicatorColor => Theme.of(this).indicatorColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get secondaryHeaderColor => Theme.of(this).secondaryHeaderColor;

  Color get shadowColor => Theme.of(this).shadowColor;

  Color get unselectedWidgetColor => Theme.of(this).unselectedWidgetColor;
}
