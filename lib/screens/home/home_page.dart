import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/blocs/form_editor_bloc/form_editor_bloc.dart';
import 'package:flutter_form_builder/blocs/preview/preview_bloc.dart';
import 'package:flutter_form_builder/blocs/responses/responses_bloc.dart';
import '../../router/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.formId});

  @PathParam()
  final String formId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FormEditorBloc()),
        BlocProvider(create: (context) => PreviewBloc()),
        BlocProvider(create: (context) => ResponsesBloc()),
      ],
      child: AutoTabsScaffold(
        routes: [
          FormBuilderRoute(formId: formId),
          PreviewRoute(formId: formId),
          ResponsesRoute(formId: formId),
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
      ),
    );
  }
}
