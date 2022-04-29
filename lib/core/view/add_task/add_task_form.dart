import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:tasker/core/cubit/task/task_cubit.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/utils/date_time_utils.dart';
import 'package:tasker/core/utils/form/focus_node_disabled.dart';
import 'package:tasker/core/utils/time_extension.dart';
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

  bool _isCyclical = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _finishDateController = TextEditingController();

  @override
  void initState() {
    _startDateController.text = DateTimeConverter.convertDateTimeToString(_startAt);
    _finishDateController.text = DateTimeConverter.convertDateTimeToString(_finishAt);
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
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const TagList(),
            SizedBox(height: height * 0.05,),
            TextFormField(
              onSaved: (newValue) => title = newValue!,
              decoration: const InputDecoration(
                labelText: 'Title',
                //errorText: 'Error message',
                border: OutlineInputBorder(),
                //suffixIcon: Icon(Icons.error,),
              ),
            ),
            SizedBox(height: height * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.40,
                  child: TextFormField(
                    controller: _startDateController,
                    onTap: () => _selectDate("start"),
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
                  width: width * 0.40,
                  child: TextFormField(
                    controller: _finishDateController,
                    onTap: () => _selectDate("finish"),
                    focusNode: AlwaysDisabledFocusNode(),
                    decoration: const InputDecoration(
                      labelText: 'Finish At',
                      //errorText: 'Error message',
                      border: OutlineInputBorder(),
                      //suffixIcon: Icon(Icons.error,),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.05,),
            ListTile(
            title: const Text(
              'cyclical',
            ),
            trailing: Switch(
              value: _isCyclical,
              //activeColor: Color(0xFF6200EE),
              onChanged: (value)
              {
                setState(() {
                  _isCyclical = value;
                });
              },
            ),
            ),
            SizedBox(height: height * 0.05,),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: ()
                  {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();

                      context.read<TaskCubit>().addTask(
                          Task(
                            description: 'asd',
                            title: title,
                            finishAt: _finishAt,
                            startAt: _startAt,
                            cyclical: _isCyclical,
                            cron: '0 0 0/2 ? * * *',
                            tags: [],
                          )
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save')
              ),
            ),
          ],
        ),
      ),
    );
  }

  _selectDate(String type) async
  {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (date != null)
    {
      if(type == 'start')
      {
        _startAt = date;
        _startDateController.text = DateTimeConverter.convertDateTimeToString(date);
      }
      else
      {
        _finishAt = date;
        _finishDateController.text = DateTimeConverter.convertDateTimeToString(date);
      }
    }
  }

}
