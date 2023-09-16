class UserInfo {
  final String id;
  final String name;
  final String email;
  final String sub;

  UserInfo(
      {required this.id,
      required this.name,
      required this.email,
      required this.sub});

  UserInfo copyWith({
    String? name,
    String? email,
    String? sub,
    String? id,
  }) {
    return UserInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        sub: sub ?? this.sub);
  }
}
