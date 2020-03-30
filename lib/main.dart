import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mon/store/middleware/authentication_midleware.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:mon/store/middleware/fetch_recent_builds_midleware.dart';
import 'package:mon/store/reducer/app_state_reducer.dart';
import 'package:mon/store/state/app_state.dart';
import 'package:mon/repository/builds_impl.dart';
import 'package:mon/ui/builds_page.dart';
import 'package:mon/ui/login_page.dart';

void main() async {
  await DotEnv().load();

  BuildsImpl buildsImpl = BuildsImpl();

  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  final initialState = await persistor.load();

  final store = Store<AppState>(
    appReducer,
    initialState: initialState ?? AppState.loading(),
    middleware: [NavigationMiddleware(), authenticationMiddleware(), logoutMiddleware(), fetchRecentBuildsMiddleware(buildsImpl), new LoggingMiddleware.printer()],
  );

  if (initialState.token != '') {
    store.dispatch(NavigateToAction.replace('/builds'));
  }

  runApp(Mon(store: store));
}

class Mon extends StatelessWidget {
  final Store<AppState> store;

  const Mon({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'mon',
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        navigatorKey: NavigatorHolder.navigatorKey,
        onGenerateRoute: _getRoute,
      ),
    );
  }

  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return _buildRoute(settings, LoginPage());
      case '/builds':
        return _buildRoute(settings, BuildsPage());
      default:
        return _buildRoute(settings, LoginPage());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }
}
