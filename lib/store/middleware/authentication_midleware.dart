import 'package:redux/redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mon/store/action/actions.dart';
import 'package:mon/store/state/app_state.dart';

Middleware<AppState> authenticationMiddleware() {
  return TypedMiddleware<AppState, LoginAction>((store, action, next) {
    next(action);
    if (action.token != '') {
      store.dispatch(NavigateToAction.push('/builds'));
    }
  });
}

Middleware<AppState> logoutMiddleware() {
  return TypedMiddleware<AppState, LogoutAction>((store, action, next) {
    next(action);
    store.dispatch(NavigateToAction.popUntil(
      predicate: (route) {
        return route.settings.name == '/';
      }
    ));
  });
}
