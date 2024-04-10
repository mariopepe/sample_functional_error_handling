import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetup_app/app/todo_bloc.dart';
import 'package:meetup_app/domain/home/i_todo_repo.dart';
import 'package:meetup_app/domain/home/todo.dart';
import 'package:meetup_app/injection.dart';
import 'package:meetup_app/presentation/core/todo_failure_l10n.dart';
import 'package:meetup_app/presentation/home/widgets/todo_card.dart';
import 'package:meetup_app/presentation/l10n/app_localizations_context.dart';

@RoutePage<String>()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(getIt<ITodoRepo>()),
      child: const HomePageContent(),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Sample App"),
          ),
          // body: const Center(child: Text("Data will go here")),
          body: state.map(
            initial: (initial) => const Text("Initial state"),
            loading: (loading) =>
                const Center(child: CircularProgressIndicator()),
            error: (error) => Center(
              child: Text(
                'Dear user, this is the error: '
                '${error.failure.toErrorMessage(l10n)}',
              ),
            ),
            success: (success) => ListView.builder(
              itemCount: success.todos.length,
              itemBuilder: (ctx, idx) {
                return TodoCard(success.todos[idx]);
              },
            ),
          ),

          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              context.read<TodoBloc>().add(TodoEvent.refreshTodos());
            },
          ),
        );
      },
    );
  }
}
