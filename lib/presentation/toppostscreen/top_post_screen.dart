import 'package:assignment/data/models/recent_top.dart';
import 'package:assignment/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';

class TopPostScreen extends StatelessWidget {
  const TopPostScreen({super.key, required this.topPost});

  final RecentTop topPost;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        title: '${topPost.userName}, ${topPost.userAge}',
        url: topPost.userImg,
        navigate: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: Hero(
                  tag: topPost.userId,
                  child: Image.network(
                    topPost.url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'House - ${topPost.userHouse}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    Text(
                      'School - ${topPost.userSchool}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  width: screenSize.width * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('You Liked The Post')));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('You Liked The Post'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: screenSize.height * 0.04,
                        )),
                    Text(
                      '${topPost.upvotes} upvotes',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                topPost.description,
                style: const TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
