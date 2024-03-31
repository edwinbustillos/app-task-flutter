import 'package:contactsapp/model/tarefa_provider_model.dart';
import 'package:contactsapp/repository/tarefas_repository.dart';
import 'package:contactsapp/service/dark_mode_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppProvider extends StatelessWidget {
  const MyAppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(
            create: (BuildContext context) => DarkModeService()),
        ChangeNotifierProvider<TarefasRepository>(
            create: (BuildContext context) => TarefasRepository()),
      ],
      child: Consumer<DarkModeService>(
        builder: (context, darkModeService, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: darkModeService.isDarkMode
                ? ThemeData.dark()
                : ThemeData.light(),
            home: MyHomePage(title: 'Tarefas'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  // Remove the unused field _tarefas
  // final _tarefas = [];
  final TextEditingController descricaoController = TextEditingController();
  final bool apenasConcluidas = false;

  //MyHomePage({super.key, required this.title});
  MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var darkModeService = Provider.of<DarkModeService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          const Text('Dark:'),
          Switch(
              value: darkModeService.isDarkMode,
              onChanged: (value) {
                darkModeService.toggleDarkMode();
              }),
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
                      Provider.of<TarefasRepository>(context, listen: false)
                          .addTarefa(Tarefa(descricaoController.text, false));
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
            child: Consumer<TarefasRepository>(
              builder: (_, tarefaRepository, Widget) {
                return ListView.builder(
                  itemCount: tarefaRepository.tarefas.length,
                  itemBuilder: (context, index) {
                    var tarefa = tarefaRepository.tarefas[index];
                    return Dismissible(
                      key: Key(tarefa.id),
                      onDismissed: (direction) {
                        Provider.of<TarefasRepository>(context, listen: false)
                            .removeTarefa(tarefa.id);
                      },
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                          value: tarefa.concluida,
                          onChanged: (value) {
                            tarefa.concluida = value;
                            Provider.of<TarefasRepository>(context,
                                    listen: false)
                                .toggleConcluida(tarefa.id, tarefa.concluida);
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
