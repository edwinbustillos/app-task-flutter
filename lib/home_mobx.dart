import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:contactsapp/model/lista_tarefa_mobx_model.dart';
import 'package:contactsapp/model/tarefa_mobx_model.dart';
import 'package:contactsapp/service/dark_mode_mobx_service.dart';
//import 'package:mobx/mobx.dart';

class MyAppMobx extends StatelessWidget {
  const MyAppMobx({super.key, superKey});

  @override
  Widget build(BuildContext context) {
    var darkModeStore = DarkModeStore();
    return Observer(
      builder: (_) => MaterialApp(
        title: 'Flutter Demo',
        theme: darkModeStore.isDarkMode ? ThemeData.dark() : ThemeData.light(),
        home: MyHomePage(title: 'Tarefas'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ListaTarefaStore listaTarefasStore = ListaTarefaStore();
  final DarkModeStore darkModeStore = DarkModeStore();
  final TextEditingController descricaoController = TextEditingController();
  //var listaTarefasStore = ListaTarefaStore();

  final String title;
  final bool apenasConcluidas = false;
  //var darkModeStore = DarkModeStore();
  MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          const Text('Dark:'),
          Observer(
            builder: (_) => Switch(
              value: darkModeStore.isDarkMode,
              onChanged: (value) {
                darkModeStore.toggleDarkMode();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descricaoController.clear();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Adicionar tarefa'),
                content: TextField(
                  controller: descricaoController,
                  decoration: const InputDecoration(labelText: 'Descrição'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      listaTarefasStore.adicionarTarefa(
                          TarefaStore(descricaoController.text, false));
                      Navigator.of(context).pop();
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Adicionar tarefa',
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (context) {
                return ListView.builder(
                  itemCount: listaTarefasStore.tarefas.length,
                  itemBuilder: (context, index) {
                    var tarefa = listaTarefasStore.tarefas[index];
                    return Dismissible(
                      key: Key(tarefa.id),
                      onDismissed: (direction) {
                        listaTarefasStore.removerTarefa(tarefa.id);
                      },
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                          value: tarefa.concluido,
                          onChanged: (value) {
                            tarefa.concluido = value;
                            listaTarefasStore.alterarTarefa(
                                tarefa.id, tarefa.descricao, tarefa.concluido);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
