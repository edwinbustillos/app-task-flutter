import 'package:mobx/mobx.dart';

part 'dark_mode_mobx_service.g.dart';

class DarkModeStore = _DarkModeStore with _$DarkModeStore;

abstract class _DarkModeStore with Store {
  @observable
  bool isDarkMode = false;

  @action
  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
  }
}
