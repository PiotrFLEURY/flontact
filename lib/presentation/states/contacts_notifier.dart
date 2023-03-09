// a list of 5 contacts of type Contact form file contact.dart
import 'package:flontacts/domain/entities/contact.dart';
import 'package:flontacts/domain/repositories/contact_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsNotifier extends StateNotifier<List<Contact>> {
  ContactsNotifier(this.repository) : super([]);

  final ContactRepository repository;

  Future<void> refresh() async {
    final contacts = await repository.getContacts();
    state = contacts;
  }
}
