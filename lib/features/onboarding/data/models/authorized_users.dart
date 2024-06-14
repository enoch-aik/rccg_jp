class AuthorizedUsers {
  final String email;
  final bool isAdmin;

  AuthorizedUsers({required this.isAdmin, required this.email});

  factory AuthorizedUsers.fromJson(Map<String, dynamic> json) {
    return AuthorizedUsers(
      email: json['email'],
      isAdmin: json['isAdmin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'isAdmin': isAdmin,
    };
  }
}
