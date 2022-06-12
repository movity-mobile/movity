import 'package:flutter/material.dart';

class ClubModel{
  int id;
  String name;
  String description;
  String rating;
  String image;
  String imageLogo;

  ClubModel ({
    required this.id,
    required this.description,
    required this.name,
    required this.rating,
    required this.image,
    required this.imageLogo,
});
}