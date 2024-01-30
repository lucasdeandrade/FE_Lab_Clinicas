import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig(
      {super.key,
      this.bindings,
      this.pages,
      this.pagesBuilders,
      this.modulos,
      required this.title});

  final ApplicationBindings? bindings;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modulos;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
        debugMode: kDebugMode,
        bindings: bindings,
        pages: [...pages ?? [], ...pagesBuilders ?? []],
        builder: (context, routes, flutterGetItNavObserver) {
          return AsyncStateBuilder(
            loader: LabClinicasLoader(),
            builder: (navigatorObserver) {
              return MaterialApp(
                navigatorObservers: [
                  navigatorObserver,
                  flutterGetItNavObserver
                ],
                routes: routes,
                title: title,
              );
            },
          );
        });
  }
}
