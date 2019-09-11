import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'app_state.dart';
import 'reducer.dart';
import 'middleware.dart';
import 'action.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      fetchTdlAttractionListMiddleware,
      fetchTdsAttractionListMiddleware,
    ],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: StoreConnector<AppState, bool>(
          distinct: true,
          onInit: (store) => store.dispatch(FetchTdlAttractionListAction),
          builder: (context, _) {
            return AttractionPage();
          },
          converter: (store) => true,
        ),
      ),
    );
  }
}

class AttractionPage extends StatefulWidget {
  @override
  createState() {
    return AttractionState();
  }
}

class AttractionState extends State<AttractionPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel> (
      converter: (Store store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        var list = vm.tdlAttractionList;
        return Scaffold(
          appBar: AppBar(
            title: Text('title'),
          ),
          body: Center(
            child: Text(list.toString()),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final List<Map<String, String>> tdlAttractionList;
  final List<Map<String, String>> tdsAttractionList;

  _ViewModel({
    @required this.tdlAttractionList,
    @required this.tdsAttractionList,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
      tdlAttractionList: store.state.tdlAttractionList,
      tdsAttractionList: store.state.tdsAttractionList,
    );
  }
}
