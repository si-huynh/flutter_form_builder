import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/blocs/forms/forms_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import '../../router/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.formId});

  @PathParam()
  final String formId;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        FormBuilderRoute(),
        PreviewRoute(),
        ResponsesRoute(),
      ],
      lazyLoad: false,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_document),
              label: 'Builder',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.preview),
              label: 'Preview',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Responses',
            ),
          ],
        );
      },
    );
  }
}

abstract class HomePageChild<T extends Bloc<Event, State>, Event, State>
    extends StatelessWidget implements AutoRouteWrapper {
  const HomePageChild({super.key});

  Event initEvent(FormModel form);

  T get bloc;

  Widget get child;

  bool shouldReloadForm(BuildContext context) => true;

  @override
  Widget wrappedRoute(BuildContext context) {
    final form = onReloadForm(context);
    if (form != null) {
      return BlocProvider(
        create: (context) => bloc..add(initEvent(form)),
        child: this,
      );
    }
    return this;
  }

  @override
  Widget build(BuildContext context) {
    if (shouldReloadForm(context)) {
      return BlocConsumer<FormsBloc, FormsState>(
        listener: (context, state) {
          final form = onReloadForm(context);
          if (form != null) {
            bloc.add(initEvent(form));
          }
        },
        builder: (context, state) {
          return child;
        },
      );
    }
    return child;
  }

  FormModel? onReloadForm(BuildContext context) {
    final args = context.tabsRouter.routeData.route.args as HomeRouteArgs;
    final formId = args.formId;
    final formsState = context.read<FormsBloc>().state;
    if (formsState case FormsStateLoaded(:final forms)) {
      final form = forms.firstWhere((form) => form.id == formId);
      return form;
    }
    return null;
  }
}
