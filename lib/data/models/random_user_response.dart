import 'package:flontacts/data/models/random_user.dart';

class RandomUserResponse {
  final List<RandomUser> results;

  RandomUserResponse({required this.results});

  factory RandomUserResponse.fromJson(Map<String, dynamic> json) {
    return RandomUserResponse(
      results: (json['results'] as List)
          .map((e) => RandomUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
