///
///{
///         "name": {
///             "title": "Mr",
///             "first": "Adrian",
///             "last": "Chambers"
///         },
///         "email": "adrian.chambers@example.com",
///         "phone": "011-631-7310",
///         "cell": "081-981-2834",
///         "picture": {
///             "large": "https://randomuser.me/api/portraits/men/81.jpg",
///             "medium": "https://randomuser.me/api/portraits/med/men/81.jpg",
///             "thumbnail": "https://randomuser.me/api/portraits/thumb/men/81.jpg"
///         }
///     }
///

class RandomUser {
  final Name name;
  final String email;
  final String phone;
  final String cell;
  final Picture picture;

  RandomUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.cell,
    required this.picture,
  });

  // from json
  factory RandomUser.fromJson(Map<String, dynamic> json) {
    return RandomUser(
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      email: json['email'] as String,
      phone: json['phone'] as String,
      cell: json['cell'] as String,
      picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
    );
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  // from json

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'] as String,
      first: json['first'] as String,
      last: json['last'] as String,
    );
  }
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  // from json

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'] as String,
      medium: json['medium'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }
}
