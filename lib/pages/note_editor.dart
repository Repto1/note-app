// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_field, prefer_final_fields

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/shared/app_style.dart';

class NoteEditorPage extends StatefulWidget {
  const NoteEditorPage({super.key});

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.mainColor,
        title: Text('Add a new note'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Note Name'),
              style: AppStyle.mainTitle,
            ),
            SizedBox(height: 8),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            SizedBox(height: 32),
            TextField(
              controller: mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Write your note'),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection('Notes').add({
            "note_title": titleController.text,
            "creation_date": date,
            "note_content": mainController.text,
            "color_id": color_id,
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print('Failed to add new Note due to $error'));
        },
        backgroundColor: AppStyle.mainColor,
        child: Icon(Icons.note_add),
      ),
    );
  }
}
