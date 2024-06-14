class PostDetailsModel {
  final int id;
  final String title;
  final String description;
  final String thumbnail;

  final Author author;

  PostDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.author,
  });

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) {
    return PostDetailsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      author: Author.fromJson(
        json['author'],
      ),
    );
  }
}

class Author {
  final String name;
  final String email;
  final String phone;
  final String profile;
  final String occupation;
  final String about;
  String? blockedReaseon;
  final Country country;

  Author(
      {required this.name,
      required this.country,
      required this.email,
      required this.phone,
      required this.occupation,
      required this.about,
      required this.profile,
      this.blockedReaseon});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        occupation: json['occupation'],
        about: json['about'],
        blockedReaseon: json['block_reason'],
        profile: json['profile_picture'],
        country: Country.fromJson(json['country']));
  }
}

class Country {
  final String name;
  final String dialCode;
  final String shortname;

  Country({
    required this.name,
    required this.dialCode,
    required this.shortname,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json['name'],
        dialCode: json['dial_code'],
        shortname: json['code']);
  }
}
