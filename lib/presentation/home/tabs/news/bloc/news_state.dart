import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../data/model/news_response_model.dart';
import '../../../../../domain/entity/news_sort_options.dart';
import '../../../../../shared/constant.dart';

@immutable
class NewsState extends Equatable {
  final String query;
  final String date;
  final NewsSortOptions sortOption;
  final NewsResponseModel? news;
  final bool isLoading;
  final bool isError;

  const NewsState({
    this.query = Constant.emptyString,
    this.date = Constant.emptyString,
    this.sortOption = NewsSortOptions.relevancy,
    this.news,
    this.isError = false,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
        query,
        date,
        sortOption,
        news,
        isError,
        isLoading,
      ];

  factory NewsState.empty() {
    return const NewsState(
      query: Constant.emptyString,
      date: "24-06-2024",
      sortOption: NewsSortOptions.relevancy,
      news: null,
      isError: false,
      isLoading: false,
    );
  }

  NewsState copyWith({
    final String? query,
    final String? date,
    final NewsSortOptions? sortOption,
    final NewsResponseModel? news,
    final bool? isLoading,
    final bool? isError,
  }) {
    return NewsState(
      query: query ?? this.query,
      date: date ?? this.date,
      sortOption: sortOption ?? this.sortOption,
      news: news ?? this.news,
      isLoading: isLoading ?? false,
      isError: isError ?? false,
    );
  }
}
