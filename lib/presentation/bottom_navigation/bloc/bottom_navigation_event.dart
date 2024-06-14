import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../screen.dart';


@immutable
abstract interface class BottomNavigationEvent extends Equatable {}

class BottomNavigationTabChanged extends BottomNavigationEvent {
  final Screen selectedScreen;

  BottomNavigationTabChanged(this.selectedScreen);

  @override
  List<Object?> get props => [selectedScreen];
}
