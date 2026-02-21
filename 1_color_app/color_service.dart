import "dart:developer";

import "package:flutter/material.dart";
enum CardType { red,blue}

class ColorService extends ChangeNotifier {
  final Map<CardType,int>  _tapCounts = {
    CardType.red: 0,
    CardType.blue: 0,
  };
  int getTapcount(CardType type){
    return _tapCounts[type]!;
  }
  void increment(CardType type){
      _tapCounts[type]= (_tapCounts[type]! + 1) ;
      notifyListeners(); // tell UI to rebuild
  }
  
}

