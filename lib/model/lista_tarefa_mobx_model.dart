import 'package:contactsapp/model/tarefa_mobx_model.dart';
import 'package:mobx/mobx.dart';

part 'lista_tarefa_mobx_model.g.dart';

class ListaTarefaStore = _ListaTarefaStore with _$ListaTarefaStore;

abstract class _ListaTarefaStore with Store {
  @observable
  ObservableList<TarefaStore> _tarefas = ObservableList<TarefaStore>();

  @observable
  bool _apenasConcluidas = false;

  @computed
  bool get apenasConcluidas => _apenasConcluidas;

  @computed
  List<TarefaStore> get tarefas => _apenasConcluidas
      ? _tarefas.where((tarefa) => tarefa.concluido).toList()
      : _tarefas.toList();

  @action
  void toggleApenasConcluidas() {
    _apenasConcluidas = !_apenasConcluidas;
  }

  @action
  void adicionarTarefa(TarefaStore tarefa) {
    _tarefas.add(tarefa);
  }

  @action
  void removerTarefa(String id) {
    _tarefas.removeWhere((tarefa) => tarefa.id == id);
  }

  @action
  void alterarTarefa(String id, String descricao, bool concluido) {
    var tarefa = tarefas.firstWhere((tarefa) => tarefa.id == id);
    //tarefa.alterar(descricao, concluido);
    tarefa.descricao = descricao;
    tarefa.concluido = concluido;
  }
}
