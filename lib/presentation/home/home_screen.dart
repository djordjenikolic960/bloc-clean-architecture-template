import '../../domain/entity/news_sort_options.dart';
import '../../l10n/localization_extension.dart';
import '../widgets/loading_widget.dart';
import 'bloc/news_bloc.dart';
import 'bloc/news_event.dart';
import 'bloc/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/di/service_locator.dart';
import 'widgets/article_widget.dart';
import 'widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => serviceLocator.get<NewsBloc>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
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
                  return ListView.builder(
                    itemCount: state.news!.articles.length,
                    itemBuilder: (context, index) =>
                        ArticleWidget(article: state.news!.articles[index]),
                  );
                } else if (state.isError) {
                  return const Center(
                    child: Text("error"),
                  );
                } else if (state.isLoading) {
                  return const LoadingWidget();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
