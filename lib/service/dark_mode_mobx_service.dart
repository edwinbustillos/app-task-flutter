import 'package:mobx/mobx.dart';

part 'dark_mode_mobx_service.g.dart';

class DarkModeStore = _DarkModeStore with _$DarkModeStore;

abstract class _DarkModeStore with Store {
  // Cria um construtor privado
  _DarkModeStore._create();

  // Instância singleton
  final DarkModeStore _singleton = _DarkModeStore._create();

  // Método para acessar a instância singleton
  DarkModeStore get instance => _singleton;

  @observable
  bool isDarkMode = false;

  @action
  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
  }
}
