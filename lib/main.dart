import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psony/data/data_source/news_api.dart';
import 'package:psony/data/repository/new_repository.dart';
import 'package:psony/presentation/blocs/news/news_bloc.dart';
import 'package:psony/presentation/journeys/home_page.dart';

void main() {
  runApp(MyApp(
    newsRepository: NewsRepository(NewsApi()),
  ));
}

class MyApp extends StatelessWidget {
  final NewsRepository newsRepository;

  const MyApp({Key? key, required this.newsRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                NewsBloc(newsRepository: newsRepository)..add(LoadNews()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.blue,
          tabBarTheme: TabBarTheme(
            labelColor: Colors.red,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelColor: Colors.grey,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
