class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? about;
  List<Tag>? tags;
  List<String>? favoriteSocialMedia;
  int? salary;
  String? email;
  String? birthDate;
  int? gender;
  UserType? type;
  String? avatar;

  UserModel({
     this.id,
     this.firstName,
     this.lastName,
     this.about,
     this.tags,
     this.favoriteSocialMedia,
     this.salary,
     this.email,
     this.birthDate,
     this.gender,
     this.type,
     this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      about: json['about'],
      tags: List<Tag>.from(json['tags'].map((tag) => Tag.fromJson(tag))),
      favoriteSocialMedia: List<String>.from(json['favorite_social_media']),
      salary: json['salary'],
      email: json['email'],
      birthDate: json['birth_date'],
      gender: json['gender'],
      type: UserType.fromJson(json['type']),
      avatar: json['avatar'],
    );
  }
}

class Tag {
  int id;
  String name;

  Tag({required this.id, required this.name});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      name: json['name'],
    );
  }
}

class UserType {
  int code;
  String name;
  String niceName;

  UserType({required this.code, required this.name, required this.niceName});

  factory UserType.fromJson(Map<String, dynamic> json) {
    return UserType(
      code: json['code'],
      name: json['name'],
      niceName: json['nice_name'],
    );
  }
}
