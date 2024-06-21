abstract class NewsRepository {
  Future<Map<String, dynamic>> get(
    String query,
    String fromDate,
    String sortBy,
  );
}
