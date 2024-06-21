import 'package:equatable/equatable.dart';

class WaterIntakeEntity extends Equatable {
  final double waterIntake;
  final DateTime dateTime;

  const WaterIntakeEntity({
    required this.waterIntake,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [
        waterIntake,
        dateTime,
      ];
}
