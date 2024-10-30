import 'dart:io';

import 'package:organicrss/rss/rssClasses.dart';
import 'package:xml/xml.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;

class parseRSS {
  final String feedUri;

  parseRSS({required this.feedUri});

  final cacheManager = DefaultCacheManager();

  fetch() async {
    final download = await cacheManager.getSingleFile(feedUri);
    final response = await download.readAsString();

    return response;
  }

  parse() async {
    final response = await fetch();
    final parseResponse = XmlDocument.parse(response);

    final items = parseResponse.findAllElements("item");
    final returnItems = [];

    print(items);

    for (final item in items) {
      final title = item.findElements('title').first.innerText;
      final description = item.findElements('description').first.innerText;
      final uri = item.findElements('link').first.innerText;

      print(title);

      returnItems.add(rssItem(title: title, description: description, uri: uri));
    }

    return returnItems;
  }

  emptyCache() {
    cacheManager.emptyCache();
    return true;
  }
}