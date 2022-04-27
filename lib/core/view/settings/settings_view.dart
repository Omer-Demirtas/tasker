import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:tasker/core/cubit/Theme/theme_cubit.dart';
import 'package:tasker/core/widget/common/back_app_bar.dart';

class SettingsView extends StatefulWidget
{
  static const String settingsRoute = '/settings';

  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
{
  bool _darkMode = false;

  void _handleDarkMode(bool value)
  {
    setState(() {
      _darkMode = value;
      context.read<ThemeCubit>().toggleTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const BackAppBar(),
              Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _settingsSwitchItem(_darkMode, _handleDarkMode),
                    ],
                  )
              )
            ],
          ),
        )
    );
  }

  Widget _settingsSwitchItem(bool value,Function(bool value) callBack)
  {
    return Column(
      children: [
        ListTile(
          title: const Text('Dark Mode'),
          trailing: Switch(
              value: value,
              onChanged: (value) => callBack(value)
          ),
        ),
        const Divider()
      ],
    );
  }
}

