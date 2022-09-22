import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHomeObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('onChange $change');
  }

  @override
  void onClose(BlocBase bloc) {
    print('onClose $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    print('onCreate $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('onEvent $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition $transition');
  }
}
