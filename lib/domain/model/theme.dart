import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeModel extends Equatable {
  final String name;
  final ThemeData themeData;

  const ThemeModel(this.name, this.themeData);

  @override
  List<Object?> get props => [
        name,
        themeData,
      ];
}
