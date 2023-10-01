import 'package:flutter/material.dart';

class Recommended{
  String imgPath;
  String title;

  Recommended({required this.imgPath,required this.title});

  static List<Recommended> getCourses() {
    List<Recommended> courses = [];
    courses.add(
        Recommended(imgPath: "Images/dataAnalytics.png", title: "Data Analytics")
    );
    courses.add(
        Recommended(imgPath: "Images/icloud.png", title: "Cloud Computing")
    );
    courses.add(
        Recommended(imgPath: "Images/machineLearning.png", title: "Machine Leaning")
    );
    return courses;
  }

}