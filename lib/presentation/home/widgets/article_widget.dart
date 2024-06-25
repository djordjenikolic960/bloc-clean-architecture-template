import 'package:flutter/material.dart';

import '../../../data/model/article_model.dart';
import '../../../shared/dimens.dart';
import '../../../shared/extension/build_context_extension.dart';
import '../../../shared/extension/date_time_extension.dart';

class ArticleWidget extends StatelessWidget {
  static const _titleMaxLines = 2;
  static const _contentMaxLines = 2;
  final ArticleModel article;

  const ArticleWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.black38,
      margin: const EdgeInsets.symmetric(
        horizontal: Dimens.size16,
        vertical: Dimens.size8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.radius12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.size12,
          vertical: Dimens.size16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (article.urlToImage != null)
              Expanded(
                flex: 40,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: Dimens.size16,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Dimens.radius12,
                    ),
                    child: Image.network(
                      fit: BoxFit.fitWidth,
                      article.urlToImage!,
                      errorBuilder: (context, exception, stackTrace) =>
                          //TODO add error widget
                          const Text('Your error widget...'),
                    ),
                  ),
                ),
              ),
            Expanded(
              flex: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (article.title != null)
                    Text(
                      article.title!,
                      maxLines: _titleMaxLines,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(
                    height: Dimens.size4,
                  ),
                  if (article.content != null)
                    Text(
                      maxLines: _contentMaxLines,
                      overflow: TextOverflow.ellipsis,
                      article.content!,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: Dimens.fontSize12,
                      ),
                    ),
                  const SizedBox(
                    height: Dimens.size4,
                  ),
                  if (article.publishedAt != null)
                    Text(
                      article.publishedAt!.toLocalDateFormat,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: Dimens.fontSize12,
                        color: context.textTheme.bodyMedium?.color!
                            .withOpacity(0.9),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
