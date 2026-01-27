import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager_task_board_presentation/features/view_my_created_tasks/view_my_created_tasks_bloc.dart';

class ViewMyCreatedTasksScreen extends StatefulWidget {
  const ViewMyCreatedTasksScreen({required this.goToCreateNewTaskScreen, super.key});

  final Function() goToCreateNewTaskScreen;

  @override
  State<ViewMyCreatedTasksScreen> createState() => _ViewMyCreatedTasksScreenState();
}

class _ViewMyCreatedTasksScreenState extends State<ViewMyCreatedTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<ViewMyCreatedTasksBloc>()..add(LoadMoreOfMyTasksEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Task board")),
        body: BlocBuilder<ViewMyCreatedTasksBloc, ViewMyCreatedTasksState>(
          builder: (context, state) {
            var tasks = context.read<ViewMyCreatedTasksBloc>().taskList;
            debugPrint("Tasks are ${tasks.length}");

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, i) {
                TaskEntity task = tasks[i];
                return ListTile(title: Text(task.title.value), subtitle: Text(task.description.value));
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton.small(
            onPressed: widget.goToCreateNewTaskScreen,
            child: Icon(Icons.add),
        ),
      ),
    );
  }
}
