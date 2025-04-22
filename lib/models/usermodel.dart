class UserModel {
  String? name;
  String? email;
  String? password;
  String? id;

  String? confirm;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.id,
    this.confirm,
  });
  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "id": this.id,
      "confirm": this.confirm,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map["email"] ?? "",
      name: map["name"] ?? "",
      password: map["password"] ?? "",
      id: map["id"] ?? "",
      confirm: map["confirm"] ?? "",
    );
  }

  copyWith({
    String? name,
    String? email,
    String? password,
    String? id,
    String? confirm,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
      confirm: confirm ?? this.confirm,
    );
  }
}
