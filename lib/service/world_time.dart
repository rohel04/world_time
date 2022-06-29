import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location='';
  String flag='';
  String time='';
  String url='';
  bool isDay=true;
  WorldTime({required this.location,required this.flag,required this.url});


  Future<void> getData() async{
    try{
      Uri uri=Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response=await get(uri);
      Map data=jsonDecode(response.body);
      String datetime=data['utc_datetime'];
      String offset=data['utc_offset'].substring(0,3);
      DateTime dt=DateTime.parse(datetime);
      dt=dt.add(Duration(hours: int.parse(offset)));
      isDay=dt.hour> 6 && dt.hour<19 ? true:false;
      time=DateFormat.jm().format(dt);


    }
    catch (e)
    {
      time='Fetch error';
    }

  }
}
