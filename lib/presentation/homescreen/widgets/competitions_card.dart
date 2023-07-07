import 'package:assignment/data/models/competitions.dart';
import 'package:assignment/presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompetitonsCard extends StatelessWidget {
  const CompetitonsCard({super.key, required this.post});
  final Competitions post;

  String get startDate {
    final date = DateTime(post.startYear, post.startMonth);

    return '${DateFormat.MMMM().format(date)} ${DateFormat.y().format(date).toString().substring(2)}';
  }

  String get endDate {
    final date = DateTime(post.endYear, post.endMonth);

    return '${DateFormat.MMMM().format(date)} ${DateFormat.y().format(date).toString().substring(2)}';
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.75,
      height: screenSize.height * 0.32,
      decoration: BoxDecoration(
        color: Colours.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              post.url,
              fit: BoxFit.cover,
              height: screenSize.height * 0.2,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                post.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: screenSize.width * 0.07,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start Date: $startDate'),
                  Text('End Date  : $endDate'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
