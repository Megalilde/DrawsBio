import 'package:drawsbio/screens/drawingScreen.dart';
import 'package:flutter/material.dart';


class MainPageLogic{



  void createNewNotes(List<Widget> myList, BuildContext context, List<DrawingScreen> myListScreen) {
      createSpace(myList);
      createContainer(myList,context,myListScreen);
  }

  void createContainer(List<Widget> myList ,BuildContext context,List<DrawingScreen> myListScreen){
    DrawingScreen tempScreen = createMyScreen(myListScreen);
      myList.add(
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => tempScreen,
              ),
            );
          },
          child: Container(
            color: Colors.amber,
            width: 100,
            height: 120,
            child: Center(
              child: Icon(
                Icons.access_alarm,
                color: Colors.grey[700],
              ),
            ),
          ),
        ),
      );
  }

  DrawingScreen createMyScreen(List<DrawingScreen> myListScreen){
    DrawingScreen temp = DrawingScreen();
    myListScreen.add(
      temp,
    );
    return temp;
  }

  void createSpace(List<Widget> myList) {
      myList.add(const SizedBox(width: 20));
  }

}