import 'package:flontacts/data/models/random_user_response.dart';
import 'package:flontacts/data/repositories/contact_repository_impl.dart';
import 'package:flontacts/data/sources/random_user_api.dart';
import 'package:flontacts/domain/entities/contact.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contact_repository_test.mocks.dart';
import 'examples/contact_example.dart';

@GenerateMocks([RandomUserApi])
main() {
  group('getContacts', () {
    test('get contacts is empty', () async {
      // GIVEN
      final mockedApi = MockRandomUserApi();
      final repository = ContactRepositoryImpl(mockedApi);

      when(mockedApi.getContacts()).thenAnswer(
        (realInvocation) => Future.value(RandomUserResponse(results: [])),
      );

      // WHEN
      final List<Contact> contacts = await repository.getContacts();

      // THEN
      expect(contacts, []);
    });

    test('get contacts has data', () async {
      // GIVEN
      final mockedApi = MockRandomUserApi();
      final repository = ContactRepositoryImpl(mockedApi);

      final response = RandomUserResponse(results: [
        aRandomContact,
      ]);

      when(mockedApi.getContacts()).thenAnswer(
        (realInvocation) => Future.value(response),
      );

      // WHEN
      final List<Contact> contacts = await repository.getContacts();

      // THEN
      expect(contacts.length, 1);
      expect(contacts.first.name, 'Piotr FLEURY');
    });

    test('get contacts error', () async {
      // GIVEN
      final mockedApi = MockRandomUserApi();
      final repository = ContactRepositoryImpl(mockedApi);

      when(mockedApi.getContacts()).thenThrow(Exception('badaboum'));

      // WHEN
      final List<Contact> contacts = await repository.getContacts();

      // THEN
      expect(contacts, []);
    });
  });
}
