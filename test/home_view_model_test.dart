import 'dart:async';

import 'package:danger_flutter_coverage_demo/document.dart';
import 'package:danger_flutter_coverage_demo/document_repository.dart';
import 'package:danger_flutter_coverage_demo/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([DocumentRepository])
void main() {
  late MockDocumentRepository repository;
  late HomeViewModel viewModel;

  setUp(() {
    repository = MockDocumentRepository();
    viewModel = HomeViewModel(repository);
  });

  test('load', () async {
    // given
    when(repository.find(any)).thenAnswer(
      (_) => Stream.value(Document(
        id: 1,
        title: 'title',
        description: 'description',
        body: 'body',
        status: DocumentStatus.approve,
      )),
    );

    final completer = Completer();
    viewModel.addListener(() {
      completer.complete();
    });

    // when
    viewModel.load();
    await completer.future;

    // then
    expect(viewModel.title, 'title');
    expect(viewModel.description, 'description');
    expect(viewModel.body, 'body');
    expect(viewModel.status, 'Approved');
  });
}
