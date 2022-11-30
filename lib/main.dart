import 'package:color_picker/utils/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<IconData> allIcons = [
    Icons.directions_run,
    Icons.face_outlined,
    Icons.umbrella_sharp,
    Icons.favorite,
    Icons.headphones,
    Icons.home,
    Icons.car_repair,
    Icons.settings,
    Icons.flight,
    Icons.ac_unit,
    Icons.run_circle,
    Icons.book,
    Icons.sports_rugby_rounded,
    Icons.alarm,
    Icons.call,
    Icons.snowing,
    Icons.hearing,
    Icons.music_note,
    Icons.note,
    Icons.edit,
    Icons.sunny,
    Icons.radar,

    // add more icons here if you want
  ];

  int _selectedIcon=0;

  final List<Color> color = <Color>[AppColors.guidePrimary,
    AppColors.guidePrimaryVariant,
    AppColors.guideSecondary,
    AppColors.guideSecondaryVariant,
    AppColors.guideError, AppColors.guideErrorDark,
    AppColors.yellowClr,

  ];

  int _selectedColor=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color and Icon Picker"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Icon", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(

                        title: const Text('Select An Icon'),
                        content: Container(
                          width: 320,
                          height: 400,
                          alignment: Alignment.center,
                          // This grid view displays all selectable icons
                          child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 60,
                                  childAspectRatio: 1 / 1,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                              itemCount: allIcons.length,
                              itemBuilder: (_, index) => Container(
                                key: ValueKey(allIcons[index].codePoint),
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: IconButton(
                                    // give the selected icon a different color
                                    color: color[_selectedColor] == allIcons[index]
                                        ? Colors.blue
                                        : Colors.green,
                                    iconSize: 30,
                                    icon: Icon(
                                      allIcons[index],
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _selectedIcon = index;
                                      });

                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                    child: Icon(allIcons[_selectedIcon], color: color[_selectedColor], size: 25,)
                )
              ],
            ),
          ),
          SizedBox(height: 8,),
          SizedBox(height: 8,),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Color", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

                Wrap(
                    direction: Axis.horizontal,
                    children: List<Widget>.generate(
                        7,
                            (int index){
                          return GestureDetector(
                            onTap: (){
                              setState((){
                                _selectedColor=index;
                              });

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: color[index],
                                child: _selectedColor==index?Icon(Icons.done, size: 16,):Container(),
                              ),
                            ),
                          );
                        }
                    )
                ),

              ],
            ),
          ),
          SizedBox(height: 8.0,),
        ],
      ),
    );
  }
}

