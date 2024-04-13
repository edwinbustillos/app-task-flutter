import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:contactsapp/model/lista_tarefa_mobx_model.dart';
import 'package:contactsapp/model/tarefa_mobx_model.dart';
import 'package:contactsapp/service/dark_mode_mobx_service.dart';

final darkModeStore = DarkModeStore();
final listaTarefasStore = ListaTarefaStore();

class MyAppMobx extends StatelessWidget {
  const MyAppMobx({super.key, superKey});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: darkModeStore.isDarkMode ? ThemeData.dark() : ThemeData.light(),
        home: MyHomePage(title: 'Tarefas'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController descricaoController = TextEditingController();
  final String title;

  bool apenasConcluidas = false;

  MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          const Text('Tema:'),
          Observer(
            builder: (_) => IconButton(
              icon: Icon(
                darkModeStore.isDarkMode
                    ? Icons.nightlight_round
                    : Icons.wb_sunny,
              ),
              onPressed: () {
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
                  itemCount: listaTarefasStore.tarefas.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ListTile(
                        title: const Text('Mostrar apenas tarefas concluídas'),
                        trailing: Observer(
                          builder: (_) => Switch(
                            value: listaTarefasStore.apenasConcluidas,
                            onChanged: (value) {
                              listaTarefasStore.toggleApenasConcluidas();
                            },
                          ),
                        ),
                      );
                    }
                    index -= 1;
                    var tarefa = listaTarefasStore.tarefas[index];
                    return Dismissible(
                      key: Key(tarefa.id),
                      onDismissed: (direction) {
                        listaTarefasStore.removerTarefa(tarefa.id);
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Observer(
                          builder: (_) => Switch(
                            value: tarefa.concluido,
                            onChanged: (value) {
                              tarefa.toggleConcluido();
                            },
                          ),
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
