import 'dart:async';

import 'package:bloc_event_transformers/bloc_event_transformers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/news_response_model.dart';
import '../../../../../domain/use_case/news/get_news_use_case.dart';
import '../../../../../shared/extension/date_time_extension.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase _getNewsUseCase;
  static const _debounceDurationInMilliseconds = 300;
  static const _minQueryLength = 2;

  NewsBloc(
    this._getNewsUseCase,
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
          DateTime.now().toSearchDateFormat,
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
          DateTime.now().toSearchDateFormat,
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
}
