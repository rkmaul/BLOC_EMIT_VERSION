class User {
  int? id;
  String? email;
  String? userName;
  String? password;

  User({this.id, this.email, this.userName, this.password});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        userName = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'username': userName,
        'password': password,
      };
}
