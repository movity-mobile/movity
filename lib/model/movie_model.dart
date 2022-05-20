import 'package:flutter/material.dart';
import 'package:movity_app/model/cast_model.dart';

class MovieModel{
  int id;
  String name;
  List<String> genre;
  double rating;
  String director;
  String storyLine;
  Image image;
  Image imageLogo;
  List<MovieCastModel> castList = [];

  MovieModel ({
    required this.id,
    required this.genre,
    required this.name,
    required this.rating,
    required this.director,
    required this.storyLine,
    required this.image,
    required this.imageLogo,
    required this.castList,
});
}