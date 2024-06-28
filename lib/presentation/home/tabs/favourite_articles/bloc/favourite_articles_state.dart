import 'package:equatable/equatable.dart';

import '../../../../../data/model/article_model.dart';

abstract class FavouriteArticlesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitState extends FavouriteArticlesState {}

class FavouriteNewsFetchedSuccess extends FavouriteArticlesState {
  final List<ArticleModel> articles;

  FavouriteNewsFetchedSuccess(this.articles);

  @override
  List<Object?> get props => [articles];
}

class FavouriteNewsFetchedFailure extends FavouriteArticlesState {
  final String? error;

  FavouriteNewsFetchedFailure(this.error);

  @override
  List<Object?> get props => [error];
}
