class PhotoModel {
  String? createdAt;
  String? id;
  String? color;
  Map<String, dynamic>? urls;

  PhotoModel({this.createdAt, this.id, this.color, this.urls});

  PhotoModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    createdAt  = json['created_at'];
    color = json['color'];
    urls = json['urls'];
  }
}
