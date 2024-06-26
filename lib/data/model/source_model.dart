class SourceModel {
  SourceModel({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
