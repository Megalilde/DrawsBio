import 'package:flutter/cupertino.dart';

import '../screens/drawingScreen.dart';

class NotesModel {
  List<Widget> myNotesList = [];
  List<DrawingScreen> myDrawingListPages = []; //non potra essere generalizzata.
  List<Widget> mySharedNotesList = [];
  List<Widget> myDeletedNotesList = [];

  NotesModel({
    List<Widget>? myNotesList,
    List<DrawingScreen>? myDrawingListPages,
    List<Widget>? mySharedNotesList,
    List<Widget>? myDeletedNotesList,
  }) {
    if (myNotesList != null) {
      this.myNotesList = myNotesList;
    }
    if (myDrawingListPages != null) {
      this.myDrawingListPages = myDrawingListPages;
    }
    if (mySharedNotesList != null) {
      this.mySharedNotesList = mySharedNotesList;
    }
    if (myDeletedNotesList != null) {
      this.myDeletedNotesList = myDeletedNotesList;
    }
  }
}