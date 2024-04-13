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
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: darkModeService.isDarkMode
                ? ThemeData.dark()
                : ThemeData.light(),
            home: MyHomePage(
              title: 'Tarefas',
              key: UniqueKey(),
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final TextEditingController descricaoController = TextEditingController();

  MyHomePage({required Key key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var darkModeService = Provider.of<DarkModeService>(context);
    var tarefaRepository = Provider.of<TarefasRepository>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            icon: darkModeService.isDarkMode
                ? const Icon(Icons.nights_stay)
                : const Icon(Icons.wb_sunny),
            onPressed: () {
              darkModeService.toggleDarkMode();
            },
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
                      tarefaRepository
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
                  itemCount: tarefaRepository.tarefas.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ListTile(
                        title: const Text('Mostrar apenas tarefas concluídas'),
                        trailing: Switch(
                          value: tarefaRepository.apenasConcluidas,
                          onChanged: (value) {
                            tarefaRepository.toggleApenasConcluidas();
                          },
                        ),
                      );
                    }
                    index -= 1;
                    var tarefa = tarefaRepository.tarefas[index];
                    return Dismissible(
                      key: Key(tarefa.id),
                      onDismissed: (direction) {
                        tarefaRepository.removeTarefa(tarefa.id);
                      },
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                          value: tarefa.concluida,
                          onChanged: (value) {
                            tarefa.concluida = value;
                            tarefaRepository.toggleConcluida(
                                tarefa.id, tarefa.concluida);
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
