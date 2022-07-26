import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:land_of_the_lost_souls/src/controller/level_controller.dart';
import 'package:land_of_the_lost_souls/src/level/selectable_item.dart';
import 'package:land_of_the_lost_souls/src/level/selection_app_bar.dart';
import 'package:land_of_the_lost_souls/src/styles.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart'; 

class Level1 extends StatefulWidget {
  const Level1({ Key? key }) : super(key: key);

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  final LevelController levelCon = Get.put(LevelController());
  final controller = DragSelectGridViewController();
  List items = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(scheduleRebuild);
    setState(() {
      levelCon.selectedwords=[];
    });
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  @override                                                                                  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      extendBodyBehindAppBar: false,
      appBar: SelectionAppBar(
        selection: controller.value, 
      ),
      body: Column(
        children: [
          Expanded(
            child: DragSelectGridView(
              gridController: controller,
              padding: const EdgeInsets.all(8),
              triggerSelectionOnTap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index, selected) {
                return SelectableItem(
                  index: index,
                  color: Colors.blue,
                  selected: selected, 
                  word: items[index],
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
            ),
          ),
          GetBuilder(
            init: LevelController(),
            builder: (context) {
              return Container(
                height: 80,
                color: Colors.black,
                alignment: Alignment.bottomCenter,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: levelCon.selectedwords.length,
                  itemBuilder: (context, index) {
                    // if(levelCon.selectedwords.length==5){
                    //   setState(() {
                    //     levelCon.selectedwords.clear();
                    //   });
                    // }
                    return Text(levelCon.selectedwords[index],
                      style:const TextStyle(
                        color:Colors.red
                      ),
                    );
                  }
                ),
              );
            }
          ), 
        ],
      ),
    );
  }

  void scheduleRebuild() => setState(() {});
}
