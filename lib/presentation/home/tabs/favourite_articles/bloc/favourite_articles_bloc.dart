import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/article_model.dart';
import '../../../../../domain/use_case/news/get_favourite_articles_use_case.dart';
import 'favourite_articles_event.dart';
import 'favourite_articles_state.dart';

class FavouriteArticlesBloc
    extends Bloc<FavouriteArticlesEvent, FavouriteArticlesState> {
  final GetFavouriteArticlesUseCase _getFavouriteArticlesUseCase;
  late StreamSubscription<List<ArticleModel>>? _favouriteArticlesSubscription;

  FavouriteArticlesBloc(
    this._getFavouriteArticlesUseCase,
  ) : super(InitState()) {
    on<PresentFavoriteArticles>(_emitPresentFavouriteArticles);
    _favouriteArticlesSubscription =
        _getFavouriteArticlesUseCase.get().listen((articles) {
      add(PresentFavoriteArticles(articles));
    });
  }

  FutureOr<void> _emitPresentFavouriteArticles(
    PresentFavoriteArticles event,
    Emitter<FavouriteArticlesState> emit,
  ) {
    emit(FavouriteNewsFetchedSuccess(event.articles));
  }

  @override
  Future<void> close() {
    _favouriteArticlesSubscription?.cancel();
    return super.close();
  }
}
