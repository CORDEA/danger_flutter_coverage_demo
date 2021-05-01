class Document {
  Document({
    required this.id,
    required this.title,
    required this.description,
    required this.body,
    required this.status,
  });

  final int id;
  final String title;
  final String description;
  final String body;
  final DocumentStatus status;
}

enum DocumentStatus {
  approve,
  reject,
  hold,
}
