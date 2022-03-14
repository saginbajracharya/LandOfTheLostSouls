import 'package:flutter/material.dart';
import 'level/sample_item.dart';

/// Displays a list of SampleItems.
class LevelSelect extends StatelessWidget {
  const LevelSelect({
    Key? key,
    this.items = const [
      SampleItem(1), 
      SampleItem(2), 
      SampleItem(3),
      SampleItem(4), 
      SampleItem(5), 
      SampleItem(6),
      SampleItem(7), 
      SampleItem(8), 
      SampleItem(9),
      SampleItem(10), 
      SampleItem(11), 
      SampleItem(12),
      SampleItem(13), 
      SampleItem(14), 
      SampleItem(15),
      SampleItem(16), 
      SampleItem(17), 
      SampleItem(18),
      SampleItem(19), 
      SampleItem(20), 
      SampleItem(21),
      SampleItem(22), 
      SampleItem(23), 
      SampleItem(24),
      SampleItem(25), 
      SampleItem(26), 
      SampleItem(27),
      SampleItem(28), 
      SampleItem(29), 
      SampleItem(30)
    ],
  }) : super(key: key);

  static const routeName = '/levelSelect';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(''),
      ),
      body: ListView.builder(
        restorationId: 'levelSelect',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(left:80.0,right:80.0),
            child: Align(
              alignment: index.isEven?Alignment.centerLeft:Alignment.centerRight,
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.lightBlue,
                  child: Text(
                    '${item.id}',
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/level1');
                }
              ),
            ),
          );
        },
      ),
    );
  }
}
