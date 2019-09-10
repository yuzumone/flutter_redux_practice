import 'package:redux/redux.dart';
import 'app_state.dart';
import 'action.dart';
import 'api.dart';

void fetchTdlAttractionListMiddleware(
    Store<AppState> store, action, NextDispatcher next) {
  switch (action) {
    case FetchTdlAttractionListAction:
      {
        final client = TdrClient();
        client.fetchTdlAttraction().then((attractions) {
          next(FetchTdlAttractionListAction(attractions));
        });
        break;
      }
  }
  next(action);
}

void fetchTdsAttractionListMiddleware(
    Store<AppState> store, action, NextDispatcher next) {
  switch (action) {
    case FetchTdsAttractionListAction:
      {
        final client = TdrClient();
        client.fetchTdlAttraction().then((attractions) {
          next(FetchTdlAttractionListAction(attractions));
        });
        break;
      }
  }
  next(action);
}
