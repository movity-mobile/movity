import 'package:flutter/material.dart';

class ClubModel{
  int id;
  String name;
  List<String> genre;
  double rating;
  String image;
  String imageLogo;

  ClubModel ({
    required this.id,
    required this.genre,
    required this.name,
    required this.rating,
    required this.image,
    required this.imageLogo,
});
}