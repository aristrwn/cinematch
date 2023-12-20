import 'package:catalogmovie/app_constant.dart';
import 'package:catalogmovie/injector.dart';
import 'package:catalogmovie/movie/page/movie_page.dart';
import 'package:catalogmovie/movie/provider/movie_get_discover.dart';
import 'package:catalogmovie/movie/provider/movie_get_now_playing.dart';
import 'package:catalogmovie/movie/provider/movie_get_top_rated.dart';
import 'package:catalogmovie/movie/provider/movie_search.dart';
import 'package:catalogmovie/movie/repository/movie_repository.dart';
import 'package:catalogmovie/movie/repository/movie_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  runApp(App());
  FlutterNativeSplash.remove();
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetDiscoverProvider>(),
          ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetTopRatedProvider>(),
          ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetNowPlayingProvider>(),
          ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieSearchProvider>(),
          ),  
      ],
      child: MaterialApp(
       
        title: 'CineMatch',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MoviePage(),
         debugShowCheckedModeBanner: false,
      ),
    );
  }
}


