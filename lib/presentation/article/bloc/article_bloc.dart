import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/news/delete_article_use_case.dart';
import 'article_event.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final DeleteArticleUseCase _deleteArticleUseCase;

  ArticleBloc(
    this._deleteArticleUseCase,
  ) : super(ArticleInitialState()) {
    on<DeleteArticle>(_emitDeleteArticle);
  }

  FutureOr<void> _emitDeleteArticle(
    DeleteArticle event,
    Emitter<ArticleState> emit,
  ) async {
    try {
      await _deleteArticleUseCase.delete(event.article);
      emit(ArticleDeletedSuccess());
    } catch (e) {
      emit(ArticleDeletedFailure());
    }
  }
}
