import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psony/data/models/news.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsTile extends StatelessWidget {
  final Articles articles;
  final VoidCallback onTap;

  const NewsTile({Key? key, required this.articles, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('fr', timeago.FrMessages());
    return InkWell(
      onTap: this.onTap,
      child: Container(
        child: Column(
          children: [
            ...[
              if (articles.urlToImage != "")
                Image.network("${articles.urlToImage}")
              else
                Text("Pas d'image pour cet information")
            ],
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text(
                "${this.articles.title}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 12,
                top: 4,
              ),
              child: Text(
                "${this.articles.description}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[500],
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(timeago.format(
                        DateTime.parse(this.articles.publishedAt),
                        locale: 'fr')),
                    Row(
                      children: [
                        Text.rich(TextSpan(
                            text: "10",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[600]),
                            children: [
                              TextSpan(
                                  text: " vue",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[500]))
                            ])),
                        IconButton(
                            icon: Icon(CupertinoIcons.tags_solid,
                                color: Color(0xff21ce99)),
                            onPressed: () {}),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
