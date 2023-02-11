import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nectar/dummy.dart';

class GridViewScreen extends StatefulWidget {
   GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  var items = <String>[];

  @override
  void initState() {
    super.initState();
    DummyData dummy = DummyData();
    int l = dummy.items.length;
    for(int i=0; i<l; i++){
      items.add('assets/images/${dummy.items[i]}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              buildGridScreenAppBar(),
              const SizedBox(height: 15,),
              buildGridView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridScreenAppBar() => Column(
    children: [
      const Text(
        'Find Products',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),),
      const SizedBox(height: 20,),
      TextFormField(
        decoration:  InputDecoration(
            label: const Text('Search Store'),
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: const Color(0xfff3f3f3),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            )
        ),
      ),
    ],
  );

  Widget buildGridView()=>Expanded(
    child: GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index){
        Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
        return  buildGridItem(color: color,index: index)  ;
      },
    ),
  );

  Widget buildGridItem({required Color color,required int index}) => Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: color,
        )
    ),
    child: Center(
      child: Image.asset(items[index],
        width: 120,
        height: 120,),
    ),
  );

}
