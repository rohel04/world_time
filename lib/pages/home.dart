import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data:ModalRoute.of(context)!.settings.arguments as Map;

    String back_img=data['isDay'] ? 'day.jpg' : 'night.jpg';
    return Scaffold(

      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$back_img'),
                  fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(

              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result=await Navigator.pushNamed(context, '/location');
                    setState((){
                    data={
                      'location':result['location'],
                      'flag':result['flag'],
                      'time':result['time'],
                      'isDay':result['isDay']
                    };
                    });
                  },
                  label: Text('Edit Location',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0)),
                  icon: Icon(Icons.edit_location,color: Colors.white,),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Image.asset('assets/${data['flag']}',width: 30,height: 50),
                    SizedBox(width: 10,),
                    Text("${data['location']}",style: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 20.0),
                Text('${data['time']}',style: TextStyle(fontSize: 50.0,color: Colors.white,fontWeight: FontWeight.bold)),

              ],
            ),
          ),
        )

      ),
    );
  }
}

