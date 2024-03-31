// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_tarefa_mobx_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListaTarefaStore on _ListaTarefaStore, Store {
  late final _$tarefasAtom =
      Atom(name: '_ListaTarefaStore.tarefas', context: context);

  @override
  ObservableList<TarefaStore> get tarefas {
    _$tarefasAtom.reportRead();
    return super.tarefas;
  }

  @override
  set tarefas(ObservableList<TarefaStore> value) {
    _$tarefasAtom.reportWrite(value, super.tarefas, () {
      super.tarefas = value;
    });
  }

  late final _$_ListaTarefaStoreActionController =
      ActionController(name: '_ListaTarefaStore', context: context);

  @override
  void adicionarTarefa(TarefaStore tarefa) {
    final _$actionInfo = _$_ListaTarefaStoreActionController.startAction(
        name: '_ListaTarefaStore.adicionarTarefa');
    try {
      return super.adicionarTarefa(tarefa);
    } finally {
      _$_ListaTarefaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerTarefa(String id) {
    final _$actionInfo = _$_ListaTarefaStoreActionController.startAction(
        name: '_ListaTarefaStore.removerTarefa');
    try {
      return super.removerTarefa(id);
    } finally {
      _$_ListaTarefaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarTarefa(String id, String descricao, bool concluido) {
    final _$actionInfo = _$_ListaTarefaStoreActionController.startAction(
        name: '_ListaTarefaStore.alterarTarefa');
    try {
      return super.alterarTarefa(id, descricao, concluido);
    } finally {
      _$_ListaTarefaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas}
    ''';
  }
}
