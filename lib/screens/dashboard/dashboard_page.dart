import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/blocs/forms/forms_bloc.dart';
import 'package:flutter_form_builder/blocs/responses/responses_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import 'package:gap/gap.dart';
import 'package:uuid/uuid.dart';

import '../../router/app_router.gr.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    // Load forms when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FormsBloc>().add(const FormsEventLoads());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Dashboard'),
      ),
      body: BlocBuilder<FormsBloc, FormsState>(
        builder: (context, state) {
          return switch (state) {
            FormsStateInitial() => const SizedBox.shrink(),
            FormsStateLoading() =>
              const Center(child: CircularProgressIndicator()),
            FormsStateLoaded(:final forms) => _buildFormsGrid(context, forms),
            FormsStateError(:final message) =>
              Center(child: Text('Error: $message')),
          };
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'create_new_form',
        tooltip: 'Create New Form',
        onPressed: _createNewForm,
        label: const Text('Create New Form'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFormsGrid(BuildContext context, List<FormModel> forms) {
    if (forms.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note_alt_outlined, size: 64, color: Colors.grey),
            Gap(16),
            Text(
              'No forms yet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Gap(8),
            Text(
              'Tap the + button to create a new form',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: forms.length,
      itemBuilder: (context, index) {
        final form = forms[index];
        return _buildFormCard(context, form);
      },
    );
  }

  Widget _buildFormCard(BuildContext context, FormModel form) {
    return GestureDetector(
      onTap: () => _openForm(form),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      form.title.isNotEmpty ? form.title : 'Untitled Form',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (form.description.isNotEmpty) ...[
                      const Gap(8),
                      Text(
                        form.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const Gap(8),
                    Text(
                      '${form.questions.length} questions',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, size: 20),
                    onPressed: () => _openForm(form),
                    tooltip: 'Edit',
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, size: 20),
                    onPressed: () => _deleteForm(form),
                    tooltip: 'Delete',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createNewForm() {
    // Create a new form with a unique ID
    final newForm = FormModel(
      id: const Uuid().v4(),
      title: 'New Form',
    );

    // Add the form to the state
    context.read<FormsBloc>().add(FormsEvent.addForm(newForm));

    // Navigate to the form editor and load the form
    context.router.push(HomeRoute(formId: newForm.id));
  }

  void _openForm(FormModel form) {
    // Navigate to preview page
    context.router.push(HomeRoute(formId: form.id));
  }

  void _deleteForm(FormModel form) {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Form'),
        content: Text(
          'Are you sure you want to delete "${form.title.isNotEmpty ? form.title : 'Untitled Form'}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<FormsBloc>().add(FormsEvent.deleteForm(form.id));
              context.read<ResponsesBloc>().add(
                    DeleteResponsesEvent(form.id),
                  );
            },
            child: const Text('DELETE'),
          ),
        ],
      ),
    );
  }
}
