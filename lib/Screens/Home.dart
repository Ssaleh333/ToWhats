import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
var phone='';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/p1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mobile Number',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19
                    ),
              ),
             SizedBox(
               height: 30,
             ),
             Container(
               height: 55,
               padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(5),
               ),
               child: IntlPhoneField(
                 decoration: InputDecoration(
               //    enabledBorder: InputBorder.none,
                border: InputBorder.none,
                //   border: UnderlineInputBorder,
                   hintText: 'Phone Number',
                   hintStyle: TextStyle(
                  fontWeight: FontWeight.w500
                   ),
                contentPadding: EdgeInsets.symmetric(horizontal: 0)
                 ),
                 initialCountryCode: 'EG',
                 onChanged: (value){
                 var num=value.completeNumber;
                 phone=num;
                 print(phone);
                 },
               ),
               ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green
                ),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: (){
                    openWhatsApp();
                    print(phone);
                  },
                  child: Text(
                    'Send Message',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),);
  }
  void openWhatsApp() async {
    var whatsappUrl = "whatsapp://send?phone=$phone";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

}
