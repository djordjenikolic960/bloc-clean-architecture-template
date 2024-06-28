import 'package:equatable/equatable.dart';

abstract class ArticleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ArticleDeletedSuccess extends ArticleState {}

class ArticleDeletedFailure extends ArticleState {}

class ArticleInitialState extends ArticleState {}
