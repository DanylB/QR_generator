import 'package:flutter/material.dart';
import 'package:qr_generator/main1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFF1E80F0),
          body: _buildAppBar(),
        ),
        Positioned(
            top: sizeH * 0.15, child: HomePageBody(sizeW: sizeW, sizeH: sizeH)),
      ],
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
  var sizeW;
  var sizeH;
  HomePageBody({super.key, this.sizeW, this.sizeH});
  @override
  State<HomePageBody> createState() =>
      _HomePageBodyState(this.sizeW, this.sizeH);
}

class _HomePageBodyState extends State<HomePageBody> {
  var sizeW;
  var sizeH;

  _HomePageBodyState(
    this.sizeW,
    this.sizeH,
  );
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
    return Container(
      width: sizeW,
      height: sizeH,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 40),
                child: buildTextField(context),
              ),
            ],
          ),
        ),
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
