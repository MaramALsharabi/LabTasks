import 'package:flutter/material.dart';

class InProgress{
  String imgPath;
  String title;

  InProgress({required this.imgPath,required this.title});

  static List<InProgress> getCourses() {
    List<InProgress> courses = [];

    courses.add(
        InProgress(imgPath: "Images/python.png", title: "Python")
    );
    courses.add(
        InProgress(imgPath: "Images/flutter.png", title: "Flutter")
    );
    courses.add(
        InProgress(imgPath: "Images/c++.png", title: "C++")
    );
    return courses;
  }
}