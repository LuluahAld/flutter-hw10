import 'package:flutter/material.dart';
import 'package:hw_10/pages/blog.dart';

class Details extends StatelessWidget {
  final Blog blog;
  const Details({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: SafeArea(
        child: ListView(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Image.network(blog.img),
            const SizedBox(
              height: 16,
            ),
            Text(
              blog.title,
              maxLines: 4,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              blog.desc,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    ));
  }
}
