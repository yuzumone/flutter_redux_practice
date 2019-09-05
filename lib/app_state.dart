import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<Map<String, String>> tdlAttractionList;
  final List<Map<String, String>> tdsAttractionList;

  AppState({
    this.tdlAttractionList,
    this.tdsAttractionList,
  });

  factory AppState.initial() {
    return AppState(
      tdlAttractionList: [],
      tdsAttractionList: [],
    );
  }

  AppState copyWith({
    List<Map<String, String>> tdlAttractionList,
    List<Map<String, String>> tdsAttractionList,
  }) {
    return AppState(
      tdlAttractionList: tdlAttractionList ?? this.tdlAttractionList,
      tdsAttractionList: tdsAttractionList ?? this.tdsAttractionList,
    );
  }
}
