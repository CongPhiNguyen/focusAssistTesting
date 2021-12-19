// import 'package:flutter/material.dart';
// import 'package:focus_assist/classes/DbProvider.dart';
// import 'dart:math';
// import 'package:focus_assist/classes/Data.dart';

// class EditGroup extends StatefulWidget {
//   final String groupKey, groupName;

//   EditGroup({required Key key, required this.groupKey, required this.groupName})
//       : super(key: key);
//   @override
//   _EditGroupState createState() => _EditGroupState();
// }

// class _EditGroupState extends State<EditGroup> {
//   late TextEditingController getGroupName;
//   String error = "Group name can't be blank";
//   String error2 = "Group already exists";
//   final dbHelper = DbProvider.instance;
//   late bool isOK, isUnique;

//   @override
//   void initState() {
//     super.initState();
//     getGroupName = TextEditingController(text: widget.groupName);
//     isOK = true;
//     isUnique = true;
//   }

//   String getRandomString(int len) {
//     var r = Random();
//     return String.fromCharCodes(
//         List.generate(len, (index) => r.nextInt(33) + 89));
//   }

//   // ignore: non_constant_identifier_names
//   void AddNewGroup() async {
//     Map<String, dynamic> row = {
//       'MANHOM': getRandomString(5),
//       'TENNHOM': getGroupName.text,
//       'MANGUOIDUNG': StaticData.userID,
//     };
//     final id = await dbHelper.insert('NHOMMUCTIEU', row);
//   }

//   void editGroup() async {
//     String newName = getGroupName.text;
//     String key = widget.groupKey;
//     await dbHelper.rawQuery(
//         '''update NHOMMUCTIEU set TENNHOM='$newName' where MANHOM='$key'  ''');
//   }

//   Future<bool> checkUniqueName(String name) async {
//     String userID = StaticData.userID;
//     List<Map> database = await dbHelper
//         .rawQuery('''select * from NHOMMUCTIEU where MANGUOIDUNG='$userID' ''');
//     for (int i = 0; i < database.length; i++) {
//       if (database[i]['TENNHOM'] == name) {
//         return false;
//       }
//     }
//     return true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     OutlineInputBorder k = OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(4)),
//       borderSide: BorderSide(
//           width: 1,
//           color: (!StaticData.isDarkMode) ? Colors.black : Colors.grey),
//     );
//     return Dialog(
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//         child: Container(
//             child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 15),
//             Text(
//               'Edit group',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 2),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
//               child: TextField(
//                 controller: getGroupName,
//                 decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding: EdgeInsets.all(18),
//                     focusedBorder: k,
//                     disabledBorder: k,
//                     enabledBorder: k,
//                     errorBorder: k,
//                     focusedErrorBorder: k,
//                     border: OutlineInputBorder(),
//                     labelText: 'Group Name',
//                     labelStyle: TextStyle(
//                         fontSize: 20,
//                         color: (!StaticData.isDarkMode)
//                             ? Colors.black
//                             : Colors.grey[400])),
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             (isOK)
//                 ? ((isUnique)
//                     ? SizedBox()
//                     : Center(
//                         child: Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
//                         child: Text(
//                           error2,
//                           style: TextStyle(color: Colors.red, fontSize: 20),
//                         ),
//                       )))
//                 : Center(
//                     child: Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
//                     child: Text(
//                       error,
//                       style: TextStyle(color: Colors.red, fontSize: 20),
//                     ),
//                   )),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               width: 100,
//               padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
//               decoration: BoxDecoration(
//                   // color: Color(0xffe0e6ee),
//                   color: (!StaticData.isDarkMode)
//                       ? Colors.grey[200]
//                       : Colors.grey[700],
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                       bottomRight: Radius.circular(10))),
//               child: InkWell(
//                 onTap: () async {
//                   if (getGroupName.text == null ||
//                       getGroupName.text.length < 1) {
//                     if (this.mounted) {
//                       setState(() {
//                         isOK = false;
//                       });
//                     }
//                     return;
//                   }
//                   bool k = await checkUniqueName(getGroupName.text);
//                   setState(() {
//                     isUnique = k;
//                   });
//                   if (k) {
//                     editGroup();
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Center(
//                   child: Text('Finish',
//                       style: TextStyle(
//                         fontSize: 20,
//                       )),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             )
//           ],
//         )));
//   }
// }
