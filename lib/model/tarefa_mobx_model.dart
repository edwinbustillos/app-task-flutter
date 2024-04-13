import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'tarefa_mobx_model.g.dart';

class TarefaStore = _TarefaStore with _$TarefaStore;

abstract class _TarefaStore with Store {
  final String id = UniqueKey().toString();
  _TarefaStore(this.descricao, this.concluido);

  @observable
  String descricao = "";

  @observable
  bool concluido = false;

  @action
  alterar(String pdescricao, bool pconcluido) {
    //descricao = pdescricao;
    concluido = !pconcluido;
  }

  @action
  void toggleConcluido() {
    concluido = !concluido;
  }
}
