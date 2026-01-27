import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager_task_board_presentation/features/create_task/create_task_bloc.dart';
import 'package:ui_kit/loader/_loader.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({required this.onComplete, super.key});

  final Function() onComplete;

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ValueNotifier<DateTime?> dueDateNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTaskBloc>(
      create: (context) => GetIt.I<CreateTaskBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text("Create a new task")),
        body: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              TextFormField(
                controller: titleController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: taskTitleValidationError,
                decoration: InputDecoration(labelText: "Title", hintText: "e.g. Create task it application"),
              ),

              TextFormField(
                controller: descriptionController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: taskDescriptionValidationError,
                decoration: InputDecoration(labelText: "Description", hintText: "e.g. Create tasks for doers"),
              ),

              ValueListenableBuilder(
                valueListenable: dueDateNotifier,
                builder: (context, dueDate, _) {
                  return ListTile(
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                      if (selectedDate == null) return;
                      dueDateNotifier.value = selectedDate;
                    },
                    title: Text("Due date"),
                    subtitle: Text(dueDate == null ? "Select a due date" : dueDate.toIso8601String()),
                    trailing: IconButton(
                      onPressed: () {
                        dueDateNotifier.value = null;
                      },
                      icon: Icon(Icons.cancel_outlined),
                    ),
                  );
                },
              ),

              BlocBuilder<CreateTaskBloc, CreateTaskState>(
                builder: (context, state) {
                  switch (state) {
                    case InitialCreateTaskState():
                      return ElevatedButton(
                        onPressed: () {
                          String title = titleController.text;
                          if (taskTitleValidationError(title) != null) return;

                          String description = descriptionController.text;
                          if (taskDescriptionValidationError(description) != null) return;

                          DateTime? dueDate = dueDateNotifier.value;

                          context.read<CreateTaskBloc>().add(
                            CreateANewTaskEvent(title: TaskTitleValue(title), description: TaskDescriptionValue(description), dueAt: dueDate),
                          );
                        },
                        child: Text("Submit"),
                      );

                    case LoadingCreateTaskState():
                      return InfinityLoader();
                    case SuccessCreateTaskState():
                      return TextButton(onPressed: widget.onComplete, child: Text("Continue"));
                    case ErrorCreateTaskState():
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(state.failure.message),
                          TextButton(
                            onPressed: () {
                              context.read<CreateTaskBloc>().add(ResetErrorEvent());
                            },
                            child: Text("Try again"),
                          ),
                        ],
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
