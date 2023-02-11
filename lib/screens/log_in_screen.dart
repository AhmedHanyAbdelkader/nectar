import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nectar/dummy.dart';
import 'package:nectar/models/country.dart';
import 'package:nectar/screens/components/rounded_button_component.dart';
import 'package:nectar/screens/grid_view_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  List<Country> countries = [];
  String dropDownValue = "EG";
  TextEditingController _phoneNumberController =
   TextEditingController(text: '+20');

  @override
  void initState() {
    super.initState();
    DummyData dummy = DummyData();
    int l = dummy.countries.length;
    countries = [];
    for(int i=0; i<l; i++){
      Country country = Country.fromJson(dummy.countries[i]);
      countries.add(country);
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildLoginScreenHeaderImage(w,h),
            buildLpginScreenTitle(w),
            buildLoginScreenCountiesField(),
            const SizedBox(height: 30,),
            const Text('Or connect with social media',
            style: TextStyle(
              color: Colors.grey,
                fontSize: 14
            ),
            ),
            const SizedBox(height: 30,),
            RoundeButtonComponent(
              label: 'Continue with Google',
              color: const Color(0xff5384ed),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> GridViewScreen()));
              },
              imgPath: 'assets/images/google.png',
            ),
            RoundeButtonComponent(
              label: 'Continue with Facebook',
              color: const Color(0xff4a67ad),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> GridViewScreen()));
              },
              imgPath: 'assets/images/facebook.png',
            ),
          ],
        ),
      ),
    );
  }


  Widget buildLoginScreenHeaderImage(double w, double h)=> Transform(
    transform: Matrix4.identity()..scale(1,-1,1),
    alignment: Alignment.center,
    child: Image.asset(
      'assets/images/login.jpg',
      width: w,
      height: h * 0.4,
      fit: BoxFit.cover,
    ),
  );

  Widget buildLpginScreenTitle(double w) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Get your groceries',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          Text('with nectar',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );

  Widget buildLoginScreenCountiesField() =>Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: _phoneNumberController,
      decoration: InputDecoration(
        prefix:  DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            elevation: 0,
            value: dropDownValue,
            items: countries.map<DropdownMenuItem<String>>((e){
              return DropdownMenuItem<String>(
                  value: e.appreviation,
                  child: Text(buildEmojiString(e.appreviation))
              );
            }).toList(),
            onChanged: (value){
              print(value);
              var c = countries.firstWhere((element) => element.appreviation == value);
              print(c.code);
              print(c.countryName);
              setState(() {
                dropDownValue = value!;
                _phoneNumberController.text = '+${c.code}';
              });
            },
          ),
        ),
      ),
    ),
  );

  String buildEmojiString(String country) {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;


    int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
    int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

    String emoji = String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
    return emoji;
  }

}



