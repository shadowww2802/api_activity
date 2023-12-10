// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lab',
        debugShowCheckedModeBanner: false,
        home: FirstPage()
    );
  }
}

class FirstPage extends StatelessWidget {

  TextEditingController emailAddress = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirstPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Page'),
          centerTitle: true,
          backgroundColor: const Color(0xFF161A30),
          leading: const Icon(Icons.code),
        ),
        body: Container(
          color: const Color(0xFFF0ECE5),
          child: Center(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      'Welcome! This is the first page...',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: userName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: ('Username'),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF31304D),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Set border radius
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Set border radius
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: passWord,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: ('Password'),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF31304D),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Set border radius
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Set border radius
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailAddress,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: ('Email Address'),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF31304D),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Email Address: ${emailAddress.text}');
                        print('Username: ${userName.text}');
                        print('Password: ${passWord.text}');
                        
                        emailAddress.clear();
                        userName.clear();
                        passWord.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF31304D),
                      elevation: 5,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (userName.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(userName: userName.text),
                          ),
                        );
                      } else {
                        print('You forgot to input your username first...');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF31304D),
                      elevation: 5,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text(
                      'Next Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text('(Please input username first then click the second page button...)'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {

  String? userName;

  SecondPage({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
        backgroundColor: const Color(0xFF161A30),
        leading: const Icon(Icons.code),
      ),

      body: Container(
          color: const Color(0xFFF0ECE5),
          child: Center(
            child: Form(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 30),
                   Center(
                    child: Text(
                      'Welcome $userName! This is the second page...',
                      style: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  Image.asset(
                    'lib/assets/img2.gif',
                    height: 350,
                    width: 500,
                  ),

                  const SizedBox(height: 50),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF31304D),
                      elevation: 5,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text(
                      'Previous Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThirdPage(),
                          ),
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF31304D),
                      elevation: 5,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text(
                      'Next Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List images = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {'Authorization': 'OZO1udq2pQVuj5lsoc7JmPqFOdIT7jo7ZvgMhFF71IaWKkPvGiw76x9m'}).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      print(value.body);
    });
  }

  loadmore() async {
    setState(() {
      page = page + 1;
    });
    String url = 'https://api.pexels.com/v1/curated?per_page=80&page=$page';
    await http.get(Uri.parse(url),
        headers: {'Authorization': 'OZO1udq2pQVuj5lsoc7JmPqFOdIT7jo7ZvgMhFF71IaWKkPvGiw76x9m'}).then((value) {
          Map result = jsonDecode(value.body);
          setState(() {
            images.addAll(result['photos']);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
        centerTitle: true,
        backgroundColor: const Color(0xFF161A30),
        leading: const Icon(Icons.image_rounded),
      ),
      
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 5,
                left:5,
                right: 5,
              ),
              color: Colors.white,
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 4,
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => FourthPage(imageurl: images[index]['src']['large'])));
                    },
                    child: Container(
                      child: Image.network(images[index]['src']['tiny'], fit: BoxFit.cover,)),
                  );
                },
              ),
            ),
          ),


          // ElevatedButton.icon(
          //   onPressed: () {

          //   },
          //   icon: Icon(Icons.add),
          //   label: Text('Load More'),
          // ),

          Container(
            height: 60,
            width: double.infinity,
            color: const Color(0xFF161A30),
             child: Center(
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                  
                   InkWell (
                    onTap: () {
                      Navigator.pop(context);
                    },
                     child: const Row(
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: 8), 
                        Text(
                          'Previous Page',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                                     ),
                   ),
                  
                  Container(
                    width: 3,
                    color: const Color(0xFF435585),
                  ),

                  InkWell(
                    onTap: () {
                      loadmore();
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: 8), 
                        Text(
                          'Load More',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                 ],
               ),
             ),
          ),

        ],
      ),
    );
  }
}


class FourthPage extends StatefulWidget {
  final String imageurl;

  const FourthPage({super.key, required this.imageurl});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Page'),
        centerTitle: true,
        backgroundColor: const Color(0xFF161A30),
        leading: const Icon(Icons.image_rounded),
      ),

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          color: const Color(0xFFF0ECE5),
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onDoubleTap: () {
                    Navigator.pop(context);
                  },
                  child: Expanded(
                    child: Image.network(widget.imageurl),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}