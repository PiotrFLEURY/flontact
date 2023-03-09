import 'package:flontacts/domain/entities/contact.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        elevation: 8.0,
        child: Image.network(
          contact.avatar,
          width: 48.0,
          height: 48.0,
        ),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.email),
    );
  }
}
