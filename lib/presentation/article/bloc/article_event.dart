import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/model/article_model.dart';

@immutable
abstract class ArticleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteArticle extends ArticleEvent {
  final ArticleModel article;

  DeleteArticle(this.article);

  @override
  List<Object?> get props => [article];
}

class UpdateFavouriteStatus extends ArticleEvent {
  final ArticleModel article;

  UpdateFavouriteStatus(this.article);

  @override
  List<Object?> get props => [article];
}

class CheckArticleInDb extends ArticleEvent {
  final ArticleModel article;

  CheckArticleInDb(this.article);

  @override
  List<Object?> get props => [article];
}
