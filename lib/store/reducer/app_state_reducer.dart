import 'package:mon/store/reducer/loading_reducer.dart';
import 'package:mon/store/state/app_state.dart';
import 'package:mon/store/reducer/builds_reducer.dart';
import 'package:mon/store/reducer/authentication_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    builds: buildsReducer(state.builds, action),
    token: authenticationReducer(state.token, action),
  );
}
