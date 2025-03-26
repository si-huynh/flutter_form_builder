import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/blocs/form_editor_bloc/form_editor_bloc.dart';
import 'package:flutter_form_builder/blocs/forms/forms_bloc.dart';
import 'package:flutter_form_builder/widgets/paragraph_question.dart';
import 'package:gap/gap.dart';
import '../../blocs/responses/responses_bloc.dart';
import '../../models/form_model.dart';
import '../../models/question_model.dart';
import '../../models/response_model.dart';

@RoutePage()
class ResponsesPage extends StatefulWidget {
  const ResponsesPage({
    super.key,
    required this.formId,
  });

  @PathParam()
  final String formId;

  @override
  State<ResponsesPage> createState() => _ResponsesPageState();
}

class _ResponsesPageState extends State<ResponsesPage> {
  @override
  void initState() {
    super.initState();
    // Ensure form is loaded when page is created - will be called after first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadFormIfAvailable();
    });
  }

  void _loadFormIfAvailable() {
    final formState = context.read<FormsBloc>().state;
    if (formState case FormsStateLoaded(:final forms)) {
      final form = forms.firstWhere((form) => form.id == widget.formId);
      context.read<ResponsesBloc>().add(LoadResponsesEvent(form));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormEditorBloc, FormEditorState>(
      listenWhen: (previous, current) => current is FormEditorStateLoaded,
      listener: (context, state) {
        if (state case FormEditorStateLoaded(:final form)) {
          context.read<ResponsesBloc>().add(LoadResponsesEvent(form));
        }
      },
      builder: (context, state) {
        return switch (state) {
          FormEditorStateLoaded(:final form) => ResponsesView(form: form),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

class ResponsesView extends StatelessWidget {
  const ResponsesView({
    required this.form,
    super.key,
  });

  final FormModel form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responses'),
      ),
      body: BlocBuilder<ResponsesBloc, ResponsesState>(
        builder: (context, state) {
          return switch (state) {
            ResponsesStateInitial() =>
              const Center(child: Text('No responses yet')),
            ResponsesStateLoading() =>
              const Center(child: CircularProgressIndicator()),
            ResponsesStateLoaded(:final responses, :final aggregation) =>
              _buildResponsesList(context, responses, aggregation),
            ResponsesStateError(:final message) => Center(child: Text(message)),
          };
        },
      ),
    );
  }

  Widget _buildResponsesList(
    BuildContext context,
    List<ResponseModel> responses,
    Map<String, dynamic> aggregation,
  ) {
    if (responses.isEmpty) {
      return const Center(child: Text('No responses yet'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Summary',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Gap(16),
        ...form.questions.map(
          (question) => _buildQuestionSummary(
            context,
            question,
            aggregation[question.id],
          ),
        ),
        const Gap(32),
        Text(
          'Individual Responses',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Gap(16),
        ...responses.map((response) => _buildResponseCard(context, response)),
      ],
    );
  }

  Widget _buildQuestionSummary(
    BuildContext context,
    QuestionModel question,
    aggregatedData,
  ) {
    if (aggregatedData == null) {
      return const SizedBox.shrink();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(8),
            if (question case MultipleChoiceQuestion())
              _buildMultipleChoiceSummary(
                context,
                _safeMultipleChoiceData(aggregatedData),
              )
            else if (question case ParagraphQuestion())
              _buildParagraphSummary(
                context,
                _safeParagraphData(aggregatedData),
              ),
          ],
        ),
      ),
    );
  }

  // Helper method to safely convert aggregated data to the expected Map format
  Map<String, int> _safeMultipleChoiceData(data) {
    if (data is Map<String, int>) {
      return data;
    } else if (data is Map) {
      // Try to convert from a dynamic Map to the expected type
      final result = <String, int>{};
      data.forEach((key, value) {
        if (key is String && value is int) {
          result[key] = value;
        } else if (key is String && value != null) {
          // Try to convert numeric values
          result[key] = int.tryParse(value.toString()) ?? 0;
        }
      });
      return result;
    }
    // Return empty Map as fallback
    return {};
  }

  // Helper method to safely convert aggregated data to the expected List format
  List<String> _safeParagraphData(data) {
    if (data is List<String>) {
      return data;
    } else if (data is List) {
      // Convert any list to list of strings
      return data
          .map((item) => item?.toString() ?? '')
          .where((item) => item.isNotEmpty)
          .toList();
    }
    // Return empty List as fallback
    return [];
  }

  Widget _buildMultipleChoiceSummary(
    BuildContext context,
    Map<String, int> counts,
  ) {
    final total = counts.values.fold<int>(0, (sum, count) => sum + count);
    if (total == 0) {
      return const Text('No responses');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: counts.entries.map((entry) {
        final percentage = (entry.value / total * 100).toStringAsFixed(1);
        return Text('${entry.key}: ${entry.value} ($percentage%)');
      }).toList(),
    );
  }

  Widget _buildParagraphSummary(
    BuildContext context,
    List<String>? answers,
  ) {
    if (answers == null || answers.isEmpty) {
      return const Text('No responses');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${answers.length} responses'),
        const Gap(8),
        ...answers.map((answer) => Text('• $answer')),
      ],
    );
  }

  Widget _buildResponseCard(BuildContext context, ResponseModel response) {
    return Card(
      child: ListTile(
        title: Text(
          'Response ${response.id.substring(0, 8)}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          'Submitted on ${response.submittedAt.toString()}',
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            context.read<ResponsesBloc>().add(
                  DeleteResponseEvent(response.id, form),
                );
          },
        ),
        onTap: () {
          // TODO: Navigate to response details
        },
      ),
    );
  }
}
