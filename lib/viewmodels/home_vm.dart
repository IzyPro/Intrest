import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intrests/models/interests_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<Interest> selected = <Interest>[];
  List<Interest> unSelected = <Interest>[];
  HomeViewModel(Reader read) {
    unSelected = getAllInterests();
  }

  List<Interest> getAllInterests() {
    return [
      Interest(id: 1, name: 'Football'),
      Interest(id: 2, name: 'Music'),
      Interest(id: 3, name: 'Medicine'),
      Interest(id: 4, name: 'Agriculture'),
      Interest(id: 5, name: 'Sports'),
      Interest(id: 6, name: 'Breakfast'),
      Interest(id: 7, name: 'Real Estate'),
      Interest(id: 8, name: 'Travel'),
      Interest(id: 9, name: 'Politics'),
      Interest(id: 10, name: 'Technology'),
      Interest(id: 11, name: 'Economy'),
      Interest(id: 12, name: 'Books'),
      Interest(id: 13, name: 'Movies'),
    ];
  }

  handleSelected(Interest interest) {
    selected.any((e) => e.id == interest.id)
        ? unSelect(interest)
        : select(interest);
    notifyListeners();
  }

  unSelect(Interest interest) {
    selected.removeWhere((e) => e.id == interest.id);
    unSelected.add(interest);
  }

  select(Interest interest) {
    selected.add(interest);
    unSelected.removeWhere((e) => e.id == interest.id);
  }

  void reset() {
    selected.clear();
    unSelected = getAllInterests();
    notifyListeners();
  }
}
