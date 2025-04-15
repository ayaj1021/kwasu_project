import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends StateNotifier<String> {
  SearchNotifier() : super('');

  void setSearchQuery(String query) {
    state = query;
  }
}

final searchNotifierProvider = StateNotifierProvider<SearchNotifier, String>(
  (ref) => SearchNotifier(),
);
