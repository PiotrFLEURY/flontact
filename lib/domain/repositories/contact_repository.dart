import 'package:flontacts/domain/entities/contact.dart';

mixin ContactRepository {
  Future<List<Contact>> getContacts();
}
