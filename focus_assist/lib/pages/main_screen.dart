// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:focus_assist/pages/audio/soundControl.dart';
// import '../classes/Data.dart';
// import 'package:focus_assist/pages/timerScreen/Timer_Screen.dart';
// import '../classes/Data.dart';
// import '../classes/Data.dart';
// import 'farm/screen/farm_screen.dart';
// import 'progress_screen.dart';
// import 'settings/setting_screen.dart';
// import 'statistic/journal_screen.dart';

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _page = 0;
//   // GlobalKey _bottomNavigationKey = GlobalKey();

//   // Widget _showPage = new SettingScreen();

//   Widget _pageChooser(int page) {
//     switch (page) {
//       case 0:
//         return JournalScreen();
//       case 1:
//         return TimerScreen(
//           message: '',
//         );
//       case 2:
//         return ProgressScreen();
//       case 3:
//         return FarmScreen();
//       case 4:
//         return SettingScreen();
//       default:
//         break;
//     }
//     return JournalScreen();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 55.0,
//         // key: _bottomNavigationKey,
//         index: _page,
//         items: <Widget>[
//           Icon(
//             Icons.wysiwyg_rounded,
//             size: 30,
//             color: (_page == 0)
//                 ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
//                 : Theme.of(context)
//                     .bottomNavigationBarTheme
//                     .unselectedItemColor,
//           ),
//           Icon(
//             Icons.timer,
//             size: 30,
//             color: (_page == 1)
//                 ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
//                 : Theme.of(context)
//                     .bottomNavigationBarTheme
//                     .unselectedItemColor,
//           ),
//           Icon(
//             Icons.waterfall_chart,
//             size: 30,
//             color: (_page == 2)
//                 ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
//                 : Theme.of(context)
//                     .bottomNavigationBarTheme
//                     .unselectedItemColor,
//           ),
//           Icon(
//             Icons.star,
//             size: 30,
//             color: (_page == 3)
//                 ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
//                 : Theme.of(context)
//                     .bottomNavigationBarTheme
//                     .unselectedItemColor,
//           ),
//           Icon(
//             Icons.settings,
//             size: 30,
//             color: (_page == 4)
//                 ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
//                 : Theme.of(context)
//                     .bottomNavigationBarTheme
//                     .unselectedItemColor,
//           ),

//           // Icon(Icons.wysiwyg_rounded, size: 30, color: (_page == 0)?Theme.of(context).bottomNavigationBarTheme.selectedItemColor:Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,),
//           // Icon(Icons.timer, size: 30, color: (_page == 1)?Theme.of(context).bottomNavigationBarTheme.selectedItemColor:Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,),
//           // Icon(Icons.waterfall_chart, size: 30, color: (_page == 2)?Theme.of(context).bottomNavigationBarTheme.selectedItemColor:Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,),
//           // Icon(Icons.star,size:30, color: (_page == 3)?Theme.of(context).bottomNavigationBarTheme.selectedItemColor:Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,),
//           // Icon(Icons.settings, size: 30, color: (_page == 4)?Theme.of(context).bottomNavigationBarTheme.selectedItemColor:Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,),
//         ],
//         color: (!StaticData.isDarkMode) ? Colors.yellow[100] : Colors.grey[850],
//         backgroundColor:
//             Theme.of(context).bottomNavigationBarTheme.backgroundColor,
//         buttonBackgroundColor:
//             (!StaticData.isDarkMode) ? Colors.amber[400] : Colors.black,
//         animationCurve: Curves.easeInOut,
//         animationDuration: Duration(milliseconds: 600),
//         onTap: (int tappedIndex) {
//           if (_page == 1 && StaticData.focusTimerIsRunning == true) {
//             showDialogChange(
//                 context, "Timer is running, change tab now?", tappedIndex);
//           } else {
//             if (StaticData.timer != null) {
//               if (StaticData.timer.isActive && tappedIndex != 3) {
//                 StaticData.timer.cancel();
//               }
//             }
//             if (StaticData.timer2 != null) {
//               if (StaticData.timer2.isActive && tappedIndex != 3) {
//                 StaticData.timer2.cancel();
//               }
//             }
//             setState(() {
//               //_showPage = _pageChooser(tappedIndex);
//               _page = tappedIndex;
//               control.audioPlayer.pause();
//             });
//           }
//         },
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           //child: _showPage,
//           child: _pageChooser(_page),
//         ),
//       ),
//     );
//   }

//   void showDialogChange(context, String message, int tappedIndex) {
//     Alert(
//         context: context,
//         type: AlertType.warning,
//         title: 'Warning!!!',
//         closeIcon: Icon(Icons.error),
//         desc: message,
//         buttons: [
//           DialogButton(
//             child: Text(
//               "Continue",
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//             onPressed: () {
//               if (StaticData.timer != null) {
//                 if (StaticData.timer.isActive && tappedIndex != 3) {
//                   StaticData.timer.cancel();
//                 }
//               }
//               if (StaticData.timer2 != null && tappedIndex != 3) {
//                 if (StaticData.timer2.isActive) {
//                   StaticData.timer2.cancel();
//                 }
//                 StaticData.focusTimerIsRunning = false;
//                 control.audioPlayer.pause();
//               }
//               if (StaticData.timer3 != null) {
//                 if (StaticData.timer3.isActive) {
//                   StaticData.timer3.cancel();
//                 }
//               }
//               if (StaticData.gifcontroller.isAnimating)
//                 StaticData.gifcontroller.dispose();
//               setState(() {
//                 //_showPage = _pageChooser(tappedIndex);
//                 _page = tappedIndex;
//               });
//               Navigator.pop(context);
//             },
//             color: Color.fromRGBO(0, 179, 134, 1.0),
//           ),
//           DialogButton(
//             child: Text(
//               "Cancel",
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//             onPressed: () {
//               // setState(() {
//               //   //_showPage = _pageChooser(tappedIndex);
//               //   _page = 1;
//               // });
//               Navigator.pop(context);
//             },
//             gradient: LinearGradient(colors: [
//               Color.fromRGBO(116, 116, 191, 1.0),
//               Color.fromRGBO(52, 138, 199, 1.0)
//             ]),
//           )
//         ]).show();
//   }
// }
