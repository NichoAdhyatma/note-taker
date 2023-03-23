import 'package:flutter/material.dart';

class Category {
  String id;
  String name;
  Icon icon;

  Category({required this.id, required this.name, required this.icon});
}

List<Category> categoryList = [
  Category(
    id: "1",
    name: "Personal",
    icon: const Icon(Icons.task_outlined),
  ),
  Category(
    id: "2",
    name: "Work",
    icon: const Icon(Icons.work_off_outlined),
  ),
  Category(
    id: "3",
    name: "Journal",
    icon: const Icon(Icons.book_outlined),
  ),
  Category(
    id: "4",
    name: "Todo",
    icon: const Icon(Icons.check_box_outlined),
  ),
  Category(
    id: "5",
    name: "Add",
    icon: const Icon(Icons.add),
  ),
];
