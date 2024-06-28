import '../data_source/local/database/collections/source/source_embedded.dart';
import '../model/source_model.dart';

class SourceConverter {
  SourceEntity toEntity(SourceModel? source) => SourceEntity()
    ..id = source?.id
    ..name = source?.name;

  SourceModel fromEntity(SourceEntity? source) => SourceModel(
        id: source?.id,
        name: source?.name,
      );
}
