import 'package:flutter/material.dart';

class InputListData extends StatefulWidget {
  const InputListData({super.key});

  @override
  State<InputListData> createState() => _InputListDataState();
}

class _InputListDataState extends State<InputListData> {
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('input users show in list'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Form(
                key: _keyForm,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: 'Enter Title Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide())),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Give Title Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          hintText: 'Enter some text',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_keyForm.currentState!.validate()) {
                            items.add({
                              'title': titleController.text,
                              'fullDescription': descriptionController.text,
                            });
                            setState(() {
                              titleController.clear();
                              descriptionController.clear();
                            });
                          }
                        },
                        child: Text('Submit'))
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 400,
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(items[index]['title']),
                        subtitle: Text(items[index]['fullDescription']),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
