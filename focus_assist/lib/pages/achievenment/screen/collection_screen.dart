// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:focus_assist/classes/ClassCardShop.dart';
// import 'package:focus_assist/classes/Data.dart';
// import 'package:focus_assist/classes/DbProvider.dart';
// import 'package:focus_assist/pages/achievenment/feature/CardCollection.dart';

// class CollectionScreen extends StatefulWidget {
//   @override
//   _CollectionScreenState createState() => _CollectionScreenState();
// }

// class _CollectionScreenState extends State<CollectionScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     LoadingVatPhamUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: (!StaticData.isDarkMode)?Colors.amber[400]:Colors.grey[900],
//       // appBar: AppBar(
//       //   leading: IconButton(
//       //     icon: Icon(Icons.arrow_back,color: Colors.black,),
//       //     onPressed: (){Navigator.pop(context);},
//       //   ),
//       //   backgroundColor: Colors.amber,
//       //   title: Text('Collection',
//       //   style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
//       //   elevation: 0,
//       //   centerTitle: true,
//       // ),
//       body: Container(
//             height: size.height,
//             child: Column(
//                 //crossAxisAlignment: CrossAxisAlignment.center,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 15,top: 15),
//                     child: Container(
//                       height: size.height*0.07,
//                       child: Row(
//                         children: [
//                           Container(
//                             // color: Colors.white,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: (!StaticData.isDarkMode)?Colors.white:Colors.grey[800],
//                             ),
//                             child: IconButton(
//                               icon: Icon(Icons.arrow_back),
//                               onPressed: (){
//                                 Navigator.pop(context);
//                               },
//                             ),
//                           ),
//                           SizedBox(
//                             width: size.width*0.2,
//                           ),
//                           Text(
//                             'Collection',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 25,
//                                 color: (!StaticData.isDarkMode)?Colors.grey[800]:Colors.grey[300],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: size.height*0.2,
//                     child: Image.asset('assets/achievenment/ui/ui_collection.png'),
//                   ),

//                   Container(
//                     margin: EdgeInsets.only(left: 20,right: 20),
//                     padding: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       color: (!StaticData.isDarkMode)?Colors.amber[200]:Colors.grey[800],
//                     ),
//                     height: size.height*0.7,
//                     child: DetailCardCollection(size: size),
//                   ),
//                 ],

//             ),
//           ),

//     );

//   }
//   void  LoadingVatPhamUser() async {

//     final infoVATPHAM = await DbProvider.instance.query('VATPHAM');
//     StaticData.EggShop.clear();
//     for (int i = 0; i < infoVATPHAM.length; i++) {
//       switch (infoVATPHAM[i]['DOHIEM']) {
//         case 1:
//           InfoEggs index = new InfoEggs(
//               infoVATPHAM[i]['MAVATPHAM'],
//               infoVATPHAM[i]['TENVATPHAM'],
//               infoVATPHAM[i]['MOTA'],
//               infoVATPHAM[i]['GIA'],
//               Colors.greenAccent,
//               'assets/achievenment/Eggs/egg'+infoVATPHAM[i]['TENVATPHAM']+'.png');
//           setState(() {
//             StaticData.EggShop.add(index);
//           });

//           break;
//         case 2:
//           InfoEggs index = new InfoEggs(
//               infoVATPHAM[i]['MAVATPHAM'],
//               infoVATPHAM[i]['TENVATPHAM'],
//               infoVATPHAM[i]['MOTA'],
//               infoVATPHAM[i]['GIA'],
//               Colors.blueAccent,
//               'assets/achievenment/Eggs/egg'+infoVATPHAM[i]['TENVATPHAM']+'.png');
//           setState(() {
//             StaticData.EggShop.add(index);
//           });
//           break;
//         case 3:
//           InfoEggs index = new InfoEggs(
//               infoVATPHAM[i]['MAVATPHAM'],
//               infoVATPHAM[i]['TENVATPHAM'],
//               infoVATPHAM[i]['MOTA'],
//               infoVATPHAM[i]['GIA'],
//               Colors.purpleAccent,
//               'assets/achievenment/Eggs/egg'+infoVATPHAM[i]['TENVATPHAM']+'.png');
//           setState(() {
//             StaticData.EggShop.add(index);
//           });
//           break;
//         case 4:
//           InfoEggs index = new InfoEggs(
//               infoVATPHAM[i]['MAVATPHAM'],
//               infoVATPHAM[i]['TENVATPHAM'],
//               infoVATPHAM[i]['MOTA'],
//               infoVATPHAM[i]['GIA'],
//               Colors.redAccent,
//               'assets/achievenment/Eggs/egg'+infoVATPHAM[i]['TENVATPHAM']+'.png');
//           setState(() {
//             StaticData.EggShop.add(index);
//           });
//           break;
//         default:
//           break;
//       }
//     }

//     StaticData.EggUser.clear();
//     String id = StaticData.userID;
//     final k = await DbProvider.instance.rawQuery('''
//       select * from VATPHAMNGUOIDUNG where MANGUOIDUNG = '$id'
//       '''
//     );


//     for (int i = 0 ; i < k.length; i++)
//     {
//         for (int j = 0; j < StaticData.EggShop.length; j++ )
//           {
//             if(StaticData.EggShop[j].MaVP == k[i]['MAVATPHAM'])
//               {
//                   setState(() {
//                     StaticData.EggUser.add(StaticData.EggShop[j]);
//                   });
//               }
//           }
//     }
//   }
// }
