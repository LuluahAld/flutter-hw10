import 'package:flutter/material.dart';
import 'package:hw_10/pages/blog.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final imgController = TextEditingController();
  late String title;
  late String desc;
  String img = 'https://bit.ly/3Hf1XDA';
  bool validateT = false;
  bool validateD = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              decoration: InputDecoration(
                errorText: validateT ? 'Title can\'t be empty' : null,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              controller: titleController,
              onChanged: (value) {
                title = titleController.text.toString();
                setState(() {});
              },
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              decoration: InputDecoration(
                errorText: validateD ? 'Description can\'t be empty' : null,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              controller: descController,
              onChanged: (value) {
                desc = descController.text.toString();
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Image (Scroll and click)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.blueGrey,
              height: 300,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      img = 'https://bit.ly/3Hf1XDA';
                      setState(() {});
                    },
                    child: Image.network(
                      'https://bit.ly/3Hf1XDA',
                      width: 400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      img = 'https://bit.ly/3wslOdi';
                      setState(() {});
                    },
                    child: Image.network(
                      'https://bit.ly/3wslOdi',
                      width: 400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      img = 'https://bit.ly/3XUYDnv';
                      setState(() {});
                    },
                    child: Image.network(
                      'https://bit.ly/3XUYDnv',
                      width: 400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      img = 'https://bit.ly/3wsTF5J';
                      setState(() {});
                    },
                    child: Image.network(
                      'https://bit.ly/3wsTF5J',
                      width: 400,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      titleController.text.isEmpty ? validateT = true : validateT = false;
                      descController.text.isEmpty ? validateD = true : validateD = false;
                    });
                    if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
                      blogs.add(Blog(img, title, desc));
                    }
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(8),
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
