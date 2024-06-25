import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/news/get_news_use_case.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase _getNewsUseCase;

  NewsBloc(
    this._getNewsUseCase,
  ) : super(NewsState.empty()) {
    on<SortOptionChange>(_emitSortOptionChange);
    on<SearchQueryChange>(_emitSearchQueryChange);
  }

  FutureOr<void> _emitSortOptionChange(
    SortOptionChange event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsState(isLoading: true, isError: false));
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
      ));
    } catch (e) {
      emit(const NewsState(isError: true));
    }
  }

  FutureOr<void> _emitSearchQueryChange(
    SearchQueryChange event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsState(isLoading: true, isError: false));
    try {
      final news = await _getNewsUseCase.get(
        event.query,
        "25-06-2024",
        state.sortOption,
      );
      emit(state.copyWith(
        news: news,
        isLoading: false,
        isError: false,
      ));
    } catch (e) {
      emit(const NewsState(isError: true));
    }
  }
}
