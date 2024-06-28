import 'tabs/news/bloc/news_bloc.dart';

import 'tabs/favourite_articles/bloc/favourite_articles_bloc.dart';
import 'tabs/favourite_articles/favourite_news_tab.dart';

import '../../shared/dimens.dart';

import '../../l10n/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/di/service_locator.dart';
import 'tabs/news/news_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (_) => serviceLocator.get<NewsBloc>(),
        ),
        BlocProvider<FavouriteArticlesBloc>(
          create: (_) => serviceLocator.get<FavouriteArticlesBloc>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(Dimens.size56),
              child: AppBar(
                bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: context.l10n.news_label,
                    ),
                    Tab(
                      text: context.l10n.favourite_label,
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: const [
                NewsTab(),
                FavouriteArticlesTab(),
              ],
            ),
          );
        },
      ),
    );
  }
}
