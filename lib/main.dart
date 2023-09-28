import 'package:dotted_border/dotted_border.dart';
import 'package:drawsbio/business/mainLogicWidget.dart';
import 'package:drawsbio/models/notesModel.dart';
import 'package:drawsbio/utils/myTextStyle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MainPageLogic controller = MainPageLogic();
  NotesModel model = NotesModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 108, 245, 120),
        title: const Text("Documenti", style: MyTextStyle.titleText),
        centerTitle: true,
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () async {
              setState(() {

              });
            },
            child: const Text(
              "Save",
              style: MyTextStyle.defaultText,
            ),
          ),
          SizedBox(
            width: 56,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 108, 245, 120),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0),
                ),
              ),
              child: Container(
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Condividi", style: MyTextStyle.defaultText),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Container(child: const Text("I Tuoi Documenti")),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      DottedBorder(
                        borderType: BorderType.Rect,
                        child: SizedBox(
                          width: 100,
                          height: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                controller.createNewNotes(model.myNotesList, context, model.myDrawingListPages);
                              });
                            },
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: model.myNotesList.length,
                          itemBuilder: (context, index) {
                            return model.myNotesList[index];
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(child: const Text("Documenti Condivisi")),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DottedBorder(
                        borderType: BorderType.Rect,
                        child: SizedBox(
                          width: 100,
                          height: 120,
                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                controller.createNewNotes(model.mySharedNotesList, context, model.myDrawingListPages);
                              });
                            },
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: model.mySharedNotesList.length,
                          itemBuilder: (context, index) {
                            return model.mySharedNotesList[index];
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(child: const Text("Documenti Cancellati")),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DottedBorder(
                        borderType: BorderType.Rect,
                        child: SizedBox(
                          width: 100,
                          height: 120,
                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                controller.createNewNotes(model.myDeletedNotesList, context, model.myDrawingListPages);
                              });
                            },
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: model.myDeletedNotesList.length,
                          itemBuilder: (context, index) {
                            return model.myDeletedNotesList[index];
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}