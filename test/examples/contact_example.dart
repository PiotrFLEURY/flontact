import 'package:flontacts/data/models/random_user.dart';

final aRandomContact = RandomUser(
  name: Name(
    title: 'Mr',
    first: 'Piotr',
    last: 'FLEURY',
  ),
  cell: '06123456789',
  phone: '03123456789',
  email: 'toto.titi@tutu.com',
  picture: Picture(
    large: 'https://picsum.photos/200/300',
    medium: 'https://picsum.photos/200/300',
    thumbnail: 'https://picsum.photos/200/300',
  ),
);
