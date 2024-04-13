import 'package:flutter/material.dart';
import 'package:contactsapp/model/tarefa_provider_model.dart';

class TarefasRepository extends ChangeNotifier {
  final _tarefas = <Tarefa>[];
  var _apenasConcluidas = false;
  bool get apenasConcluidas => _apenasConcluidas;

  set apenasConcluidas(bool apenasConcluidas) {
    _apenasConcluidas = apenasConcluidas;
    notifyListeners();
  }

  get tarefas => _apenasConcluidas
      ? _tarefas.where((tarefa) => tarefa.concluida).toList()
      : _tarefas;

  void addTarefa(Tarefa tarefa) {
    _tarefas.add(tarefa);
    notifyListeners();
  }

  void removeTarefa(String id) {
    _tarefas.remove(_tarefas.firstWhere((tarefa) => tarefa.id == id));
    notifyListeners();
  }

  void modifyTarefa(Tarefa tarefa) {
    var index = _tarefas.indexWhere((element) => element.id == tarefa.id);
    _tarefas[index] = tarefa;
    notifyListeners();
  }

  void toggleConcluida(String id, bool concluido) {
    _tarefas.where((element) => element.id == id).first.concluida = concluido;
    notifyListeners();
  }

  void toggleApenasConcluidas() {
    _apenasConcluidas = !_apenasConcluidas;
    notifyListeners();
  }
}
