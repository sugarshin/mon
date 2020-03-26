import 'package:redux/redux.dart';
import 'package:mon/store/action/actions.dart';
import 'package:mon/model/build_entity.dart';

final buildsReducer = combineReducers<List<BuildEntity>>([
   TypedReducer<List<BuildEntity>, FetchRecentBuildsSucceededAction>(_setLoadedBuilds),
   TypedReducer<List<BuildEntity>, FetchRecentBuildsFailedAction>(_setNoBuilds),
]);

List<BuildEntity> _setLoadedBuilds(List<BuildEntity> builds, FetchRecentBuildsSucceededAction action) {
  return action.builds;
}

List<BuildEntity> _setNoBuilds(List<BuildEntity> builds, FetchRecentBuildsFailedAction action) {
  return [];
}
