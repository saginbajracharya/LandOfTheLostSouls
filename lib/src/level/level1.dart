import 'package:flutter/material.dart';
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
      body: DragSelectGridView(
        gridController: controller,
        padding: const EdgeInsets.all(8),
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
    );
  }

  void scheduleRebuild() => setState(() {});
}
