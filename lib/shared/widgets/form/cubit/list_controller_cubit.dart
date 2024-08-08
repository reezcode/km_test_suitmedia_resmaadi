import 'package:flutter_bloc/flutter_bloc.dart';

class ListController extends Cubit<List<dynamic>> {
  ListController() : super([]);

  void refresh() {
    emit(state);
  }

  void update(List<dynamic> data) {
    emit(data);
  }

  void add(dynamic data) {
    final List<dynamic> currentState = state;
    currentState.add(data);
    emit(currentState);
  }

  void addAll(List<dynamic> data) {
    final List<dynamic> currentState = state;
    currentState.addAll(data);
    emit(currentState);
  }

  void remove(dynamic data) {
    final List<dynamic> currentState = state;
    currentState.remove(data);
    emit(currentState);
  }

  void clear() {
    emit([]);
  }
}
