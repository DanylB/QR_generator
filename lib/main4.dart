import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   ScreenshotController screenshotController = ScreenshotController();
//   var _imageFile;

//   //Create an instance of ScreenshotController

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Screenshot(
//             controller: screenshotController,
//             child: Container(
//               width: 100,
//               height: 100,
//               color: Colors.red,
//             ),
//           ),
//           FloatingActionButton(onPressed: () async {
//             final image = await screenshotController.capture();

//           })
//         ],
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var image;
  GlobalKey previewContainer = GlobalKey();
  int originalSize = 1920;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(
            key: previewContainer,
            child: Material(
              child: QrImage(
                size: 200,
                data: "PENIS",
              ),
            ),
          ),
          FloatingActionButton(onPressed: () {
            ShareFilesAndScreenshotWidgets().shareScreenshot(
              previewContainer,
              originalSize,
              "Title",
              "Name.png",
              "image/png",
              text: "This is the caption!",
            );
          })
        ],
      ),
    );
  }
}
