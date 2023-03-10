import 'package:flontacts/presentation/home/views/contact_view.dart';
import 'package:flontacts/presentation/states/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsPage extends ConsumerStatefulWidget {
  const ContactsPage({super.key});

  @override
  ConsumerState<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends ConsumerState<ContactsPage> {
  @override
  void initState() {
    super.initState();
    ref.read(contactListProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final contacts = ref.watch(contactListProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(contactListProvider.notifier).refresh(),
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ContactView(contact: contacts[index]);
          },
        ),
      ),
    );
  }
}
