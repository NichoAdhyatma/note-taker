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

List<NoteModel> noteList = [
  NoteModel(
    title: "Headline Note",
    body: faker.lorem.sentence(),
  ),
  NoteModel(
    title: "Headline Note",
    body: faker.lorem.sentence(),
  ),
  NoteModel(
    title: "Headline Note",
    body: faker.lorem.sentence(),
  ),
  NoteModel(
    title: "Headline Note",
    body: faker.lorem.sentence(),
  ),
];
