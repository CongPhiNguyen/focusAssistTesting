// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';

// class FullPhoto extends StatelessWidget {
//   final String url;

//   FullPhoto({required Key key, required this.url}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(
//       //     'FULL PHOTO',
//       //     style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
//       //   ),
//       //   centerTitle: true,
//       // ),
//       body: FullPhotoScreen(
//         url: url,
//         key: Key(''),
//       ),
//     );
//   }
// }

// class FullPhotoScreen extends StatefulWidget {
//   final String url;

//   const FullPhotoScreen({required Key key, required this.url})
//       : super(key: key);

//   @override
//   State createState() => FullPhotoScreenState(url: url, key: Key(''));
// }

// class FullPhotoScreenState extends State<FullPhotoScreen> {
//   final String url;

//   FullPhotoScreenState({required Key key, required this.url});

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: <Widget>[
//           PhotoView(imageProvider: NetworkImage(url)),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
//             child: Container(
//               child: TextButton.icon(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                   size: 20,
//                 ),
//                 label: Text(
//                   'Chat',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
