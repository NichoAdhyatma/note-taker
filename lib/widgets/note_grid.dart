// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:note_taker/constants/theme.dart';
import 'package:note_taker/providers/note_provider.dart';
import 'package:note_taker/screens/edit_note_screen.dart';
import 'package:provider/provider.dart';

class NoteGrid extends StatelessWidget {
  const NoteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final noteProvider = Provider.of<NoteProvider>(context);
    return noteProvider.noteList.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Belum ada notes yang kamu buat",
                    style: labelTextStyle.copyWith(color: primaryColor),
                  ),
                  const Text(
                    "🗿🗿",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 6,
            ),
            itemCount: noteProvider.noteList.length,
            itemBuilder: (context, index) {
              var note = noteProvider.noteList[index];
              return InkWell(
                onTap: () async {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  var result = await Navigator.pushNamed(
                          context, EditNoteScreen.routeName, arguments: index)
                      as bool;
                  if (result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: secondayColor,
                        behavior: SnackBarBehavior.fixed,
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/app-logo.png',
                              height: 20,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text("Note diubah"),
                          ],
                        ),
                      ),
                    );
                  }
                },
                child: Dismissible(
                  key: UniqueKey(),
                  direction: index % 2 == 0
                      ? DismissDirection.endToStart
                      : DismissDirection.startToEnd,
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Do you want to delete this item?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              noteProvider.deleteNote(index);
                              Navigator.pop(context, true);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: secondayColor,
                                  behavior: SnackBarBehavior.fixed,
                                  elevation: 5,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/app-logo.png',
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Text("Note dihapus"),
                                    ],
                                  ),
                                ),
                              ); // showDialog() returns true
                            },
                          ),
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.pop(context, false);
                              // showDialog() returns false
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: size.height * 0.25,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 2,
                        color: primaryColor,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 0,
                          child: Container(
                          ),
                        ),
                        Expanded(
                          flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                    padding: EdgeInsets.only(top: 16, right: 16,left: 16),
                                    child: Text(
                                      note.title,
                                      style: titleTextStyle,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                      child: Text(
                                        note.body,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    )
                                ]),
                                Container(
                                      // margin: EdgeInsets.only(top: 30, right: 200, left: 0),
                                      alignment: Alignment.bottomLeft,
                                        child:IconButton(
                                              onPressed: (){
                                                noteProvider.deleteNote(index);
                                              },
                                              icon: const Icon(
                                                  Icons.delete_outline,
                                                  color: Colors.red,
                                              )
                                          ),
                                      ),
                                ],

                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
