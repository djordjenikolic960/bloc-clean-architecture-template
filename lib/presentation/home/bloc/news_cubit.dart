import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/news/get_news_use_case.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetNewsUseCase _getNewsUseCase;

  NewsCubit(
    this._getNewsUseCase,
  ) : super(NewsInitial());

  getNews() async {
    emit(NewsLoading());
    try {
      final news = await _getNewsUseCase.get(
        "Apple",
        "24-06-2024",
        "popularity",
      );
      emit(NewsFetchedSuccessful(news));
    } catch (e) {
      emit(NewsFetchedFailure());
    }
  }
}
