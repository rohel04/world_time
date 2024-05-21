import 'package:world_time/service/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void getWorldTime() async{
    WorldTime obj=WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London');
    await obj.getData();
    navigateToHome(obj);
  }

  void navigateToHome(WorldTime obj){
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':obj.location,
      'flag':obj.flag,
      'time':obj.time,
      'isDay':obj.isDay
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
      child: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
      ),
    );
  }
}
