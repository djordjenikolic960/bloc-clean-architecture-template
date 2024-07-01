import 'package:equatable/equatable.dart';

import '../../../../../data/model/article_model.dart';

abstract class FavouriteArticlesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializeFavouriteArticlesStream extends FavouriteArticlesEvent {}

class PresentFavoriteArticles extends FavouriteArticlesEvent {
  final List<ArticleModel> articles;

  PresentFavoriteArticles(this.articles);

  @override
  List<Object?> get props => [articles];
}
