import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/di/service_locator.dart';
import '../../data/model/article_model.dart';
import '../../l10n/localization_extension.dart';
import '../../shared/constant.dart';
import '../../shared/dimens.dart';
import '../../shared/extension/build_context_extension.dart';
import '../../shared/extension/date_time_extension.dart';
import '../../shared/helpers/url_launcher_helper.dart';
import '../home/tabs/news/bloc/news_bloc.dart';
import '../home/tabs/news/bloc/news_event.dart';
import '../widgets/dialog/confirm_dialog.dart';
import 'bloc/article_bloc.dart';
import 'bloc/article_event.dart';
import 'bloc/article_state.dart';

class ArticleScreenData {
  final ArticleModel article;
  final bool isFromDatabase;

  ArticleScreenData(
    this.article,
    this.isFromDatabase,
  );
}

class ArticleScreen extends StatelessWidget {
  final ArticleScreenData articleScreenData;

  const ArticleScreen({
    super.key,
    required this.articleScreenData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArticleBloc, ArticleState>(
      listener: (_, state) {
        if (state is ArticleDeletedSuccess) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.l10n.article_deleted_successfully_message,
              ),
            ),
          );
        }
        if (state is ArticleDeletedFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.l10n.generic_error_message,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            articleScreenData.article.title != null
                ? articleScreenData.article.title!
                : Constant.emptyString,
          ),
          actions: [
            articleScreenData.isFromDatabase
                ? IconButton(
                    onPressed: () {
                      ConfirmDialog(
                        context.l10n.delete_article_dialog_title,
                        context.l10n.delete_article_dialog_text,
                        context.l10n.delete_article_button_positive,
                        positiveActionCallback: () {
                          context.read<ArticleBloc>().add(
                                DeleteArticle(
                                  articleScreenData.article,
                                ),
                              );
                        },
                        negativeButtonTitle:
                            context.l10n.delete_article_button_negative,
                      ).show(context);
                    },
                    icon: const Icon(Icons.delete_rounded),
                  )
                : IconButton(
                    onPressed: () {
                      serviceLocator.get<NewsBloc>().add(
                            SaveFavouriteArticle(articleScreenData.article),
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            context.l10n.article_saved_to_favourite,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.star_border_rounded),
                  ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              Dimens.size16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (articleScreenData.article.urlToImage != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Dimens.radius12,
                    ),
                    child: Image.network(
                      fit: BoxFit.fitWidth,
                      articleScreenData.article.urlToImage!,
                      errorBuilder: (context, exception, stackTrace) =>
                          //TODO add error widget
                          const Text('Your error widget...'),
                    ),
                  ),
                const SizedBox(
                  height: Dimens.size16,
                ),
                if (articleScreenData.article.title != null)
                  Text(
                    articleScreenData.article.title!,
                    style: context.textTheme.titleMedium,
                  ),
                const SizedBox(
                  height: Dimens.size4,
                ),
                if (articleScreenData.article.content != null)
                  Text(
                    articleScreenData.article.content!,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: Dimens.fontSize12,
                    ),
                  ),
                const SizedBox(
                  height: Dimens.size16,
                ),
                if (articleScreenData.article.url != null)
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: articleScreenData.article.url,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontSize: Dimens.fontSize12,
                            color: Colors.blue[900],
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              serviceLocator
                                  .get<UrlLauncherHelper>()
                                  .launchUrlWithExternalApplication(
                                      articleScreenData.article.url!);
                            },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: Dimens.size16,
                ),
                if (articleScreenData.article.publishedAt != null)
                  Row(
                    children: [
                      if (articleScreenData.article.source != null &&
                          articleScreenData.article.source?.name != null)
                        Text(
                          articleScreenData.article.source!.name!,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontSize: Dimens.fontSize12,
                            color: context.textTheme.bodyMedium?.color!
                                .withOpacity(0.9),
                          ),
                        ),
                      const Spacer(),
                      Text(
                        "${context.l10n.published_at_label}${articleScreenData.article.publishedAt!.toLocalDateFormat}",
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: Dimens.fontSize12,
                          color: context.textTheme.bodyMedium?.color!
                              .withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
