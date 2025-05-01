class UserModel {
  String? name;
  String? email;
  String? password;
  String? uid;
  String? profilePic;
  String? confirm;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.uid,
    this.confirm,
    this.profilePic,
  });
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "id": uid,
      "confirm": confirm,
      'profilePic': profilePic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map["email"] ?? "",
      name: map["name"] ?? "",
      password: map["password"] ?? "",
      uid: map["id"] ?? "",
      confirm: map["confirm"] ?? "",
      profilePic: map['profilePic'] ?? '',
    );
  }

  copyWith({
    String? name,
    String? email,
    String? password,
    String? uid,
    String? confirm,
    String? profilePic,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
      confirm: confirm ?? this.confirm,
      profilePic: profilePic ?? this.profilePic,
    );
  }
}
