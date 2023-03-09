import 'package:flontacts/data/models/random_user_response.dart';
import 'package:flontacts/data/sources/random_user_api.dart';
import 'package:flontacts/domain/entities/contact.dart';
import 'package:flontacts/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  ContactRepositoryImpl(this.randomUserApi);

  final RandomUserApi randomUserApi;

  @override
  Future<List<Contact>> getContacts() async {
    try {
      final RandomUserResponse model = await randomUserApi.getContacts();

      return model.results
          .map(
            (contact) => Contact(
              name: '${contact.name.first} ${contact.name.last}',
              phoneNumber: contact.phone,
              avatar: contact.picture.large,
              email: contact.email,
            ),
          )
          .toList();
    } catch (e) {
      // report error to monitoring
      return [];
    }
  }
}
