import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:tasker/core/cubit/task/task_cubit.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/utils/form/focus_node_disabled.dart';
import 'package:tasker/core/widget/tag/tag_list.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({Key? key}) : super(key: key);

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm>
{
  String title = "";
  DateTime _startAt = DateTime.now();
  DateTime _finishAt = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _finishDateController = TextEditingController();

  @override
  void initState() {
    _startDateController.text = _startAt.toString();
    _finishDateController.text = _finishAt.toString();
    super.initState();
  }

  @override
  void dispose() {
    _finishDateController.dispose();
    _startDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(initialValue: 'Title', onSaved: (newValue) => title = newValue!,),
              const SizedBox(height: 20,),
              const SizedBox(height: 20,),
              TagList(voidCallback: () {},),
              const SizedBox(height: 40,),

              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.45,
                    child: TextFormField(
                      controller: _startDateController,
                      onTap: () => _selectDate('start'),
                      focusNode: AlwaysDisabledFocusNode(),
                      decoration: const InputDecoration(
                        labelText: 'Start At',
                        //errorText: 'Error message',
                        border: OutlineInputBorder(),
                        //suffixIcon: Icon(Icons.error,),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.45,
                    child: TextFormField(
                      controller: _finishDateController,
                      onTap: () => _selectDate('finish'),
                      focusNode: AlwaysDisabledFocusNode(),
                      decoration: const InputDecoration(
                        labelText: 'Finish At',
                        //errorText: 'Error message',
                        border: OutlineInputBorder(),
                        //suffixIcon: Icon(Icons.error,),
                      ),
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: ()
                    {
                      print('save');
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        print(title);


                        context.read<TaskCubit>().addTask(
                          Task(
                            description: 'asd',
                            title: title,
                            finishAt: _finishAt,
                            startAt: _startAt,
                            tags: [],
                          )
                        );

                        ScaffoldMessenger. of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: Text('Save')
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  _selectDate(String type) async
  {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: type == 'start' ? _startAt : _finishAt,
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
        print('Date change as ${newSelectedDate.toString()}');
          (type =='start') ? _startAt = newSelectedDate : _finishAt = newSelectedDate;
          (type =='start') ?
          _startDateController.text = _startAt.toString() :
          _finishDateController.text = _finishAt.toString();
    }
  }
}
