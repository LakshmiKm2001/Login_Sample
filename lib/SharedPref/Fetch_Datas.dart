import 'package:shared_preferences/shared_preferences.dart';

class StoreData {
 late SharedPreferences preferences;
Future<void> initialisePreference() async {
   preferences = await SharedPreferences.getInstance();
   }
    
   Future<void> storeToken(String token) async {
   await initialisePreference();  //initialising shared pref
   await preferences.setString('token', token);
   }

void getData(){

 Future getToken() async {
    initialisePreference();
        var token = (preferences.getString('token')??'');
        return token;
   }
}
}









