import 'package:flutter/material.dart';
import 'package:organicrss/utils/constants.dart';

loadImage(url) {
    return FutureBuilder(future: cacheManager.getSingleFile(url), builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else {
        final data = snapshot.data;
        return Image.file(data);
      }
    },);
  }