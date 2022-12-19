import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:se_380_project/Screens/comments.dart';
import 'package:se_380_project/Screens/favorites.dart';
import 'package:se_380_project/Screens/rate.dart';
import 'package:se_380_project/Screens/search.dart';
import 'package:se_380_project/widget_tree.dart';
import 'List_of_contents.dart';
import 'package:provider/provider.dart';
import './Providers/content_provider.dart';
import './Screens/content_detail_page.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const WidgetTree(),
    );
  }
}

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<ContentProvider>.value(
        value: ContentProvider(),
      )
      ],
      child: MaterialApp(
        title: 'HaDiBe!',
        theme: ThemeData(
          primaryColor: Colors.black12,
        ),
        home: const ListOfContents(),
        routes: {
          ContentDetailPage.routeName: (context) => const ContentDetailPage(),
          Rate.routeName: (context) => const Rate(),
          Favorites.routeName: (context) => const Favorites(),
          SearchPage.routeName: (context) => const SearchPage(),
          Comments.routeName: (context) => const Comments(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
