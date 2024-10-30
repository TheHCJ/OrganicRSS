import 'dart:io';

import 'package:any_date/any_date.dart';
import 'package:organicrss/rss/rssClasses.dart';
import 'package:xml/xml.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:timeago/timeago.dart' as timeago;

class parseRSS {
  final String feedUri;

  parseRSS({required this.feedUri});

  final cacheManager = DefaultCacheManager();
  final anyDate = AnyDate();

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

    for (final item in items) {
      final title = item.findElements('title').first.innerText;
      final description = item.findElements('description').first.innerText;
      final uri = item.findElements('link').first.innerText;

      final date = item.findElements('pubDate').first.innerText;
      final parsedDate = anyDate.parse(date);
      final relativeTime = timeago.format(parsedDate);

      returnItems.add(rssItem(title: title, description: description, relativeTime: relativeTime, date: parsedDate, uri: uri));
    }

    return returnItems;
  }

  emptyCache() {
    cacheManager.emptyCache();
    return true;
  }
}