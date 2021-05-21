import 'dart:io';

import 'package:flutter/material.dart';
import 'package:psony/data/models/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailArticle extends StatefulWidget {
  final Articles articles;

  const DetailArticle({Key? key, required this.articles}) : super(key: key);

  @override
  _DetailArticleState createState() => _DetailArticleState();
}

class _DetailArticleState extends State<DetailArticle> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.widget.articles.title}"), //title
        elevation: 0,
      ),
      body: Container(
        child: WebView(
          initialUrl: '${widget.articles.url}',
        ),
      ),
    );
  }
}
