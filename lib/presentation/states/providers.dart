import 'package:dio/dio.dart';
import 'package:flontacts/data/repositories/contact_repository_impl.dart';
import 'package:flontacts/data/sources/random_user_api.dart';
import 'package:flontacts/domain/entities/contact.dart';
import 'package:flontacts/domain/repositories/contact_repository.dart';
import 'package:flontacts/presentation/states/contacts_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(),
);

final randomUserApiProvider = Provider<RandomUserApi>(
  (ref) => RandomUserApi(ref.read(dioProvider)),
);

final contactRepositoryProvider = Provider<ContactRepository>(
  (ref) => ContactRepositoryImpl(ref.read(randomUserApiProvider)),
);

final contactListProvider =
    StateNotifierProvider<ContactsNotifier, List<Contact>>(
  (ref) => ContactsNotifier(
    ref.read(contactRepositoryProvider),
  ),
);
