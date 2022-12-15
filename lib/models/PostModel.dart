class PostModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? Text;
  String? PostImage;


  PostModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.Text,
    this.PostImage,
  });

  PostModel.fromjason(Map<String, dynamic> jason) {
    name = jason['name'];

    uId = jason['uId'];
    image = jason['image'];
    dateTime = jason['dateTime'];
    Text = jason['Text'];
    PostImage = jason['PostImage'];

  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'dateTime':dateTime,
      'Text':Text,
      'PostImage':PostImage,

    };
  }
}
