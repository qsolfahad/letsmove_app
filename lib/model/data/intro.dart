class IntroModel {
   final String title;
  final String body;
  final String image;

  IntroModel({required this.title, required this.body,required this.image});


  IntroModel copyWith({
    String? id,
    String? title,
    bool? completed,
  }) {
    return IntroModel(
      body: body ?? this.body,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }
}