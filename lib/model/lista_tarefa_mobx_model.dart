import 'package:contactsapp/model/tarefa_mobx_model.dart';
import 'package:mobx/mobx.dart';

part 'lista_tarefa_mobx_model.g.dart';

class ListaTarefaStore = _ListaTarefaStore with _$ListaTarefaStore;

abstract class _ListaTarefaStore with Store {
  @observable
  ObservableList<TarefaStore> tarefas = ObservableList<TarefaStore>();

  @action
  void adicionarTarefa(TarefaStore tarefa) {
    tarefas.add(tarefa);
  }

  @action
  void removerTarefa(String id) {
    tarefas.removeWhere((tarefa) => tarefa.id == id);
  }

  @action
  void alterarTarefa(String id, String descricao, bool concluido) {
    var tarefa = tarefas.firstWhere((tarefa) => tarefa.id == id);
    tarefa.alterar(descricao, concluido);
  }
}
