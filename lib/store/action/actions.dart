import 'package:mon/model/build_entity.dart';

class LoadCompleteAction {}

class LoadingAction {}

class FetchRecentBuildsAction {
  const FetchRecentBuildsAction();
}

class FetchRecentBuildsSucceededAction {
  final List<BuildEntity> builds;

  const FetchRecentBuildsSucceededAction(this.builds);
}

class FetchRecentBuildsFailedAction {
  final Exception error;

  const FetchRecentBuildsFailedAction(this.error);
}
