
import 'package:flutter/material.dart';
import 'package:flutter_calendrier/view/calendrier_evenements.dart';

class MyContainer extends StatelessWidget
{
  final Future<MaterialColor> colorFuture;
  final MyListTile child;

  const MyContainer({
    Key? key,
    required this.colorFuture, required this.child,
  }) : super(key: key);

  void initState()
  {
    debugPrint("Mycontaineur"+colorFuture.toString()+"/"+colorFuture.runtimeType.toString());
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MaterialColor>(
      future: colorFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          debugPrint(snapshot.data.toString());
          debugPrint(snapshot.toString());
          return Container(
            color: snapshot.data!,
            child: child
          );
        } else if (snapshot.hasError) {
          debugPrint(snapshot.toString());
          return Text("Error loading color");
        } else {
          return Container(
            color: Colors.amber,
            child:child
          );
        }
      },
    );
  }

}