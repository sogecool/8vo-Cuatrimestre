import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/CustomSearchBar.dart';
import '../components/ItemNews.dart';
import '../models/trending.dart';
import 'LoadingPage.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<Trending> trending = [
    Trending(
      category: "Tendencias", 
      hashtag: "SIDA", 
      published: "7.164 publicaciones"
    ),
    Trending(
      category: "Tendencias en Mexico", 
      hashtag: "Costco", 
      published: "20,6 mil publicaciones"
    ),
    Trending(
      category: "Tendencias en Mexico", 
      hashtag: "Sams", 
      published: "20,4 mil publicaciones"
    )
  ];

  List<Trending> trending_filtered = [];

  @override
  void initState() {
    super.initState();
    trending_filtered = trending;
  }


  void onSubmitted(String value) {
    setState(() {
      if(value.isEmpty){
        trending_filtered = trending;
        return;
      }
      trending_filtered = trending.where((element) => element.hashtag.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }


  void moveToDetail(Trending item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detail(
          item: item,
        ),
      ),
    );

    /*Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Detail(
          item: item,
        ),
      ),
    );*/
  }
  void DesLogeame() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('tas_logeado', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Loadingpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black, // Fondo negro para la barra superior
        title: const Text(
          'Home (Aaron Hdez)',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ), // Texto blanco en la AppBar
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white), // Icono de logout
            onPressed: () {
              DesLogeame(); // También cierra sesión al presionar logout
            },
          ),
        ],
        elevation: 0, // Quita la sombra de la AppBar
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customsearchbar(
                onSubmitted: onSubmitted,
              ),
              Text(
                "Qué está pasando?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: trending_filtered.length,
                  itemBuilder: (_, index) {
                    return ItemNews(
                      trending: trending_filtered[index],
                      onTap: () => moveToDetail(trending_filtered[index]),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}