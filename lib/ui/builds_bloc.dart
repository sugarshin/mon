import 'package:redux/redux.dart';
import 'package:mon/store/action/actions.dart';
import 'package:mon/store/state/app_state.dart';

class BuildsBloc {
  final Store<AppState> _store;

  BuildsBloc(this._store);

  void logout() {
    this._store.dispatch(LogoutAction());
  }
}
