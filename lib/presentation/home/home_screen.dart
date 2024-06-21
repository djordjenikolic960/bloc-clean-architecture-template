import '../widgets/loading_widget.dart';
import 'bloc/news_cubit.dart';
import 'bloc/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/di/service_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => serviceLocator.get<NewsCubit>()..getNews(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("News"),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.timer),
                onPressed: () {},
              ),
            ],
          ),
          body: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is LoadingWidget) {
                return const LoadingWidget();
              } else if (state is NewsFetchedSuccessful) {
                return Text(state.news.toString());
              } else if (state is NewsFetchedFailure) {
                return const Center(
                  child: Text("error"),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )),
    );
  }
}
