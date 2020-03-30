import 'package:redux/redux.dart';
import 'package:mon/store/action/actions.dart';

final authenticationReducer = combineReducers<String>([
   TypedReducer<String, LoginAction>(_setToken),
   TypedReducer<String, LogoutAction>((state, action) => ''),
]);

String _setToken(String token, LoginAction action) {
  return action.token;
}
