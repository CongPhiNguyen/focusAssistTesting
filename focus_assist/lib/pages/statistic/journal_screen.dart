// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:focus_assist/pages/statistic//edit_group_dialog.dart';
// import 'package:focus_assist/pages/statistic//list_of_achivement_screen.dart';
// import 'package:focus_assist/pages/statistic//view_activity_screen.dart';
// import 'package:focus_assist/pages/statistic//add_new_activity_screen.dart';
// import 'package:focus_assist/pages/statistic//add_new_group_dialog.dart';
// import 'package:focus_assist/classes/Data.dart';
// import 'package:focus_assist/classes/DbProvider.dart';

// class ToDo {
//   bool check;
//   String task;
//   String taskKey;
//   ToDo({required this.check, required this.task, required this.taskKey});
// }

// class JournalScreen extends StatefulWidget {
//   @override
//   _JournalScreenState createState() => _JournalScreenState();
// }

// class _JournalScreenState extends State<JournalScreen> {
//   // Các biến dùng trong cái lịch
//   late CalendarFormat _calendarFormat;
//   late DateTime _focusedDay;
//   late DateTime _selectedDay;

//   // Các biến để lưu dữ liệu các ngày
//   late List<String> items1;
//   late List<String> items;
//   late List<ToDo> toDos;
//   late List<String> allActivity, allActivityKey;

//   late Map<String, double> dataMap;

//   //Các biến thực hiện việc xử lý dữ liệu
//   final dbHelper = DbProvider.instance;
//   late List<Map<dynamic, dynamic>> database;
//   late List<String> allGroup, allGroupKey;
//   late List<List<String>> allGroupActivity, allGroupActivityKey;
//   late List<String> doneList, doneListKey;
//   late String quotes;

//   late String rate;

//   late bool gotAchive;
//   late int targetToReach;
//   @override
//   void initState() {
//     super.initState();
//     gotAchive = false;
//     targetToReach = 75;
//     quotes = '';
//     allGroup = ['None'];
//     doneList = ['Nothing'];
//     doneListKey = ['None'];
//     allGroupKey = ['NONE'];
//     allGroupActivity = [];
//     allGroupActivityKey = [];
//     _calendarFormat = CalendarFormat.week;
//     _focusedDay = DateTime.now();
//     _selectedDay = _focusedDay;
//     items1 = ["Chơi cờ vua", "Luyện tập code", "Cày game"];
//     toDos = [
//       ToDo(check: false, task: "Nothing", taskKey: 'None'),
//     ];

//     items = [];
//     dataMap = {"Skip": 500, "Done": 322, "Fail": 112};
//     allActivity = ["Nothing"];
//     allActivityKey = ['None'];
//     loadGold();
//     getAllActivity();
//     getToDoList();
//     getAllGroup();
//     getDoneTask();
//     achiveNotification();

//     rate = '0';
//   }

//   int dateTimeToInt(DateTime dateTime) {
//     return dateTime.year * 10000 + dateTime.month * 100 + dateTime.day;
//   }

//   DateTime intToDateTime(int dateTimeInt) {
//     int year = (dateTimeInt / 10000).floor();
//     int month = (dateTimeInt / 100).floor() % 100;
//     int day = dateTimeInt % 100;
//     return DateTime(year, month, day);
//   }

//   void loadGold() async {
//     String userID = StaticData.userID;
//     List<Map> database = await dbHelper.rawQuery(
//         ''' select * from THONGTINNGUOIDUNG where MANGUOIDUNG='$userID' ''');
//     if (database.length > 0) {
//       if (this.mounted) {
//         setState(() {
//           StaticData.Vang = database[0]['VANG'];
//         });
//       } else {
//         return;
//       }
//     }
//   }

//   Future<void> getDoneTask() async {
//     String userID = StaticData.userID;
//     int selectedDay = dateTimeToInt(_selectedDay);
//     database = await dbHelper.rawQuery(
//         ''' select * from MUCTIEU where MAMUCTIEU in (select MAMUCTIEU from THONGKE where NGAYHOANTHANH=$selectedDay) and MANGUOIDUNG='$userID' ''');
//     if (database.length == 0) {
//       if (this.mounted) {
//         setState(() {
//           doneList = ['Nothing'];
//           doneListKey = ['None'];
//         });
//       }
//     }
//     if (database.length > 0) {
//       doneList = [];
//       doneListKey = [''];
//       String k = DateFormat('EEEE').format(_selectedDay);
//       List<String> daysofWeek = [
//         'Monday',
//         'Tuesday',
//         'Wednesday',
//         'Thursday',
//         'Friday',
//         'Saturday',
//         'Sunday'
//       ];
//       int indexOfK = daysofWeek.indexOf(k);
//       for (int i = 0; i < database.length; i++) {
//         DateTime start =
//             intToDateTime(int.parse(database[i]['NGAYBATDAU'].toString()));
//         if (_selectedDay.year < start.year) {
//           continue;
//         } else if (_selectedDay.year == start.year) {
//           if (_selectedDay.month < start.month) {
//             continue;
//           } else if (_selectedDay.month == start.month) {
//             if (_selectedDay.day < start.day) {
//               continue;
//             }
//           }
//         }
//         if (database[i]['LOAIHINH'] == 'Fixed') {
//           String h = database[i]['CACNGAY'].toString();
//           // Xử lý vì chuyển từ int nên có thể không đủ 7 chữ số
//           while (h.length < 7) {
//             h = '0' + h;
//           }
//           if (h[indexOfK] == '1') {
//             if (this.mounted) {
//               setState(() {
//                 doneList.add(database[i]['TENMUCTIEU']);
//                 doneListKey.add(database[i]['MAMUCTIEU']);
//               });
//             }
//           }
//         } else if (database[i]['LOAIHINH'] == 'Flexible') {
//           if (this.mounted) {
//             setState(() {
//               doneList.add(database[i]['TENMUCTIEU']);
//               doneListKey.add(database[i]['MAMUCTIEU']);
//             });
//           }
//         } else if (database[i]['LOAIHINH'] == 'Repeating') {
//           int val = int.parse(database[i]['KHOANGTHOIGIAN'].toString());
//           Duration diff = start.difference(_selectedDay);
//           if (diff.inDays % val == 0) {
//             if (this.mounted) {
//               setState(() {
//                 doneList.add(database[i]['TENMUCTIEU']);
//                 doneListKey.add(database[i]['MAMUCTIEU']);
//               });
//             }
//           }
//         }
//       }
//     }
//     double rateInt = 0;
//     if (doneList.length == 0 ||
//         (doneList.length == 1 && doneListKey[0] == 'None'))
//       rateInt = 0;
//     else if (toDos.length == 0 ||
//         (toDos.length == 1 && toDos[0].taskKey == 'None')) {
//       rateInt = 100;
//     } else
//       rateInt = ((doneList.length.toDouble() *
//           100.0 /
//           (toDos.length.toDouble() + doneList.length.toDouble())));
//     if (rateInt > 100) rateInt = 100;
//     if (this.mounted) {
//       setState(() {
//         rate = rateInt.toString();
//         if (rate.length > 8) {
//           rate = rate.substring(0, 8);
//         }
//       });
//     }
//     if (doneList.length == 0) {
//       if (this.mounted) {
//         setState(() {
//           doneList = ['Nothing'];
//           doneListKey = ['None'];
//         });
//       }
//     }
//   }

//   // ignore: non_constant_identifier_names
//   Widget DoneTask() {
//     return Column(
//       children: [
//         Container(
//             decoration: BoxDecoration(
//                 // color: (!StaticData.isDarkMode)?Color(0xff73a656):Colors.grey[800],
//                 color: (!StaticData.isDarkMode)
//                     ? Colors.greenAccent[700]
//                     : Colors.grey[800],
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                 )),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child:
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Expanded(
//                   flex: 1,
//                   child: InkWell(
//                       onTap: () {
//                         getDoneTask();
//                       },
//                       child: Image.asset('assets/done.png',
//                           width: 30, height: 30)),
//                 ),
//                 Expanded(
//                   flex: 6,
//                   child: Text(
//                     "Done",
//                     style: TextStyle(color: Colors.white, fontSize: 22),
//                     // style: TextStyle(fontSize: 22),
//                   ),
//                 ),
//               ]),
//             )),
//         ListView.builder(
//           shrinkWrap: true,
//           itemCount: doneList.length,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 ListTile(
//                   title: Center(
//                     child: Text(
//                       doneList[index],
//                       // style: TextStyle(color: Colors.black)
//                     ),
//                   ),
//                   tileColor: (!StaticData.isDarkMode)
//                       ? Colors.white
//                       : Colors.grey[700],
//                 ),
//                 Divider(height: 1, color: Colors.black45)
//               ],
//             );
//           },
//         ),
//         Container(
//           height: 20,
//           decoration: BoxDecoration(
//               // color: (!StaticData.isDarkMode)?Color(0xff73a656):Colors.grey[800],
//               color: (!StaticData.isDarkMode)
//                   ? Colors.greenAccent[700]
//                   : Colors.grey[800],
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10),
//               )),
//         )
//       ],
//     );
//   }

//   void getAllActivity() async {
//     String userID = StaticData.userID;
//     database = await dbHelper
//         .rawQuery('''select * from MUCTIEU where MANGUOIDUNG='$userID' ''');
//     if (database.length == 0) {
//       if (this.mounted) {
//         setState(() {
//           allActivity = ['Nothing'];
//           allActivityKey = ['None'];
//         });
//       }
//     }
//     if (database.length > 0) {
//       if (this.mounted) {
//         setState(() {
//           allActivity.clear();
//           allActivityKey.clear();
//           for (int i = 0; i < database.length; i++) {
//             allActivity.add(database[i]['TENMUCTIEU']);
//             allActivityKey.add(database[i]['MAMUCTIEU']);
//           }
//         });
//       }
//     }
//   }

//   Future<void> getToDoList() async {
//     int selectedDay = dateTimeToInt(_selectedDay);
//     String userID = StaticData.userID;
//     List<Map<dynamic, dynamic>> database = await dbHelper.rawQuery(
//         ''' select * from MUCTIEU where MAMUCTIEU not in (select MAMUCTIEU from THONGKE where NGAYHOANTHANH=$selectedDay) and MANGUOIDUNG='$userID' ''');
//     List<Map<dynamic, dynamic>> flexibleData = [];
//     if (database.length == 0) {
//       if (this.mounted) {
//         setState(() {
//           toDos = [
//             ToDo(check: false, task: "Nothing", taskKey: 'None'),
//           ];
//         });
//       }
//     }
//     if (database.length > 0) {
//       toDos = [];
//       String k = DateFormat('EEEE').format(_selectedDay);
//       List<String> daysofWeek = [
//         'Monday',
//         'Tuesday',
//         'Wednesday',
//         'Thursday',
//         'Friday',
//         'Saturday',
//         'Sunday'
//       ];
//       int indexOfK = daysofWeek.indexOf(k);
//       for (int i = 0; i < database.length; i++) {
//         DateTime start =
//             intToDateTime(int.parse(database[i]['NGAYBATDAU'].toString()));
//         if (_selectedDay.year < start.year) {
//           continue;
//         } else if (_selectedDay.year == start.year) {
//           if (_selectedDay.month < start.month) {
//             continue;
//           } else if (_selectedDay.month == start.month) {
//             if (_selectedDay.day < start.day) {
//               continue;
//             }
//           }
//         }
//         if (database[i]['LOAIHINH'] == 'Fixed') {
//           String h = database[i]['CACNGAY'].toString();
//           while (h.length < 7) {
//             h = '0' + h;
//           }
//           if (h[indexOfK] == '1') {
//             if (this.mounted) {
//               setState(() {
//                 toDos.add(ToDo(
//                     check: false,
//                     task: database[i]['TENMUCTIEU'],
//                     taskKey: database[i]['MAMUCTIEU']));
//               });
//             }
//           }
//         } else if (database[i]['LOAIHINH'] == 'Flexible') {
//           // Quăng ra ngoài rồi hẵn xử lý
//           flexibleData.add(database[i]);
//         } else if (database[i]['LOAIHINH'] == 'Repeating') {
//           int val = int.parse(database[i]['KHOANGTHOIGIAN'].toString());
//           Duration diff = start.difference(_selectedDay);
//           if (diff.inDays % val == 0) {
//             if (this.mounted) {
//               setState(() {
//                 toDos.add(
//                   ToDo(
//                       check: false,
//                       task: database[i]['TENMUCTIEU'],
//                       taskKey: database[i]['MAMUCTIEU']),
//                 );
//               });
//             }
//           }
//         }
//       }
//     }
//     List<String> daysofWeek = [
//       'Monday',
//       'Tuesday',
//       'Wednesday',
//       'Thursday',
//       'Friday',
//       'Saturday',
//       'Sunday'
//     ];
//     // Flexible Handler
//     for (int i = 0; i < flexibleData.length; i++) {
//       // Rắc rối nhất là ở đây
//       // Lấy số lần đã làm trong tuần

//       // Lấy thứ của ngày hiện tại
//       String day = DateFormat('EEEE').format(_selectedDay);
//       int indexOfDay = daysofWeek.indexOf(day);
//       int selectedDay = dateTimeToInt(_selectedDay);
//       // Số của ngày đầu tuần
//       int startOfWeek = selectedDay - indexOfDay;
//       int endOfWeek = selectedDay + 6 - indexOfDay;
//       String key = flexibleData[i]['MAMUCTIEU'];
//       // Lấy từ đầu tuần tới cuối tuần của cái bảng thống kê để coi thử làm đc bao nhiêu lần rồi
//       List<Map<dynamic, dynamic>> data = await dbHelper.rawQuery(
//           '''select count(*) as SOLAN from THONGKE where NGAYHOANTHANH>=$startOfWeek and NGAYHOANTHANH<=$endOfWeek and MAMUCTIEU='$key' ''');
//       print(data.toString());
//       int count = 0;
//       if (data.length == 0) {
//         count = 0;
//       } else
//         count = data[0]['SOLAN'];
//       if (flexibleData[i]['SOLAN'] <= count) {
//         continue;
//       }
//       if (this.mounted) {
//         setState(() {
//           toDos.add(
//             ToDo(
//                 check: false,
//                 task: flexibleData[i]['TENMUCTIEU'] +
//                     '  $count/' +
//                     flexibleData[i]['SOLAN'].toString(),
//                 taskKey: flexibleData[i]['MAMUCTIEU']),
//           );
//         });
//       }
//     }
//     if (toDos.length == 0) {
//       if (this.mounted) {
//         setState(() {
//           toDos = [
//             ToDo(check: false, task: "Nothing", taskKey: 'None'),
//           ];
//         });
//       }
//     }
//   }

//   void finishActivity(int index) async {
//     if (toDos[index].taskKey == 'None') return;
//     await showDialog(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//               title: Text(
//                 "Confirmation",
//                 textAlign: TextAlign.center,
//               ),
//               content:
//                   Text("Completed \'" + toDos[index].task.toString() + "\' ?"),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("No"),
//                 ),
//                 TextButton(
//                   onPressed: () async {
//                     Navigator.pop(context);
//                     setState(() {
//                       toDos[index].check = true;
//                     });
//                     // Thêm 5 vàng
//                     int golds = StaticData.Vang! + 5;
//                     //Add vào database
//                     String userKey = StaticData.userID;
//                     dbHelper.rawQuery(
//                         ''' update THONGTINNGUOIDUNG set VANG=$golds where MANGUOIDUNG='$userKey' ''');
//                     loadGold();
//                     // Xoá sổ todos bằng cách thêm vào bảng thống kê
//                     Map<String, dynamic> row = {
//                       'MAMUCTIEU': toDos[index].taskKey,
//                       'NGAYHOANTHANH': dateTimeToInt(_selectedDay)
//                     };
//                     final id = await dbHelper.insert('THONGKE', row);
//                     print('inserted row id: $id');
//                     getToDoList();
//                     getDoneTask();
//                   },
//                   child: Text("Yes"),
//                 ),
//               ],
//             ));
//     getDoneTask();
//   }

//   // ignore: non_constant_identifier_names
//   Widget ToDoList() {
//     return Column(
//       children: [
//         Container(
//             decoration: BoxDecoration(
//                 // color: (!StaticData.isDarkMode)?Color(0xffe7e732):Colors.grey[800],
//                 color: (!StaticData.isDarkMode)
//                     ? Colors.amberAccent[700]
//                     : Colors.grey[800],
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                 )),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child:
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Expanded(
//                   flex: 1,
//                   child: InkWell(
//                     onTap: () {
//                       getToDoList();
//                       getDoneTask();
//                     },
//                     child: Image.asset(
//                       'assets/todo.png',
//                       width: 30,
//                       height: 30,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 6,
//                   child: Text(
//                     "To do",
//                     style: TextStyle(color: Colors.white, fontSize: 22),
//                   ),
//                 ),
//               ]),
//             )),
//         ListView.builder(
//           shrinkWrap: true,
//           itemCount: toDos.length,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 CheckboxListTile(
//                   value: toDos[index].check,
//                   controlAffinity: ListTileControlAffinity.trailing,
//                   title: Center(
//                     child: Text(
//                       toDos[index].task,
//                       // style: TextStyle(color: Colors.black)
//                     ),
//                   ),
//                   tileColor: (!StaticData.isDarkMode)
//                       ? Colors.white
//                       : Colors.grey[700]!,
//                   onChanged: (bool? value) async {
//                     finishActivity(index);
//                   },
//                 ),
//                 Divider(height: 1, color: Colors.black45)
//               ],
//             );
//           },
//         ),
//         Container(
//           height: 20,
//           decoration: BoxDecoration(
//               // color: (!StaticData.isDarkMode)?Color(0xffe7e732):Colors.grey[800],
//               color: (!StaticData.isDarkMode)
//                   ? Colors.amberAccent[700]
//                   : Colors.grey[800],
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10),
//               )),
//         )
//       ],
//     );
//   }

//   // ignore: non_constant_identifier_names
//   Widget AllActivity() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//       child: Column(
//         children: [
//           Container(
//               decoration: BoxDecoration(
//                   color: (!StaticData.isDarkMode)
//                       ? Color(0xffF4A460)
//                       : Colors.grey[800],
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   )),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child:
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Text(
//                     "All activities",
//                     style: TextStyle(color: Colors.white, fontSize: 22),
//                   ),
//                 ]),
//               )),
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: allActivity.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   InkWell(
//                     onTap: () async {
//                       if (allActivityKey[index] == 'None') return;
//                       await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ViewActivity(
//                                     activityKey: allActivityKey[index],
//                                     activityName: allActivity[index],
//                                     key: Key(''),
//                                   )));
//                       getAllActivity();
//                       getToDoList();
//                       getDoneTask();
//                       getAllGroup();
//                     },
//                     child: ListTile(
//                       title: Center(
//                         child: Text(
//                           allActivity[index],
//                           // style: TextStyle(color: Colors.black)
//                         ),
//                       ),
//                       tileColor: (!StaticData.isDarkMode)
//                           ? Colors.white
//                           : Colors.grey[700],
//                     ),
//                   ),
//                   Divider(height: 1, color: Colors.black45)
//                 ],
//               );
//             },
//           ),
//           Container(
//             height: 20,
//             decoration: BoxDecoration(
//                 color: (!StaticData.isDarkMode)
//                     ? Color(0xffF4A460)
//                     : Colors.grey[800],
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                 )),
//           )
//         ],
//       ),
//     );
//   }

//   // ignore: non_constant_identifier_names
//   Widget GroupTable() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: List<Widget>.generate(allGroup.length, (int index) {
//               return Row(children: [
//                 GroupActivity(index),
//                 SizedBox(
//                   width: 30,
//                 )
//               ]);
//             })),
//       ),
//     );
//   }

//   void getGroupActivity(int index) async {
//     String key = allGroupKey[index];
//     String userID = StaticData.userID;
//     database = await dbHelper.rawQuery(
//         '''select * from MUCTIEU where MANHOM='$key' and MANGUOIDUNG='$userID' ''');
//     List<String> tempActivity = [];
//     List<String> tempActivityKey = [];
//     for (int j = 0; j < database.length; j++) {
//       tempActivity.add(database[j]['TENMUCTIEU']);
//       tempActivityKey.add(database[j]['MAMUCTIEU']);
//     }
//     if (this.mounted) {
//       setState(() {
//         allGroupActivity[index] = tempActivity;
//         allGroupActivityKey[index] = tempActivityKey;
//       });
//     }
//   }

//   void getAllGroup() async {
//     if (this.mounted) {
//       setState(() {
//         allGroup = [];
//         allGroupKey = [];
//       });
//     }

//     String userID = StaticData.userID;
//     database = await dbHelper
//         .rawQuery('''select * from NHOMMUCTIEU where MANGUOIDUNG='$userID' ''');
//     for (int i = 0; i < database.length; i++) {
//       if (this.mounted) {
//         setState(() {
//           allGroup.add(database[i]['TENNHOM']);
//           allGroupKey.add(database[i]['MANHOM']);
//         });
//       }
//     }
//     for (int i = 0; i < allGroupKey.length; i++) {
//       if (this.mounted) {
//         setState(() {
//           allGroupActivity.add([]);
//           allGroupActivityKey.add([]);
//         });
//       }
//     }
//     for (int i = 0; i < allGroup.length; i++) {
//       getGroupActivity(i);
//     }
//   }

//   void editGroup(inDex) async {
//     await showDialog(
//       context: context,
//       builder: (_) => EditGroup(
//         groupKey: allGroupKey[inDex],
//         groupName: allGroup[inDex],
//         key: Key(''),
//       ),
//     );
//     getAllGroup();
//   }

//   void deletingGroup(inDex) async {
//     await showDialog(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//               title: Center(child: Text("Confirmation")),
//               content: Text("Are you sure you want to delete this group ?"),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("No"),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     deleteGroup(inDex);
//                   },
//                   child: Text("Yes"),
//                 )
//               ],
//             ));
//     getAllActivity();
//     getToDoList();
//     getAllGroup();
//   }

//   // ignore: non_constant_identifier_names
//   Widget GroupActivity(inDex) {
//     return Align(
//       alignment: Alignment.topLeft,
//       child: Container(
//         width: 270,
//         child: Column(
//           children: [
//             Container(
//                 decoration: BoxDecoration(
//                     color: (!StaticData.isDarkMode)
//                         ? Color(0xffe66771)
//                         : Colors.grey[800],
//                     // color: (!StaticData.isDarkMode)?Colors.red[300]:Colors.grey[800],
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                     )),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(20, 2, 2, 2),
//                           child: Container(
//                             width: 150,
//                             child: Text(
//                               allGroup[inDex],
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 22),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             InkWell(
//                                 onTap: () async {
//                                   editGroup(inDex);
//                                 },
//                                 child: Icon(Icons.edit,
//                                     color: (!StaticData.isDarkMode)
//                                         ? Colors.white
//                                         : Colors.grey)),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             InkWell(
//                                 onTap: () async {
//                                   deletingGroup(inDex);
//                                 },
//                                 child: Icon(Icons.delete,
//                                     color: (!StaticData.isDarkMode)
//                                         ? Colors.white
//                                         : Colors.grey)),
//                             SizedBox(
//                               width: 10,
//                             )
//                           ],
//                         )
//                       ]),
//                 )),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: allGroupActivity[inDex].length,
//               itemBuilder: (context, index) {
//                 return Column(
//                   children: [
//                     InkWell(
//                       onTap: () async {
//                         await Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ViewActivity(
//                                       activityKey: allGroupActivityKey[inDex]
//                                           [index],
//                                       activityName: allGroupActivity[inDex]
//                                           [index],
//                                       key: Key(''),
//                                     )));
//                         getAllActivity();
//                         getToDoList();
//                         getAllGroup();
//                       },
//                       child: ListTile(
//                         title: Center(
//                           child: Text(
//                             allGroupActivity[inDex][index],
//                             overflow: TextOverflow.ellipsis,
//                             // style: TextStyle(color: Colors.black)
//                           ),
//                         ),
//                         tileColor: (!StaticData.isDarkMode)
//                             ? Colors.white
//                             : Colors.grey[700],
//                       ),
//                     ),
//                     Divider(height: 1, color: Colors.black45)
//                   ],
//                 );
//               },
//             ),
//             Container(
//               height: 15,
//               decoration: BoxDecoration(
//                   color: (!StaticData.isDarkMode)
//                       ? Color(0xffe66771)
//                       : Colors.grey[800],
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void deleteGroup(inDex) {
//     String key = allGroupKey[inDex];
//     //Delete group
//     dbHelper.rawQuery(''' delete from NHOMMUCTIEU where MANHOM='$key' ''');
//   }

//   void dayChanging() {
//     getToDoList();
//     getDoneTask();
//   }

//   void addNewGroup() async {
//     await showDialog(
//       context: context,
//       builder: (_) => AddGroup(),
//     );
//     getAllActivity();
//     getToDoList();
//     getAllGroup();
//   }

//   // ignore: non_constant_identifier_names
//   Widget Calendar() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//       child: Column(
//         children: [
//           TableCalendar(
//             firstDay: DateTime.utc(2010, 10, 16),
//             lastDay: DateTime.utc(2030, 3, 14),
//             startingDayOfWeek: StartingDayOfWeek.monday,
//             focusedDay: _focusedDay,
//             calendarFormat: _calendarFormat,
//             selectedDayPredicate: (day) {
//               return isSameDay(_selectedDay, day);
//             },
//             onDaySelected: (selectedDay, focusedDay) {
//               if (!isSameDay(_selectedDay, selectedDay)) {
//                 if (this.mounted) {
//                   setState(() {
//                     _selectedDay = selectedDay;
//                     _focusedDay = focusedDay;
//                     if (_selectedDay == DateTime.utc(2021, 4, 25)) {
//                       setState(() {
//                         this.items = items1;
//                       });
//                     } else
//                       setState(() {
//                         this.items = [];
//                       });
//                   });
//                 }

//                 dayChanging();
//               }
//             },
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 if (this.mounted) {
//                   setState(() {
//                     _calendarFormat = format;
//                   });
//                 }
//               }
//             },
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },

//             calendarStyle: CalendarStyle(
//               defaultTextStyle: TextStyle(fontSize: 20),
//               weekendTextStyle: TextStyle(fontSize: 20),
//               rowDecoration: BoxDecoration(
//                 color: (!StaticData.isDarkMode)
//                     ? Colors.white
//                     : Colors.blueGrey[700],
//               ),
//             ),

//             // Đây là các dòng chỉnh cái header ở trên của cái lịch
//             headerStyle: HeaderStyle(
//               decoration: BoxDecoration(
//                   color: (!StaticData.isDarkMode)
//                       ? Colors.cyan
//                       : Colors.blueGrey[900],
//                   border: Border.all(
//                       color:
//                           (!StaticData.isDarkMode) ? Colors.white : Colors.grey,
//                       width: 0),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   )),
//               titleCentered: true,
//               titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
//               formatButtonShowsNext: true,
//               formatButtonVisible: false,
//               leftChevronIcon: Icon(
//                 Icons.chevron_left,
//                 color: (!StaticData.isDarkMode) ? Colors.white : Colors.grey,
//               ),
//               rightChevronIcon: Icon(Icons.chevron_right,
//                   color: (!StaticData.isDarkMode) ? Colors.white : Colors.grey),
//             ),

//             ////Chỉnh định dạng của các ngày trong tuần
//             daysOfWeekHeight: 40,
//             daysOfWeekStyle: DaysOfWeekStyle(
//                 decoration: BoxDecoration(
//                   color: (!StaticData.isDarkMode)
//                       ? Color(0xffffffff)
//                       : Colors.blueGrey[800],
//                 ),
//                 ////Chỉnh các ngày cuối tuần
//                 weekendStyle: TextStyle(
//                   fontSize: 16,
//                   // color: Colors.red,
//                   color: (!StaticData.isDarkMode) ? Colors.black : Colors.grey,
//                   // fontWeight: FontWeight.bold,
//                 ),

//                 ////Chỉnh các ngày trong tuần
//                 weekdayStyle: TextStyle(
//                   fontSize: 16,
//                   color: (!StaticData.isDarkMode) ? Colors.black : Colors.grey,
//                 )),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: <Widget>[
//               Expanded(
//                   flex: 5,
//                   child: Row(children: [
//                     SizedBox(width: 10),
//                     Text('Completion : ' + rate + ' %'),
//                   ])),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Future<int> countDone() async {
//     String key = StaticData.userID;
//     List<Map> data = await dbHelper.rawQuery(
//         '''select count(*) as SOLAN from THONGKE tk join MUCTIEU mt on tk.MAMUCTIEU=mt.MAMUCTIEU where mt.MANGUOIDUNG='$key' ''');
//     return data[0]['SOLAN'];
//   }

//   Future<int> getCurrentDoneLevel() async {
//     String userID = StaticData.userID;
//     // Xem thử đã qua cấp 3 chưa
//     String maThanhTuu = 'TT03' + StaticData.userID;
//     List<Map> data = await dbHelper.rawQuery(
//         '''select count(*) as DEM from THANHTUU tt join THANHTUUNGUOIDUNG nd on tt.MATHANHTUU=nd.MATHANHTUU where MANGUOIDUNG='$userID' and tt.MATHANHTUU='$maThanhTuu' ''');
//     if (data[0]['DEM'] > 0) {
//       return 4;
//     }
//     // Xem thử đã qua cấp 2 chưa
//     maThanhTuu = 'TT04' + StaticData.userID;
//     List<Map> data1 = await dbHelper.rawQuery(
//         '''select count(*) as DEM from THANHTUU tt join THANHTUUNGUOIDUNG nd on tt.MATHANHTUU=nd.MATHANHTUU where MANGUOIDUNG='$userID' and tt.MATHANHTUU='$maThanhTuu' ''');
//     if (data1[0]['DEM'] > 0) {
//       return 3;
//     }
//     // Xem thử qua cấp 1 hay chưa
//     maThanhTuu = 'TT01' + StaticData.userID;
//     List<Map> data2 = await dbHelper.rawQuery(
//         '''select count(*) as DEM from THANHTUU tt join THANHTUUNGUOIDUNG nd on tt.MATHANHTUU=nd.MATHANHTUU where MANGUOIDUNG='$userID' and tt.MATHANHTUU='$maThanhTuu' ''');
//     if (data2[0]['DEM'] > 0) {
//       return 2;
//     }
//     return 1;
//   }

//   Future<int> getCurrentActivityLevel() async {
//     int countDatabaseLevel = 0;
//     String key = StaticData.userID;
//     List<Map> data = await dbHelper.rawQuery(
//         '''select count(*) as SOLAN from THANHTUU t join THANHTUUNGUOIDUNG tn on t.MATHANHTUU=tn.MATHANHTUU where tn.MANGUOIDUNG='$key' and t.VANG=20  ''');
//     countDatabaseLevel = data[0]['SOLAN'];
//     return countDatabaseLevel;
//   }

//   Future<void> achiveNotification() async {
//     int level = await getCurrentDoneLevel();
//     print('currentDoneLevel $level');
//     if (level == 4) {
//       if (this.mounted)
//         setState(() {
//           gotAchive = false;
//         });
//       return;
//     }

//     int done = await countDone();
//     List<int> targetDone = [100, 500, 1500]; //[1, 3, 5]; //[100, 500, 1500];
//     if (done > targetDone[level - 1]) {
//       if (this.mounted)
//         setState(() {
//           gotAchive = true;
//         });
//       return;
//     }

//     int levelNow = (done * 1.0 / targetToReach).floor();
//     int achivedLevel = await getCurrentActivityLevel();
//     print('levelNow $levelNow');
//     if (levelNow > achivedLevel) {
//       if (this.mounted)
//         setState(() {
//           gotAchive = true;
//         });
//     } else {
//       if (this.mounted)
//         setState(() {
//           gotAchive = false;
//         });
//     }
//   }

//   Future<void> openAchivement() async {
//     await showDialog(
//       context: context,
//       builder: (_) => ListAchivement(
//         key: Key(''),
//       ),
//     );
//     achiveNotification();
//     loadGold();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Color(0xffffffff),
//       body: ListView(children: <Widget>[
//         SizedBox(
//           height: 15,
//         ),
//         InkWell(
//           onTap: openAchivement,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               CircleAvatar(
//                 backgroundColor: Colors.transparent,
//                 radius: 15,
//                 child: Image.asset('assets/gold.png', width: 25, height: 25),
//               ),
//               Text(gotAchive ? '!' : '',
//                   style: TextStyle(
//                       fontSize: 28,
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold)),
//               SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 StaticData.Vang.toString(),
//                 style: TextStyle(fontSize: 25),
//               ),
//               SizedBox(
//                 width: 30,
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         //Hiển thị calendar
//         Calendar(),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//           child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//             Image.asset(
//               'assets/dodone.png',
//               width: 40,
//               height: 40,
//             ),
//             SizedBox(width: 20),
//             Text(
//               'Todo and Done',
//               style: TextStyle(
//                   fontSize: 22,
//                   color: (!StaticData.isDarkMode)
//                       ? Colors.black54
//                       : Colors.white70),
//             ),
//           ]),
//         ),
//         Padding(
//             padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: 270,
//                       child: ToDoList(),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: 270,
//                       child: DoneTask(),
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//         Padding(
//             padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10.0), //or 15.0
//                       child: Container(
//                         height: 40.0,
//                         width: 40.0,
//                         child: Image.asset(
//                           'assets/group_activity.png',
//                           width: 30,
//                           height: 30,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       'Group Activity',
//                       style: TextStyle(
//                           fontSize: 22,
//                           color: (!StaticData.isDarkMode)
//                               ? Colors.black54
//                               : Colors.white70),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                   decoration: BoxDecoration(
//                       color: (!StaticData.isDarkMode)
//                           ? Color(0xffe0e6ee)
//                           : Colors.grey[700],
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10),
//                           bottomRight: Radius.circular(10))),
//                   child: InkWell(
//                     onTap: addNewGroup,
//                     child: Text('Add new',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: (!StaticData.isDarkMode)
//                                 ? Colors.black54
//                                 : Colors.white70)),
//                   ),
//                 )
//               ],
//             )),

//         SizedBox(
//           height: 12,
//         ),
//         GroupTable(),
//         SizedBox(
//           height: 12,
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//           child: Row(
//             children: [
//               Image.asset('assets/allactivity.png', width: 50, height: 50),
//               SizedBox(
//                 width: 20,
//               ),
//               Text(
//                 'All Activities',
//                 style: TextStyle(
//                     fontSize: 22,
//                     color: (!StaticData.isDarkMode)
//                         ? Colors.black54
//                         : Colors.white70),
//               ),
//             ],
//           ),
//         ),
//         AllActivity(),
//       ]),
//       floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             // await Navigator.push(
//             //   context,
//             //   MaterialPageRoute(builder: (context) => AddNew()),
//             // );
//             getAllActivity();
//             getToDoList();
//             getAllGroup();
//           },
//           backgroundColor:
//               (!StaticData.isDarkMode) ? Colors.blue : Colors.black,
//           child: Text(
//             "+",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 40,
//             ),
//           )),
//     );
//   }
// }
