import 'package:redux/redux.dart';
import 'package:mon/model/builds_dto.dart';
import 'package:mon/store/action/actions.dart';
import 'package:mon/store/state/app_state.dart';
import 'package:mon/repository/builds_impl.dart';

Middleware<AppState> fetchRecentBuildsMiddleware(
  BuildsImpl buildsImpl,
) {
  return TypedMiddleware<AppState, FetchRecentBuildsAction>(
    _load(buildsImpl),
  );
}

void Function(
  Store<AppState> store,
  FetchRecentBuildsAction action,
  NextDispatcher next,
) _load(
  BuildsImpl buildsImpl,
) {
  return (store, action, next) {
    next(action);
    next(LoadingAction());
    buildsImpl.fetchRecent(store.state.token)
      .then((BuildsDto dto) {
        next(FetchRecentBuildsSucceededAction(dto.builds));
      })
      .catchError((error) {
        next(FetchRecentBuildsFailedAction(error));
      })
      .whenComplete(() => next(LoadCompleteAction()));
  };
}
