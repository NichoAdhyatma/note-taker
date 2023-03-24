class NoteModel {
  String title;
  String body;
  String? imagePath;

  NoteModel({
    this.imagePath,
    required this.title,
    required this.body,
  });

  NoteModel.fromJson(Map<String, dynamic> json) 
      : title = json['title'],
        body = json['body'],
        imagePath = json['imagePath'];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'imagePath': imagePath,
    };
  }
}
