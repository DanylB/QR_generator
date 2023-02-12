import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF1E80F0),
            child: _buildAppBar(),
          ),
          Positioned(
            top: sizeH * 0.15,
            child: const HomePageBody(),
          ),
        ],
      ),
    );
  }

  TextButton _buildShareButton(BuildContext context) {
    return TextButton(
      // onPressed: () => shareQR(),
      onPressed: () {},
      style: TextButton.styleFrom(
          // backgroundColor: Colors.blue.shade100.withOpacity(0.2),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.share,
            size: 28,
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Share',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Align _buildAppBar() {
    return Align(
      alignment: const FractionalOffset(0.0, 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/QRgnerator_logo2.png',
            scale: 10,
          ),
          const SizedBox(width: 15),
          const Text(
            "Generator",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});
  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  TextEditingController controllerTextInput = TextEditingController();
  var image;
  GlobalKey previewContainer = GlobalKey();
  int originalSize = 1920;

  String inputTextField = 'QR';

  sendDataToQRGenerator() {
    setState(() => inputTextField = controllerTextInput.text);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  clearTextField() {
    setState(() => controllerTextInput.clear());
  }

  shareQR() {
    ShareFilesAndScreenshotWidgets().shareScreenshot(
      previewContainer,
      originalSize,
      "Title",
      "Name.png",
      "image/png",
      // text: "This is the caption!",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 50, 20, 40),
              child: buildTextField(context),
            ),
            RepaintBoundary(
              key: previewContainer,
              child: Material(
                color: Colors.white,
                child: Column(
                  children: [
                    QrImage(
                      size: 200,
                      data: inputTextField,
                    ),
                    _buildQRSubtext(context),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 40),
            Spacer(flex: 1),
            _buildShareButton(context),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  TextButton _buildShareButton(BuildContext context) {
    return TextButton(
      onPressed: () => shareQR(),
      // onPressed: () {},
      style: TextButton.styleFrom(
          // backgroundColor: Colors.blue.shade100.withOpacity(0.2),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.share,
            size: 28,
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Share',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildQRSubtext(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .8),
          child: Text(
            textAlign: TextAlign.center,
            inputTextField,
            style: Theme.of(context).textTheme.headline5,
          )),
    );
  }

  SizedBox buildTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: TextField(
        maxLength: 100,
        textInputAction: TextInputAction.done,
        onSubmitted: (val) => sendDataToQRGenerator(),
        autofocus: true,
        controller: controllerTextInput,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Enter Text",
            labelStyle: const TextStyle(fontSize: 20),
            suffixIcon: IconButton(
              onPressed: () => sendDataToQRGenerator(),
              icon: const Icon(Icons.send_rounded),
            ),
            prefixIcon: IconButton(
              onPressed: () => clearTextField(),
              icon: const Icon(
                Icons.clear,
              ),
            )),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
