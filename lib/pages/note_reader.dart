import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/shared/app_style.dart';

class NoteReaderPage extends StatefulWidget {
  NoteReaderPage(this.doc, {super.key});
  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderPage> createState() => _NoteReaderPageState();
}

class _NoteReaderPageState extends State<NoteReaderPage> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];

    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        title: Text(widget.doc['note_title']),
        titleTextStyle: AppStyle.mainTitle,
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: IconButton(
              onPressed: () {
                final docRef =
                    FirebaseFirestore.instance.collection("Notes").doc();
                docRef.get().then((DocumentSnapshot documentSnapshot) {
                  print(DocumentSnapshot);
                  final data = documentSnapshot.id;
                  FirebaseFirestore.instance.collection("Notes").doc().delete();
                });

                Navigator.pop(context);
              },
              icon: Icon(Icons.delete),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc['creation_date'],
              style: AppStyle.dateTitle,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 32),
            Text(
              widget.doc['note_content'],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
