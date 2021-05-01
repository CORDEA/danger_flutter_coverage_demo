import 'document.dart';

class DocumentRepository {
  Stream<Document> find(int id) => Future.delayed(Duration(milliseconds: 500))
      .then(
        (_) => Document(
          id: 1,
          title: 'title',
          description: 'description',
          body: 'body',
          status: DocumentStatus.hold,
        ),
      )
      .asStream();

  Stream<DocumentStatus> updateStatus(DocumentStatus status) =>
      Future.delayed(Duration(milliseconds: 500))
          .then((_) => status)
          .asStream();
}
