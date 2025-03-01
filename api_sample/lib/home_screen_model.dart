class HomeModel{
  String? title;
  String image;

  HomeModel({required this.title,required this.image});

  factory HomeModel.fromJson(Map<String, dynamic>json){
    return HomeModel(
      title: json['title'],
      image: json['image']
      );
  }


}