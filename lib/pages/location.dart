import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations=[
    WorldTime(location: 'Kathmandu', flag: 'usa.png', url: 'Asia/Kathmandu'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Athens', flag: 'greece.png', url: 'Europe/London'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),


  ];

  void updateTime(index) async
  {
    WorldTime obj=locations[index];
    await obj.getData();
    navigateBack(obj);
  }

  void navigateBack(WorldTime obj){
    Navigator.pop(context,{
      'location':obj.location,
      'flag':obj.flag,
      'time':obj.time,
      'isDay':obj.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location',style: TextStyle(color: Colors.white,),),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon( Icons.arrow_back,color: Colors.white,),
        ),
      ),
      body:ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          })

    ) ;
  }
}
