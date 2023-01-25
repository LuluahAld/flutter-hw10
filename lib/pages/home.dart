import 'package:flutter/material.dart';
import 'package:hw_10/pages/addblog.dart';
import 'package:hw_10/pages/blog.dart';
import 'package:hw_10/pages/details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String text;
    Widget body;
    if (currentIndex == 0) {
      body = const HomePage();
      text = 'Daily Feed';
    } else {
      body = const AddBlog();
      text = 'Add Blog';
    }
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 32,
            ),
          ),
        ],
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 25,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.blueGrey,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Blog',
          ),
        ],
        currentIndex: currentIndex,
      ),
      body: body,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 40,
        ),
        for (var Blog in blogs) (showBlogs(blog: Blog))
      ],
    );
  }
}

class showBlogs extends StatelessWidget {
  final Blog blog;
  const showBlogs({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(
                      blog: blog,
                    )),
          );
        },
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 230, 229, 229),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      blog.img,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    blog.title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.blueGrey,
                    ),
                    maxLines: 5,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
