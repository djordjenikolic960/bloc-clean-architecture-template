import 'package:isar/isar.dart';

import '../source/source_embedded.dart';
part 'article_collection.g.dart';

@collection
class ArticleEntity {
  Id id = Isar.autoIncrement;

  late SourceEntity? source;
  late String? author;
  late String? title;
  late String? description;
  late String? url;
  late String? urlToImage;
  late DateTime? publishedAt;
  late String? content;
}
