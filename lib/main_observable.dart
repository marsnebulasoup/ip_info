import 'package:bloc/bloc.dart';

class MainObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(
        '${bloc.runtimeType} | ${transition.event}\n\t${transition.currentState} --> ${transition.nextState}\n\n-');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
