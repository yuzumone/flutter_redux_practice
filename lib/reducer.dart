import 'package:redux/redux.dart';
import 'app_state.dart';
import 'action.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    tdlAttractionList: tdlAttractionReducer(state.tdlAttractionList, action),
    tdsAttractionList: tdsAttractionReducer(state.tdsAttractionList, action),
  );
}

final tdlAttractionReducer = combineReducers<List<Map<String, String>>>([
  TypedReducer(_setTdlAttractionList),
]);

List<Map<String, String>> _setTdlAttractionList(
    List<Map<String, String>> attractions,
    FetchTdlAttractionListAction action) {
  return action.attractions;
}

final tdsAttractionReducer = combineReducers<List<Map<String, String>>>([
  TypedReducer(_setTdsAttractionList),
]);

List<Map<String, String>> _setTdsAttractionList(
    List<Map<String, String>> attractions,
    FetchTdsAttractionListAction action) {
  return action.attractions;
}
