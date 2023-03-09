import 'package:flontacts/presentation/home/views/contact_view.dart';
import 'package:flontacts/presentation/states/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsPage extends ConsumerWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactListProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactView(contact: contacts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(contactListProvider.notifier).refresh();
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
