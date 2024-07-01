import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/news/check_article_in_database_use_case.dart';
import '../../../domain/use_case/news/delete_article_use_case.dart';
import '../../../domain/use_case/user/save_favourite_article_use_case.dart';
import 'article_event.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final DeleteArticleUseCase _deleteArticleUseCase;
  final AddArticleToFavouritesUseCase _addArticleToFavouritesUseCase;
  final CheckArticleInDatabaseUseCase _checkArticleInDatabaseUseCase;

  bool isInDatabase = false;

  ArticleBloc(
    this._deleteArticleUseCase,
    this._addArticleToFavouritesUseCase,
    this._checkArticleInDatabaseUseCase,
  ) : super(const ArticleInitialState()) {
    on<DeleteArticle>(_emitDeleteArticle);
    on<CheckArticleInDb>(_emitCheckArticleInDb);
    on<UpdateFavouriteStatus>(_emitUpdateFavouriteStatus);
  }

  FutureOr<void> _emitDeleteArticle(
    DeleteArticle event,
    Emitter<ArticleState> emit,
  ) async {
    try {
      await _deleteArticleUseCase.delete(event.article);
      isInDatabase = false;
      emit(const ArticleDeletedSuccess());
    } catch (e) {
      emit(const ArticleDeletedFailure());
    }
  }

  FutureOr<void> _emitCheckArticleInDb(
    CheckArticleInDb event,
    Emitter<ArticleState> emit,
  ) async {
    try {
      isInDatabase = await _checkArticleInDatabaseUseCase.check(event.article);
      emit(const ArticleLoadSuccess());
    } catch (e) {
      isInDatabase = false;
      emit(const ArticleLoadSuccess());
    }
  }

  FutureOr<void> _emitUpdateFavouriteStatus(
    UpdateFavouriteStatus event,
    Emitter<ArticleState> emit,
  ) async {
    try {
      if (isInDatabase) {
        await _deleteArticleUseCase.delete(event.article);
        isInDatabase = false;
        emit(const ArticleRemovedFromFavourites());
      } else {
        await _addArticleToFavouritesUseCase.add(event.article);
        isInDatabase = true;
        emit(const ArticleAddedToFavourites());
      }
    } catch (e) {
      if (isInDatabase) {
        emit(const ArticleRemoveFromFavouritesFailure());
      } else {
        emit(const ArticleAddToFavouritesFailure());
      }
    }
  }
}
