import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../widgets/image_news_widget.dart';

class ListItemWidget extends StatelessWidget {
  final RssItem item;
  const ListItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black, spreadRadius: 3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: IntrinsicHeight(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                  child: Text(
                    item.author ?? 'Автор неизвестен',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ImageNewsWidget(
                        imageUrl: item.enclosure!.url!,
                        height: 100,
                        width: 130,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item.title!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    item.description!,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 30),
                InkWell(
                  child: Text(
                    'Читать далее',
                    style: TextStyle(
                        color: Colors.blue[900],
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launchUniversalLink(item.link!),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
