import 'package:organicrss/rss/rssClasses.dart';
import 'package:organicrss/utils/constants.dart';
import 'package:xml/xml.dart';
import 'package:timeago/timeago.dart' as timeago;

class parseRSS {
  final String? feedUri;
  List<rssItem>? _cachedSortedFeed;

  parseRSS({this.feedUri});
 
  Future<String> fetch() async {
    final download = await cacheManager.getSingleFile(feedUri!);
    return await download.readAsString();
  }

  Future<List<rssItem>> parse(String response) async {
    final parseResponse = XmlDocument.parse(response);
    final items = parseResponse.findAllElements("item");
    final returnItems = <rssItem>[];

    for (final item in items) {
      final title = item.findElements('title').first.innerText;
      final description = item.findElements('description').first.innerText;
      final uri = item.findElements('link').first.innerText;
      final date = item.findElements('pubDate').first.innerText;
      final parsedDate = anyDate.parse(date);
      final relativeTime = timeago.format(parsedDate);

      returnItems.add(
        rssItem(
          title: title,
          description: description,
          relativeTime: relativeTime,
          date: parsedDate,
          uri: uri,
        ),
      );
    }

    return returnItems;
  }

  Future<List<rssItem>> getFeed() async {
    if (_cachedSortedFeed != null) {
      print("Using cached sorted feed.");
      return _cachedSortedFeed!;
    }

    final rss = await fetch();
    final parsedRSS = await parse(rss);

    parsedRSS.sort((a, b) => b.date.compareTo(a.date));
    _cachedSortedFeed = parsedRSS;

    print("Sorted and cached feed.");
    return _cachedSortedFeed!;
  }

  Future<bool> emptyCache() async {
    await cacheManager.emptyCache();
    _cachedSortedFeed = null;
    return true;
  }
}
