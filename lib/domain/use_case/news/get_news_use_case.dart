abstract class GetNewsUseCase {
  //todo create models for response
  Future<Map<String, dynamic>> get(
    String query,
    String fromDate,
    String sortBy,
  );
}
