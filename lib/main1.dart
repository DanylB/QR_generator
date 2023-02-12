//center title
// rounded appbar
// Button for save QR

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: _buildAppBar(),
          body: const HomePage(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            'assets/QRgnerator_logo2.png',
            scale: 10,
          ),
          const SizedBox(width: 10),
          const Text(" Generator"),
        ],
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
    FocusManager.instance.primaryFocus?.unfocus();
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
            child: buildTextField(context),
          ),
          QrImage(
            size: 200,
            data: inputTextField,
          ),
          _buildQRSubtext(context),
          // Button for save QR
        ],
      ),
    );
  }

  Padding _buildQRSubtext(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Center(
              child: Text(
            inputTextField,
            style: Theme.of(context).textTheme.headline5,
          ))),
    );
  }

  SizedBox buildTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: TextField(
        textInputAction: TextInputAction.done,
        onSubmitted: (val) => sendDataToQRGenerator(),
        autofocus: true,
        controller: controller,
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
