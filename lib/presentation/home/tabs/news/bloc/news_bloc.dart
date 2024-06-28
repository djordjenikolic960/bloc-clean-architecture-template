import 'dart:async';

import 'package:bloc_event_transformers/bloc_event_transformers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/news_response_model.dart';
import '../../../../../domain/use_case/news/get_news_use_case.dart';
import '../../../../../domain/use_case/user/save_favourite_article_use_case.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase _getNewsUseCase;
  final SaveFavouriteArticleUseCase _saveFavouriteArticleUseCase;
  static const _debounceDurationInMilliseconds = 300;
  static const _minQueryLength = 2;

  NewsBloc(
    this._getNewsUseCase,
    this._saveFavouriteArticleUseCase,
  ) : super(NewsState.empty()) {
    on<SortOptionChange>(_emitSortOptionChange);
    on<SearchQueryChange>(
      _emitSearchQueryChange,
      transformer: debounce(
        const Duration(
          milliseconds: _debounceDurationInMilliseconds,
        ),
      ),
    );
    on<SaveFavouriteArticle>(_emitSaveFavouriteArticle);
  }

  FutureOr<void> _emitSortOptionChange(
    SortOptionChange event,
    Emitter<NewsState> emit,
  ) async {
    if (state.query.isNotEmpty && state.query.length > _minQueryLength) {
      emit(state.copyWith(isLoading: true, isError: false));
      try {
        final news = await _getNewsUseCase.get(
          state.query,
          "25-06-2024",
          event.newsSortOptions,
        );
        emit(state.copyWith(
          news: news,
          isLoading: false,
          isError: false,
          sortOption: event.newsSortOptions,
        ));
      } catch (e) {
        emit(state.copyWith(isError: true));
      }
    } else {
      emit(
        state.copyWith(
          news: NewsResponseModel.empty(),
        ),
      );
    }
  }

  FutureOr<void> _emitSearchQueryChange(
    SearchQueryChange event,
    Emitter<NewsState> emit,
  ) async {
    if (event.query.isNotEmpty && event.query.length > _minQueryLength) {
      emit(state.copyWith(isLoading: true, isError: false));
      try {
        final news = await _getNewsUseCase.get(
          event.query,
          "25-06-2024",
          state.sortOption,
        );
        emit(state.copyWith(
          query: event.query,
          news: news,
          isLoading: false,
          isError: false,
        ));
      } catch (e) {
        emit(state.copyWith(isError: true));
      }
    } else {
      emit(
        state.copyWith(
          query: event.query,
          news: NewsResponseModel.empty(),
        ),
      );
    }
  }

  FutureOr<void> _emitSaveFavouriteArticle(
    SaveFavouriteArticle event,
    Emitter<NewsState> emit,
  ) async {
    try {
      await _saveFavouriteArticleUseCase.save(event.article);
    } catch (e) {
      print(e);
    }
  }
}
