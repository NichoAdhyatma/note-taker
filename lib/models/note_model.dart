import 'package:faker/faker.dart';

class NoteModel {
  String? imagePath;
  String title;
  String body;

  NoteModel({
    this.imagePath,
    required this.title,
    required this.body,
  });
}

