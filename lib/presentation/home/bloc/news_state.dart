import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsFetchedSuccessful extends NewsState {
  final Map<String, dynamic> news;

  NewsFetchedSuccessful(this.news);

  @override
  List<Object?> get props => [news];
}

class NewsFetchedFailure extends NewsState {}
