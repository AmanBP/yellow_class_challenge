import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviestorage/movie.dart';
import 'package:path_provider/path_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory applicationdocdir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(applicationdocdir.path);
  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox<Movie>('Movies');
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
        child: AppBar(
          backgroundColor: Color(0xFF202124),
          automaticallyImplyLeading: false,
          actions: [],
          elevation: 4,
        ),
      ),
      backgroundColor: Color(0xFF202124),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Color.fromARGB(100, 12, 12, 12),
        icon: Icon(
          Icons.add_sharp,
        ),
        elevation: 8,
        label: Text('Add a New Movie'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF202124),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(70, 255, 255, 255),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 2.5, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.jpg'),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.66,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFF202124),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Movie Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Director\'s Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            print('Edit Button pressed ...');
                                          },
                                          label: Text('Edit',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          icon: Icon(
                                            Icons.edit_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color.fromARGB(
                                                          100, 12, 12, 12)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      side: BorderSide(color: Color(0xFF202124))))),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            print('Delete Button pressed ...');
                                          },
                                          label: Text('Delete',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          icon: Icon(
                                            Icons.delete_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color.fromARGB(
                                                          100, 12, 12, 12)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      side: BorderSide(color: Color(0xFF202124))))),
                                        ),
                                      ])
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
                Padding(
                padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF202124),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(70, 255, 255, 255),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 2.5, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.jpg'),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.66,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFF202124),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Movie Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Director\'s Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            print('Edit Button pressed ...');
                                          },
                                          label: Text('Edit',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          icon: Icon(
                                            Icons.edit_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color.fromARGB(
                                                          100, 12, 12, 12)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      side: BorderSide(color: Color(0xFF202124))))),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            print('Delete Button pressed ...');
                                          },
                                          label: Text('Delete',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          icon: Icon(
                                            Icons.delete_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color.fromARGB(
                                                          100, 12, 12, 12)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      side: BorderSide(color: Color(0xFF202124))))),
                                        ),
                                      ])
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
                Padding(
                padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF202124),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(70, 255, 255, 255),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 2.5, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.jpg'),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.66,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFF202124),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Movie Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Director\'s Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            print('Edit Button pressed ...');
                                          },
                                          label: Text('Edit',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          icon: Icon(
                                            Icons.edit_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color.fromARGB(
                                                          100, 12, 12, 12)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      side: BorderSide(color: Color(0xFF202124))))),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            print('Delete Button pressed ...');
                                          },
                                          label: Text('Delete',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          icon: Icon(
                                            Icons.delete_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color.fromARGB(
                                                          100, 12, 12, 12)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      side: BorderSide(color: Color(0xFF202124))))),
                                        ),
                                      ])
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
                Padding(
                padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF202124),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(70, 255, 255, 255),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 2.5, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.jpg'),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.66,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFF202124),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Movie Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Director\'s Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            print('Edit Button pressed ...');
                                          },
                                          label: Text('Edit',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          icon: Icon(
                                            Icons.edit_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color.fromARGB(
                                                          100, 12, 12, 12)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      side: BorderSide(color: Color(0xFF202124))))),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            print('Delete Button pressed ...');
                                          },
                                          label: Text('Delete',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          icon: Icon(
                                            Icons.delete_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color.fromARGB(
                                                          100, 12, 12, 12)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      side: BorderSide(color: Color(0xFF202124))))),
                                        ),
                                      ])
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
                Padding(
                padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF202124),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(70, 255, 255, 255),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 2.5, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.jpg'),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.66,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFF202124),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Movie Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Director\'s Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            print('Edit Button pressed ...');
                                          },
                                          label: Text('Edit',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          icon: Icon(
                                            Icons.edit_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color.fromARGB(
                                                          100, 12, 12, 12)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      side: BorderSide(color: Color(0xFF202124))))),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            print('Delete Button pressed ...');
                                          },
                                          label: Text('Delete',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          icon: Icon(
                                            Icons.delete_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color.fromARGB(
                                                          100, 12, 12, 12)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      side: BorderSide(color: Color(0xFF202124))))),
                                        ),
                                      ])
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
