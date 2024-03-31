// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dark_mode_mobx_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DarkModeStore on _DarkModeStore, Store {
  late final _$isDarkModeAtom =
      Atom(name: '_DarkModeStore.isDarkMode', context: context);

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$_DarkModeStoreActionController =
      ActionController(name: '_DarkModeStore', context: context);

  @override
  void toggleDarkMode() {
    final _$actionInfo = _$_DarkModeStoreActionController.startAction(
        name: '_DarkModeStore.toggleDarkMode');
    try {
      return super.toggleDarkMode();
    } finally {
      _$_DarkModeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode}
    ''';
  }
}
