import 'package:flutter/material.dart';

class QuickNote extends StatefulWidget {
  const QuickNote({super.key});

  @override
  State<QuickNote> createState() => _QuickNoteState();
}

class _QuickNoteState extends State<QuickNote> {
  TextEditingController textEditingController = TextEditingController();
  bool isSubmit = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.25,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/eclips.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: TextField(
                  controller: textEditingController,
                  onChanged: (value) => {
                    setState(
                      () {},
                    )
                  },
                  maxLines: 4,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Masukan Judul"),
                                content: SizedBox(
                                  height: size.height * 0.15,
                                  child: Column(
                                    children: [
                                      const TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: size.width,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(content: Text("Berhasil Ditambahkan")),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          )),
                                          child: const Text("Simpan Notes"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.send),
                      ),
                      hintText: "Quick Note",
                      fillColor: Colors.white,
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${textEditingController.text.length}/ 255",
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
