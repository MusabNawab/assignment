import 'package:assignment/data/models/recent_top.dart';
import 'package:assignment/presentation/constants/colors.dart';
import 'package:flutter/material.dart';

class RecentTopCard extends StatelessWidget {
  const RecentTopCard({super.key, required this.post});
  final RecentTop post;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.75,
      height: screenSize.height * 0.40,
      decoration: BoxDecoration(
        color: Colours.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(top: 10, left: 20, right: 15),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(post.userImg),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${post.userName}, ${post.userAge}',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Hero(
                tag: post.userId,
                child: Image.network(
                  post.url,
                  fit: BoxFit.cover,
                  height: screenSize.height * 0.12,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Text(
            post.description,
            style: const TextStyle(fontWeight: FontWeight.w400),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: screenSize.height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'House - ${post.userHouse}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'School - ${post.userSchool}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('You Liked The Post'),
                          duration: Duration(seconds: 2),
                        ));
                      },
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: screenSize.height * 0.03,
                      )),
                  Text('${post.upvotes} upvotes'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
