import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psony/data/models/news.dart';

class NewsTile extends StatelessWidget {
  final Articles articles;
  final VoidCallback onTap;

  const NewsTile({Key? key, required this.articles, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            Text(
              "${this.articles.title}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8, bottom: 12),
              child: Text(
                "${this.articles.description}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}