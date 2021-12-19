import 'dart:math';

import 'package:flutter/material.dart';

class Pokemon extends StatelessWidget {
  final int snailSpriteCount;
  final String snailDirection;
  final String name;
  final Color rareColor;
  final int level;
  final Function press;
  final Function longPress;

  const Pokemon(
      {Key? key,
      required this.snailSpriteCount,
      required this.snailDirection,
      required this.name,
      required this.rareColor,
      required this.level,
      required this.press,
      required this.longPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (rareColor == Colors.redAccent) {
      if (level >= 1 && level < 25) {
        if (snailDirection == 'left') {
          return Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
            child: GestureDetector(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: rareColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Level : ' + level.toString(),
                  ),
                  Image.asset('assets/achievenment/move/' +
                      name +
                      '1' +
                      snailSpriteCount.toString() +
                      '.png'),
                ],
              ),
            ),
          );
        } else if (snailDirection == 'up') {
          return Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
            child: GestureDetector(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: rareColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Level : ' + level.toString(),
                  ),
                  Image.asset('assets/achievenment/move/' +
                      name +
                      '1' +
                      'Up' +
                      snailSpriteCount.toString() +
                      '.png'),
                ],
              ),
            ),
          );
        } else if (snailDirection == 'down') {
          return Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
            child: GestureDetector(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: rareColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Level : ' + level.toString(),
                  ),
                  Image.asset('assets/achievenment/move/' +
                      name +
                      '1' +
                      'Down' +
                      snailSpriteCount.toString() +
                      '.png'),
                ],
              ),
            ),
            // Image.asset('assets/achievenment/move/'+name+'Down'+ snailSpriteCount.toString()+'.png'),
          );
        } else {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: GestureDetector(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 120,
                width: 120,
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: rareColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Level : ' + level.toString(),
                    ),
                    Image.asset('assets/achievenment/move/' +
                        name +
                        '1' +
                        snailSpriteCount.toString() +
                        '.png'),
                  ],
                ),
                //Image.asset('assets/achievenment/move/'+name+snailSpriteCount.toString()+'.png'),
              ),
            ),
          );
        }
      } else if (level < 50) {
        if (snailDirection == 'left') {
          return Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
            child: GestureDetector(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: rareColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Level : ' + level.toString(),
                  ),
                  Image.asset('assets/achievenment/move/' +
                      name +
                      "2" +
                      snailSpriteCount.toString() +
                      '.png'),
                ],
              ),
            ),
          );
        } else if (snailDirection == 'up') {
          return Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
            child: GestureDetector(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: rareColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Level : ' + level.toString(),
                  ),
                  Image.asset('assets/achievenment/move/' +
                      name +
                      "2" +
                      'Up' +
                      snailSpriteCount.toString() +
                      '.png'),
                ],
              ),
            ),
          );
        } else if (snailDirection == 'down') {
          return Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
            child: GestureDetector(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: rareColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Level : ' + level.toString(),
                  ),
                  Image.asset('assets/achievenment/move/' +
                      name +
                      "2" +
                      'Down' +
                      snailSpriteCount.toString() +
                      '.png'),
                ],
              ),
            ),
            // Image.asset('assets/achievenment/move/'+name+'Down'+ snailSpriteCount.toString()+'.png'),
          );
        } else {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: GestureDetector(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 120,
                width: 120,
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: rareColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Level : ' + level.toString(),
                    ),
                    Image.asset('assets/achievenment/move/' +
                        name +
                        "2" +
                        snailSpriteCount.toString() +
                        '.png'),
                  ],
                ),
                //Image.asset('assets/achievenment/move/'+name+snailSpriteCount.toString()+'.png'),
              ),
            ),
          );
        }
      } else if (level == 50) {
        if (snailDirection == 'left') {
          return Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
            child: GestureDetector(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: rareColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Level : ' + level.toString(),
                  ),
                  Image.asset('assets/achievenment/move/' +
                      name +
                      "3" +
                      snailSpriteCount.toString() +
                      '.png'),
                ],
              ),
            ),
          );
        } else if (snailDirection == 'up') {
          return Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
            child: GestureDetector(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: rareColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Level : ' + level.toString(),
                  ),
                  Image.asset('assets/achievenment/move/' +
                      name +
                      "3" +
                      'Up' +
                      snailSpriteCount.toString() +
                      '.png'),
                ],
              ),
            ),
          );
        } else if (snailDirection == 'down') {
          return Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
            child: GestureDetector(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: rareColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Level : ' + level.toString(),
                  ),
                  Image.asset('assets/achievenment/move/' +
                      name +
                      "3" +
                      'Down' +
                      snailSpriteCount.toString() +
                      '.png'),
                ],
              ),
            ),
            // Image.asset('assets/achievenment/move/'+name+'Down'+ snailSpriteCount.toString()+'.png'),
          );
        } else {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: GestureDetector(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 120,
                width: 120,
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: rareColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Level : ' + level.toString(),
                    ),
                    Image.asset('assets/achievenment/move/' +
                        name +
                        "3" +
                        snailSpriteCount.toString() +
                        '.png'),
                  ],
                ),
                //Image.asset('assets/achievenment/move/'+name+snailSpriteCount.toString()+'.png'),
              ),
            ),
          );
        }
      }
    } else {
      if (snailDirection == 'left') {
        return Container(
          alignment: Alignment.bottomCenter,
          height: 120,
          width: 120,
          child: GestureDetector(
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: rareColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Level : ' + level.toString(),
                ),
                Image.asset('assets/achievenment/move/' +
                    name +
                    "1" +
                    snailSpriteCount.toString() +
                    '.png'),
              ],
            ),
          ),
        );
      } else if (snailDirection == 'up') {
        return Container(
          alignment: Alignment.bottomCenter,
          height: 120,
          width: 120,
          child: GestureDetector(
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: rareColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Level : ' + level.toString(),
                ),
                Image.asset('assets/achievenment/move/' +
                    name +
                    "1" +
                    'Up' +
                    snailSpriteCount.toString() +
                    '.png'),
              ],
            ),
          ),
        );
      } else if (snailDirection == 'down') {
        return Container(
          alignment: Alignment.bottomCenter,
          height: 120,
          width: 120,
          child: GestureDetector(
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: rareColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Level : ' + level.toString(),
                ),
                Image.asset('assets/achievenment/move/' +
                    name +
                    "1" +
                    'Down' +
                    snailSpriteCount.toString() +
                    '.png'),
              ],
            ),
          ),
          // Image.asset('assets/achievenment/move/'+name+'Down'+ snailSpriteCount.toString()+'.png'),
        );
      } else {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: GestureDetector(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 120,
              width: 120,
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: rareColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Level : ' + level.toString(),
                  ),
                  Image.asset('assets/achievenment/move/' +
                      name +
                      "1" +
                      snailSpriteCount.toString() +
                      '.png'),
                ],
              ),
              //Image.asset('assets/achievenment/move/'+name+snailSpriteCount.toString()+'.png'),
            ),
          ),
        );
      }
    }
    return Container();
  }
}
