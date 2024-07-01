import 'package:go_router/go_router.dart';

import '../../../../shared/dimens.dart';
import '../../../article/article_screen.dart';
import '../../../router/routes.dart';
import '../../widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/news_sort_options.dart';
import '../../../../l10n/localization_extension.dart';
import '../../../widgets/loading_widget.dart';
import '../../widgets/article_widget.dart';
import '../../../widgets/error_widget.dart' as error;
import 'bloc/news_bloc.dart';
import 'bloc/news_event.dart';
import 'bloc/news_state.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.size8,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: SearchWidget(
            onSearchQueryChanged: (value) {
              context.read<NewsBloc>().add(SearchQueryChange(value));
            },
          ),
          actions: [
            PopupMenuButton<NewsSortOptions>(
              icon: const Icon(Icons.sort_outlined),
              onSelected: (sortOption) {
                context.read<NewsBloc>().add(
                      SortOptionChange(
                        sortOption,
                      ),
                    );
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: NewsSortOptions.relevancy,
                  child: Text(
                    context.l10n.sort_option_relevancy,
                  ),
                ),
                PopupMenuItem(
                  value: NewsSortOptions.popularity,
                  child: Text(
                    context.l10n.sort_option_popularity,
                  ),
                ),
                PopupMenuItem(
                  value: NewsSortOptions.publishedAt,
                  child: Text(
                    context.l10n.sort_option_published_at,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state.news != null) {
              if (state.news!.articles.isEmpty) {
                return Center(
                  child: Text(
                    context.l10n.no_results_label,
                  ),
                );
              }
              return ListView.builder(
                itemCount: state.news!.articles.length,
                itemBuilder: (context, index) => ArticleWidget(
                  article: state.news!.articles[index],
                  onTap: () => context.push(
                    Routes.article.path,
                    extra: ArticleScreenData(
                      article: state.news!.articles[index],
                      isFromRemoteApi: true,
                    ),
                  ),
                ),
              );
            } else if (state.isError) {
              return const error.ErrorWidget();
            } else if (state.isLoading) {
              return const LoadingWidget();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
