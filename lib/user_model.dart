class UserModel {
  int id;
  String username, password, name, createdAt, updatedAt;

  UserModel(
      {this.id,
      this.username,
      this.password,
      this.name,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"]);
  }
}
