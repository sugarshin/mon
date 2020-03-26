import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:mon/store/action/actions.dart';
import 'package:mon/store/middleware/fetch_recent_builds_midleware.dart';
import 'package:mon/store/reducer/app_state_reducer.dart';
import 'package:mon/store/state/app_state.dart';
import 'package:mon/repository/builds_impl.dart';
import 'package:mon/ui/builds_page.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(Mon());
}

class Mon extends StatelessWidget {
  static BuildsImpl buildsImpl = BuildsImpl();

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: [fetchRecentBuildsMiddleware(buildsImpl), new LoggingMiddleware.printer()],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'mon',
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: StoreConnector<AppState, bool>(
          distinct: true,
          onInit: (store) => store.dispatch(FetchRecentBuildsAction()),
          converter: (store) => true,
          builder: (context, _) {
            return BuildsPage();
         },
        ),
      ),
    );
  }
}
