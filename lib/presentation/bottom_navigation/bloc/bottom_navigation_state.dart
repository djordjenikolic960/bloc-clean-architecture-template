import 'package:equatable/equatable.dart';

import '../screen.dart';

abstract interface class BottomNavigationState extends Equatable {}

class BottomNavigationSelectedScreen extends BottomNavigationState {
  final Screen screen;

  BottomNavigationSelectedScreen(this.screen);

  @override
  List<Object?> get props => [screen];
}
