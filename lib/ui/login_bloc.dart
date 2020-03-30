import 'package:redux/redux.dart';
import 'package:mon/store/state/app_state.dart';
import 'package:mon/store/action/actions.dart';

class LoginBloc {
  final Store<AppState> _store;

  LoginBloc(this._store);

  void login(String token) {
    this._store.dispatch(LoginAction(token));
  }
}
