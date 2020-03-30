import 'package:redux/redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mon/store/state/app_state.dart';

class BuildsBloc {
  final Store<AppState> _store;

  BuildsBloc(this._store);

  void logout() {
    this._store.dispatch(NavigateToAction.replace('/login'));
  }
}
