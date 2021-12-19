// // ignore: file_names
// import 'package:flutter/material.dart';
// import 'package:focus_assist/classes/Data.dart';
// import 'package:focus_assist/classes/DbProvider.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

// class card_shop extends StatefulWidget {
//   final String? MAVP;
//   final String? name;
//   final int? price;
//   final String? imageEgg;
//   final Color? rareColor;
//   final bool? isBuy;
//   final Size? size;
//   final Function? updateVang;

//   card_shop(
//       {Key? key,
//       @required this.MAVP,
//       @required this.name,
//       @required this.price,
//       @required this.imageEgg,
//       @required this.rareColor,
//       @required this.isBuy,
//       @required this.size,
//       @required this.updateVang})
//       : super(key: key);

//   @override
//   _testState createState() => _testState(
//       MAVP, name, price, imageEgg, rareColor, isBuy, size, updateVang);
// }

// class _testState extends State<card_shop> {
//   String? MAVP;
//   String? name;
//   int? price;
//   String? imageEgg;
//   Color? rareColor;
//   bool? isBuy;
//   Size? size;
//   Function? updateVang;

//   _testState(this.MAVP, this.name, this.price, this.imageEgg, this.rareColor,
//       this.isBuy, this.size, this.updateVang);

//   void _Update() async {
//     String id = StaticData.userID;
//     //Kiểm tra có đủ tiền mua hay không
//     if ((StaticData.Vang)! >= (price)!) {
//       final e = await DbProvider.instance.rawQuery('''
//                                   select * from VATPHAMNGUOIDUNG where MANGUOIDUNG = '$id' and MAVATPHAM = '$MAVP'
//                                   ''');

//       //Kiểm tra đã có trứng này chưa
//       if (e.length == 0) {
//         Map<String, dynamic> row = {
//           'MAVATPHAM': MAVP,
//           'MANGUOIDUNG': StaticData.userID
//         };
//         int i = await DbProvider.instance.insert('VATPHAMNGUOIDUNG', row);
//         setState(() {
//           StaticData.Vang = (StaticData.Vang)! - (price)!;
//         });
//         updateVang!();
//         //Nhận thành tựu
//         bool isCheck = false;
//         for (int i = 0; i < StaticData.AchiUser.length; i++) {
//           if (StaticData.AchiUser[i].TENTHANHTUU == name) {
//             isCheck = true;
//           }
//         }

//         if (isCheck == false) {
//           int bonus = 1;
//           for (int i = 0; i < StaticData.AchiList.length; i++) {
//             if (StaticData.AchiList[i].TENTHANHTUU == name) {
//               StaticData.AchiUser.add(StaticData.AchiList[i]);
//               bonus = StaticData.AchiList[i].bonus;
//               setState(() {
//                 StaticData.Vang =
//                     (StaticData.Vang)! + StaticData.AchiList[i].bonus;
//               });

//               row = {
//                 'MATHANHTUU': StaticData.AchiList[i].MATHANHTUU,
//                 'MANGUOIDUNG': StaticData.userID
//               };
//               int e =
//                   await DbProvider.instance.insert('THANHTUUNGUOIDUNG', row);
//             }
//           }

//           setState(() {
//             isBuy = true;
//           });
//           int? vang = StaticData.Vang;
//           final k = await DbProvider.instance.rawQuery('''
//                                      UPDATE THONGTINNGUOIDUNG
//                                      SET VANG = $vang
//                                      WHERE MANGUOIDUNG = '$id'
//                                      ''');

//           _showBILL(context, "You got $name egg and $bonus bonus gold!", true);
//         } else {
//           setState(() {
//             StaticData.Vang = (StaticData.Vang)! - price!;
//             isBuy = true;
//           });
//           int? vang = StaticData.Vang;
//           final k = await DbProvider.instance.rawQuery('''
//                                      UPDATE THONGTINNGUOIDUNG
//                                      SET VANG = $vang
//                                      WHERE MANGUOIDUNG = '$id'
//                                      ''');
//           _showBILL(context, "Purchased successfully!", true);
//         }
//       } else {
//         _showBILL(context, "You already have this egg!", false);
//       }
//     } else {
//       _showBILL(context, "You don't have enough gold!", false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//       child: Stack(
//         children: <Widget>[
//           Container(
//             height: size!.height * 0.15,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: (!StaticData.isDarkMode)
//                       ? Colors.white
//                       : (Colors.grey[800])!,
//                   blurRadius: 1,
//                   offset: Offset(0, 5),
//                 ),
//               ],
//             ),
//           ),
//           Positioned.fill(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   flex: 4,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       SizedBox(
//                         height: size!.height * 0.03,
//                       ),
//                       Text(
//                         name!,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: size!.height * 0.02,
//                           letterSpacing: 2,
//                           color: rareColor,
//                         ),
//                       ),
//                       SizedBox(
//                         height: size!.height * 0.01,
//                       ),
//                       Text(
//                         price.toString(),
//                         style: TextStyle(
//                           fontWeight: FontWeight.w300,
//                           fontSize: size!.height * 0.015,
//                           fontStyle: FontStyle.italic,
//                           decoration: TextDecoration.overline,
//                         ),
//                       ),
//                       SizedBox(
//                         height: size!.height * 0.01,
//                       ),
//                       Container(
//                         height: size!.height * 0.05,
//                         width: size!.width * 0.2,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(25),
//                           child: ElevatedButton(
//                             //color: isBuy ? Colors.grey : Colors.green[400],
//                             style: ElevatedButton.styleFrom(
//                               primary: (isBuy)!
//                                   ? Colors.grey[600]
//                                   : (!StaticData.isDarkMode)
//                                       ? Colors.green[400]
//                                       : Colors.green[600],
//                             ),

//                             onPressed: _Update,
//                             child: Text(
//                               isBuy! ? 'Purchased' : 'Purchase',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: size!.height * 0.012,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Image.asset(
//                     imageEgg!,
//                     height: size!.width * 0.25,
//                     width: size!.width * 0.2,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showBILL(context, String message, bool isBuy) {
//     if (isBuy == true) {
//       Alert(
//         context: context,
//         type: AlertType.success,
//         title: "",
//         closeIcon: Icon(Icons.error),
//         desc: message,
//         style: AlertStyle(
//           descStyle: TextStyle(
//             color: (!StaticData.isDarkMode) ? Colors.black87 : Colors.grey[300],
//           ),
//         ),
//         buttons: [
//           DialogButton(
//             child: Text(
//               "ACCEPT",
//               style: TextStyle(
//                   color: (!StaticData.isDarkMode)
//                       ? Colors.white
//                       : Colors.grey[300],
//                   fontSize: 20),
//             ),
//             color: (!StaticData.isDarkMode)
//                 ? Colors.greenAccent
//                 : Colors.grey[700],
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             width: 120,
//           )
//         ],
//       ).show();
//     } else {
//       Alert(
//         context: context,
//         type: AlertType.warning,
//         title: "",
//         closeIcon: Icon(Icons.error),
//         desc: message,
//         style: AlertStyle(
//           descStyle: TextStyle(
//             color: (!StaticData.isDarkMode) ? Colors.black87 : Colors.grey[300],
//           ),
//         ),
//         buttons: [
//           DialogButton(
//             child: Text(
//               "ACCEPT",
//               style: TextStyle(
//                   color: (!StaticData.isDarkMode)
//                       ? Colors.white
//                       : Colors.grey[300],
//                   fontSize: 20),
//             ),
//             color: (!StaticData.isDarkMode)
//                 ? Colors.greenAccent
//                 : Colors.grey[700],
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             width: 120,
//           )
//         ],
//       ).show();
//     }
//   }
// }



// /*
// class card_shop extends StatelessWidget {
//   final String MAVP;
//   final String name;
//   final int price;
//   final String imageEgg;
//   final Color rareColor;
//   final bool isBuy;
//   final Size size;
//   const card_shop({
//     Key key,
//     @required this.size, this.name, this.price, this.imageEgg, this.rareColor, this.MAVP, this.isBuy,
//   }) : super(key: key);



//   @override
//   Widget build(BuildContext context) {

//    bool a = isBuy;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
//       child: Stack(
//         children: <Widget>[
//           Container(
//             height: size.height*0.15,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.white,
//                   blurRadius: 1,
//                   offset: Offset(0,5),
//                 ),
//               ],
//             ),
//           ),
//           Positioned.fill(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   flex: 4,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       SizedBox(height: size.height*0.03,),
//                       Text(
//                         name,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 2,
//                           color: rareColor,
//                         ),
//                       ),
//                       SizedBox(height: size.height*0.01,),
//                       Text(
//                         price.toString(),
//                         style: TextStyle(
//                           fontWeight: FontWeight.w300,
//                           fontStyle: FontStyle.italic,
//                           decoration: TextDecoration.overline,
//                         ),
//                       ),
//                       SizedBox(height: size.height*0.01,),
//                       Container(
//                         height: size.height*0.05,
//                         width: size.width*0.2,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(25),
//                           child: FlatButton(
//                             color: a ? Colors.grey : Colors.green[400],
//                             onPressed: () async {
//                                 String id = StaticData.userID;
//                                 //Kiểm tra có đủ tiền mua hay không
//                                 if (StaticData.Vang >= price ) {
//                                   final e = await DbProvider.instance.rawQuery('''
//                                   select * from VATPHAMNGUOIDUNG where MANGUOIDUNG = '$id' and MAVATPHAM = '$MAVP'
//                                   '''
//                                   );

//                                   //Kiểm tra đã có trứng này chưa
//                                   if (e.length == 0) {
//                                      Map<String, dynamic> row = {'MAVATPHAM':MAVP , 'MANGUOIDUNG':StaticData.userID};
//                                      int i = await DbProvider.instance.insert('VATPHAMNGUOIDUNG', row);
//                                      StaticData.Vang -= price;


//                                      //Nhận thành tựu
//                                      int bonus;
//                                      for (int i = 0; i < StaticData.AchiList.length; i++)
//                                        {
//                                          if(StaticData.AchiList[i].TENTHANHTUU == name)
//                                            {
//                                              bonus = StaticData.AchiList[i].bonus;
//                                              StaticData.Vang += StaticData.AchiList[i].bonus;
//                                              row = {'MATHANHTUU':StaticData.AchiList[i].MATHANHTUU, 'MANGUOIDUNG':StaticData.userID};
//                                              int e = await DbProvider.instance.insert('THANHTUUNGUOIDUNG', row);
//                                            }
//                                        }

//                                      a= true;
//                                      int vang = StaticData.Vang;
//                                      final k = await DbProvider.instance.rawQuery('''
//                                      UPDATE THONGTINNGUOIDUNG
//                                      SET VANG = $vang
//                                      WHERE MANGUOIDUNG = '$id'
//                                      ''');


//                                      _showBILL(context, "Bạn nhận được thành tựu và thưởng $bonus", true);
//                                    }
//                                   else {
//                                     _showBILL(context, "Bạn đã sở hữu quả trứng này", false);
//                                   }

//                                 } else {
//                                   _showBILL(context, "Không làm mà đòi có ăn :) ", false);
//                                 }

//                             },
//                             child: Text(
//                               a ? 'Đã mua' : 'Mua',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 10,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Image.asset(
//                     imageEgg,
//                     height: size.width*0.2,
//                     width: size.width*0.2,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// */



