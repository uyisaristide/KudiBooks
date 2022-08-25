import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeNotifier extends StateNotifier<ThemeMode?>{
  ModeNotifier() : super(null);
  void func(ThemeMode mode){
    state  = mode;
  }
}