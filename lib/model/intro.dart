class IntroModel {
  final String title;
  final String body;
  final String image;

  IntroModel({required this.title, required this.body, required this.image});

  IntroModel copyWith({
    String? title,
    String? body,
    String? image,
  }) {
    return IntroModel(
      title: title ?? this.title,
      body: body ?? this.body,
      image: image ?? this.image,
    );
  }
}
