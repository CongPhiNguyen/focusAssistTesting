import 'package:flutter/material.dart';

class PlaceInfo {
  final String name;
  final int diemThanhtuu;
  final String image;
  final int star;
  final Color startColor;
  final Color endColor;

  PlaceInfo(this.name, this.diemThanhtuu, this.star, this.image,
      this.startColor, this.endColor);
}

final List<PlaceInfo> items = [
  PlaceInfo('Rong 3 sao', 15, 3, 'assets/achievenment/achieImage/dragon3.png',
      (Colors.yellow), (Colors.yellow[600])!),
  PlaceInfo('Rong 2 sao', 10, 2, 'assets/achievenment/achieImage/dragon2.png',
      (Colors.brown[300])!, (Colors.brown[400])!),
  PlaceInfo('Rong 1 sao', 5, 1, 'assets/achievenment/achieImage/dragon1.png',
      (Colors.brown[300])!, (Colors.brown[400])!),
  PlaceInfo('Tap trung 5s', 5, 1, 'assets/achievenment/achieImage/clock.png',
      (Colors.grey[200])!, (Colors.grey[200])!),
  PlaceInfo('Tap trung 10s', 10, 2, 'assets/achievenment/achieImage/clock.png',
      (Colors.grey[200])!, (Colors.grey[200])!),
  PlaceInfo('Tap trung 15s', 15, 3, 'assets/achievenment/achieImage/clock.png',
      (Colors.yellow), (Colors.yellow[600])!),
  PlaceInfo('Rong 3 sao', 15, 3, 'assets/achievenment/achieImage/dragon3.png',
      (Colors.yellow), (Colors.yellow[600])!),
  PlaceInfo('Rong 2 sao', 10, 2, 'assets/achievenment/achieImage/dragon2.png',
      (Colors.brown[300])!, (Colors.brown[400])!),
  PlaceInfo('Rong 1 sao', 5, 1, 'assets/achievenment/achieImage/dragon1.png',
      (Colors.brown[300])!, (Colors.brown[400])!),
  PlaceInfo('Tap trung 5s', 5, 1, 'assets/achievenment/achieImage/clock.png',
      (Colors.grey[200])!, (Colors.grey[200])!),
  PlaceInfo('Tap trung 10s', 10, 2, 'assets/achievenment/achieImage/clock.png',
      (Colors.grey[200])!, (Colors.grey[200])!),
  PlaceInfo('Tap trung 15s', 15, 3, 'assets/achievenment/achieImage/clock.png',
      (Colors.yellow), (Colors.yellow[600])!),
];

class Achievenment {
  final String MATHANHTUU;
  final String TENTHANHTUU;
  final String MOTA;
  final int star;
  final Color startColor;
  final Color endColor;
  final int bonus;

  Achievenment(this.MATHANHTUU, this.TENTHANHTUU, this.MOTA, this.star,
      this.bonus, this.startColor, this.endColor);
}

final List<Achievenment> listAchievenment = [
  Achievenment('TT01', 'Blue', 'Tr???ng Blue', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT02', 'Carpentry', 'Tr???ng Carpentry', 1, 200,
      (Colors.brown[300])!, (Colors.brown[400])!),
  Achievenment('TT03', 'Cheese', 'Tr???ng Cheese', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT04', 'Chocolate', 'Tr???ng Chocolate', 1, 200,
      (Colors.brown[300])!, (Colors.brown[400])!),
  Achievenment('TT05', 'Cream', 'Tr???ng Cream', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT06', 'DeepBlue', 'Tr???ng DeepBlue', 1, 200,
      (Colors.brown[300])!, (Colors.brown[400])!),
  Achievenment('TT07', 'Demon', 'Tr???ng Demon', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT08', 'Diamod', 'Tr???ng Diamod', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT09', 'Electric', 'Tr???ng Electric', 1, 200,
      (Colors.brown[300])!, (Colors.brown[400])!),
  Achievenment('TT10', 'Fire', 'Tr???ng Fire', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT11', 'Forest', 'Tr???ng Forest', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT12', 'Ice', 'Tr???ng Ice', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT13', 'Loli', 'Tr???ng Loli', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT14', 'Magic', 'Tr???ng Magic', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT15', 'Rock', 'Tr???ng Rock', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT16', 'Silver', 'Tr???ng Silver', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT17', 'Sky', 'Tr???ng Sky', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT18', 'Strawberry', 'Tr???ng Strawberry', 1, 200,
      (Colors.brown[300])!, (Colors.brown[400])!),
  Achievenment('TT19', 'Sweety', 'Tr???ng Sweety', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
  Achievenment('TT20', 'Water', 'Tr???ng Water', 1, 200, (Colors.brown[300])!,
      (Colors.brown[400])!),
];
