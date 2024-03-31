import 'package:flutter/material.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluida = false;

  Tarefa(this._descricao, this._concluida);

  String get id => _id;
  String get descricao => _descricao;
  bool get concluida => _concluida;

  set descricao(String descricao) {
    _descricao = descricao;
  }

  set concluida(bool concluida) {
    _concluida = concluida;
  }
}
