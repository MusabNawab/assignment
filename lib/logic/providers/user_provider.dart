import 'package:assignment/data/models/user_model.dart';
import 'package:riverpod/riverpod.dart';

final currentUserProvider = Provider(
  (ref) => User(
    name: 'Aryan Pandit',
    age: 10,
    userImage:
        'https://media.istockphoto.com/id/1353379172/photo/cute-little-african-american-girl-looking-at-camera.jpg?s=612x612&w=0&k=20&c=RCOYytwS2nMGfEb80oyeiCcIiqMQu6wnTluAaxMBye4=',
    aadharNum: 'xxxx xxxx xxxx xxxx',
    phoneNum: 'xxxxx xxxxx',
    houseName: 'Red House',
    schoolName: 'Abc School',
    contribution: {'team': 'Red house', 'pts': '160'},
  ),
);
