//add unfocus textfield
//add autofocus textfield. (start app)
//center title
// rounded appbar
//add icon app
//color send button = blue
//send on keyboard button
// шоб клавиатура зсовувала контент

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("QR Generator"),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  String inputTextField = 'QR';
  sendDataToQRGenerator() {
    setState(() => inputTextField = controller.text);
  }

  clearTextField() {
    setState(() => controller.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 50, 20, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextField(context),
              ],
            ),
          ),
          QrImage(
            size: 200,
            data: inputTextField,
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Center(
                    child: Text(
                  inputTextField,
                  style: Theme.of(context).textTheme.headline5,
                ))),
          ),
          // Button for save QR
        ],
      ),
    );
  }

  SizedBox buildTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Enter Text",
            suffixIcon: IconButton(
              onPressed: () => sendDataToQRGenerator(),
              icon: const Icon(Icons.send_rounded),
            ),
            prefixIcon: IconButton(
              onPressed: () => clearTextField(),
              icon: const Icon(
                Icons.cancel_rounded,
                color: Color.fromARGB(255, 247, 113, 113),
              ),
            )),
      ),
    );
  }
}



//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////


// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         // appBar: AppBar(
//         //   title: const Text("QR Generator"),
//         // ),
//         body: const HomePage(),
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController controller = TextEditingController();
//   String inputTextField = 'QR';
//   sendDataToQRGenerator() {
//     setState(() => inputTextField = controller.text);
//   }

//   clearTextField() {
//     setState(() => controller.clear());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//             top: 0,
//             child: Container(
//               width: 500,
//               height: 100,
//               color: Colors.blue,
//               child: Text(
//                 "QR Generator",
//                 style: Theme.of(context).textTheme.headline5,
//               ),
//             )),
//         Positioned(
//             top: 50,
//             child: Container(
//               width: 500,
//               height: 75,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.grey[50],
//               ),
//             )),
//         Positioned(
//             child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.fromLTRB(20, 50, 20, 40),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     buildTextField(context),
//                   ],
//                 ),
//               ),
//               QrImage(
//                 size: 200,
//                 data: inputTextField,
//               ),

//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: SizedBox(
//                     width: MediaQuery.of(context).size.width * .8,
//                     child: Center(
//                         child: Text(
//                       inputTextField,
//                       style: Theme.of(context).textTheme.headline5,
//                     ))),
//               ),
//               // TextButton(onPressed: () {}, child: Text("Push")),
//             ],
//           ),
//         ))
//       ],
//     );
//   }

//   SizedBox buildTextField(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * .8,
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//             border: const OutlineInputBorder(),
//             labelText: "Enter Text",
//             suffixIcon: IconButton(
//               onPressed: () => sendDataToQRGenerator(),
//               icon: const Icon(Icons.send_rounded),
//             ),
//             prefixIcon: IconButton(
//               onPressed: () => clearTextField(),
//               icon: const Icon(
//                 Icons.cancel_rounded,
//                 color: Color.fromARGB(255, 247, 113, 113),
//               ),
//             )),
//       ),
//     );
//   }
// }
