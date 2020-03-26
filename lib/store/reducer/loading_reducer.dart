import 'package:redux/redux.dart';
import 'package:mon/store/action/actions.dart';

final loadingReducer = combineReducers<bool>([
   TypedReducer<bool, LoadingAction>( (state, action) => true),
   TypedReducer<bool, LoadCompleteAction>((state, action) => false),
]);

