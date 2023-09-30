import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../data/api_controller/asign_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _HomeScreenState extends State<HomeScreen> {
  final AssignTaskController assignTaskController = Get.put(AssignTaskController());
 TextEditingController nameConroller= TextEditingController();
 TextEditingController phoneConroller= TextEditingController();
 TextEditingController titleConroller= TextEditingController();
 TextEditingController detailsConroller= TextEditingController();
 TextEditingController dateConroller= TextEditingController();
 TextEditingController idConroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('User Details'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: nameConroller,
                  decoration: const InputDecoration(
                      hintText: 'Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: phoneConroller,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: titleConroller,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: detailsConroller,
                  decoration: const InputDecoration(
                    hintText: 'Details',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter details';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: dateConroller,
                  decoration: const InputDecoration(
                    hintText: 'Date',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a date';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(

                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Assign',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a Assign';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: idConroller,
                        decoration: const InputDecoration(
                          hintText: 'id',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a id';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(onPressed: () {
                if(_formKey.currentState!.validate()){
                  assignTaskController.postAssignTaskDetails(nameConroller.text.toString(),phoneConroller.text.toString(),titleConroller.text.toString(),detailsConroller.text.toString(),dateConroller.text.toString(),idConroller.text.toString()).then((value) {
                    Fluttertoast.showToast(msg: "${assignTaskController.assignTaskResponse.value.message}");
                  });
                }
                }, child: const Text('Post')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
