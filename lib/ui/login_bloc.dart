import 'package:redux/redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mon/store/state/app_state.dart';

class LoginBloc {
  final Store<AppState> _store;

  LoginBloc(this._store);

  void login() {
    this._store.dispatch(NavigateToAction.replace('/builds'));
  }
}
