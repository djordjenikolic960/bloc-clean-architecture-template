import 'package:equatable/equatable.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object?> get props => [];
}

class ArticleInitialState extends ArticleState {
  const ArticleInitialState();
}

class ArticleLoadSuccess extends ArticleState {
  const ArticleLoadSuccess();
}

class ArticleDeletedSuccess extends ArticleState {
  const ArticleDeletedSuccess();
}

class ArticleDeletedFailure extends ArticleState {
  const ArticleDeletedFailure();
}

class ArticleAddedToFavourites extends ArticleState {
  const ArticleAddedToFavourites();
}

class ArticleAddToFavouritesFailure extends ArticleState {
  const ArticleAddToFavouritesFailure();
}

class ArticleRemovedFromFavourites extends ArticleState {
  const ArticleRemovedFromFavourites();
}

class ArticleRemoveFromFavouritesFailure extends ArticleState {
  const ArticleRemoveFromFavouritesFailure();
}
