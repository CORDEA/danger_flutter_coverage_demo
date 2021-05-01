import 'dart:async';

import 'package:flutter/material.dart';

import 'document.dart';
import 'document_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._repository);

  final DocumentRepository _repository;
  final List<StreamSubscription> _subscriptions = [];

  String _title = '';
  String _body = '';
  String _description = '';
  DocumentStatus _status = DocumentStatus.hold;

  String get title => _title;

  String get body => _body;

  String get description => _description;

  String get status {
    switch (_status) {
      case DocumentStatus.approve:
        return 'Approved';
      case DocumentStatus.reject:
        return 'Rejected';
      case DocumentStatus.hold:
        return 'On hold';
    }
  }

  void load() {
    _subscriptions.add(
      _repository.find(1).listen((value) {
        _title = value.title;
        _body = value.body;
        _description = value.description;
        _status = value.status;
        notifyListeners();
      }),
    );
  }

  void onApproveTapped() {
    _subscriptions.add(
      _repository.updateStatus(DocumentStatus.approve).listen((value) {
        _status = value;
        notifyListeners();
      }),
    );
  }

  void onRejectTapped() {
    _subscriptions.add(
      _repository.updateStatus(DocumentStatus.reject).listen((value) {
        _status = value;
        notifyListeners();
      }),
    );
  }

  void onHoldTapped() {
    _subscriptions.add(
      _repository.updateStatus(DocumentStatus.hold).listen((value) {
        _status = value;
        notifyListeners();
      }),
    );
  }

  @override
  void dispose() {
    _subscriptions.forEach((element) {
      element.cancel();
    });
    _subscriptions.clear();
    super.dispose();
  }
}
