class Request {
  final String name;
  final String description;
  final String status;

  Request({
    required this.name,
    required this.description,
    required this.status,
  });

  static Request fromJson(Map<String, dynamic> data) {
    return Request(
      name: data['name'] as String,
      description: data['userDescription'] as String,
      status: data['status'] as String,
    );
  }
}
