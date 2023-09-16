class MemberModel {
  final String id;
  final String name;
  final String email;
  final String sub;

  MemberModel({required this.id,required this.name, required this.email, required this.sub});

  MemberModel copyWith({
    String? id,
    String? name,
    String? email,
    String? sub,
  }) {
    return MemberModel(
      id: id?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        sub: sub ?? this.sub);
  }
}
