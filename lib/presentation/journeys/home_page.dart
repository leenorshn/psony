import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psony/presentation/blocs/news/news_bloc.dart';
import 'package:psony/presentation/journeys/detail_article.dart';
import 'package:psony/presentation/widgets/news_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Congo Check"),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.search,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.tag,
              // color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.white,
              height: 43,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: "Aujourd'hui",
                  ),
                  Tab(
                    text: "Politique",
                  ),
                  Tab(
                    text: "Santé",
                  ),
                  Tab(
                    text: "Economie",
                  ),
                  Tab(
                    text: "Sport",
                  ),
                  Tab(
                    text: "Autres",
                  )
                ],
              ),
            ),
            BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
              if (state is NewsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is NewsLoadedSuccess) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.articleResult.articles.length,
                      itemBuilder: (context, index) {
                        return NewsTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailArticle(
                                  articles: state.articleResult.articles[index],
                                ),
                              ),
                            );
                          },
                          articles: state.articleResult.articles[index],
                        );
                      }),
                );
              }
              if (state is NewsLoadedFailure) {
                return Container(
                  child: Center(
                    child: Text(state.error.toString()),
                  ),
                );
              }
              return Container(
                child: Center(
                  child: Text("Error"),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
