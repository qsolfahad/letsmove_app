class UserInfoModel {
   final String name;
  final String email;
  final String phone;

  UserInfoModel({required this.name, required this.email,required this.phone});


  UserInfoModel copyWith({
    String? name,
    String? email,
    String? phone,
  }) {
    return UserInfoModel(
      name: name ?? this.name,
      email:email?? this.email,
      phone: phone ?? this.phone
    );
  }
}