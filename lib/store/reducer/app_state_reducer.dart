import 'package:mon/store/reducer/loading_reducer.dart';
import 'package:mon/store/state/app_state.dart';
import 'package:mon/store/reducer/builds_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    builds: buildsReducer(state.builds, action),
  );
}
