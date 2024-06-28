import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/model/article_model.dart';

@immutable
class ArticleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteArticle extends ArticleEvent {
  final ArticleModel article;

  DeleteArticle(this.article);

  @override
  List<Object?> get props => [article];
}