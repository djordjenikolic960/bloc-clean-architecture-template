import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../article/article_screen.dart';
import '../../../router/routes.dart';
import '../../widgets/article_widget.dart';
import 'bloc/favourite_articles_bloc.dart';
import 'bloc/favourite_articles_state.dart';

class FavouriteArticlesTab extends StatelessWidget {
  const FavouriteArticlesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteArticlesBloc, FavouriteArticlesState>(
      builder: (context, state) {
        if (state is FavouriteNewsFetchedSuccess) {
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) => ArticleWidget(
              article: state.articles[index],
              onTap: () => context.push(
                Routes.article.path,
                extra: ArticleScreenData(
                  article: state.articles[index],
                  isFromRemoteApi: false,
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
