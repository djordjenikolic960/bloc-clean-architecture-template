import 'package:equatable/equatable.dart';

import '../../../../../data/model/article_model.dart';
import '../../../../../domain/entity/news_sort_options.dart';

sealed class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SortOptionChange extends NewsEvent {
  final NewsSortOptions newsSortOptions;

  SortOptionChange(this.newsSortOptions);

  @override
  List<Object?> get props => [newsSortOptions];
}

class SearchQueryChange extends NewsEvent {
  final String query;

  SearchQueryChange(this.query);

  @override
  List<Object?> get props => [query];
}

class SaveFavouriteArticle extends NewsEvent {
  final ArticleModel article;

  SaveFavouriteArticle(this.article);

  @override
  List<Object?> get props => [article];
}
