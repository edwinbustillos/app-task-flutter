// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_tarefa_mobx_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListaTarefaStore on _ListaTarefaStore, Store {
  Computed<bool>? _$apenasConcluidasComputed;

  @override
  bool get apenasConcluidas => (_$apenasConcluidasComputed ??= Computed<bool>(
          () => super.apenasConcluidas,
          name: '_ListaTarefaStore.apenasConcluidas'))
      .value;
  Computed<List<TarefaStore>>? _$tarefasComputed;

  @override
  List<TarefaStore> get tarefas =>
      (_$tarefasComputed ??= Computed<List<TarefaStore>>(() => super.tarefas,
              name: '_ListaTarefaStore.tarefas'))
          .value;

  late final _$_tarefasAtom =
      Atom(name: '_ListaTarefaStore._tarefas', context: context);

  @override
  ObservableList<TarefaStore> get _tarefas {
    _$_tarefasAtom.reportRead();
    return super._tarefas;
  }

  @override
  set _tarefas(ObservableList<TarefaStore> value) {
    _$_tarefasAtom.reportWrite(value, super._tarefas, () {
      super._tarefas = value;
    });
  }

  late final _$_apenasConcluidasAtom =
      Atom(name: '_ListaTarefaStore._apenasConcluidas', context: context);

  @override
  bool get _apenasConcluidas {
    _$_apenasConcluidasAtom.reportRead();
    return super._apenasConcluidas;
  }

  @override
  set _apenasConcluidas(bool value) {
    _$_apenasConcluidasAtom.reportWrite(value, super._apenasConcluidas, () {
      super._apenasConcluidas = value;
    });
  }

  late final _$_ListaTarefaStoreActionController =
      ActionController(name: '_ListaTarefaStore', context: context);

  @override
  void toggleApenasConcluidas() {
    final _$actionInfo = _$_ListaTarefaStoreActionController.startAction(
        name: '_ListaTarefaStore.toggleApenasConcluidas');
    try {
      return super.toggleApenasConcluidas();
    } finally {
      _$_ListaTarefaStoreActionController.endAction(_$actionInfo);
    }
  }

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
apenasConcluidas: ${apenasConcluidas},
tarefas: ${tarefas}
    ''';
  }
}
