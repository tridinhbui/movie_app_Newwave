import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/main.dart';
import 'package:flutter_counter/ui/app_cubit/app_cubit.dart';

import '../../../generated/l10n.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  String dropdownValue = 'EN';
  late AppCubit appCubit;
  bool isChange = false;

  @override
  void initState() {
    appCubit = BlocProvider.of<AppCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(138, 43, 226, 0.1),
          Color.fromRGBO(186, 85, 211, 1),
        ],
      )),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(70, 130, 180, 0.65),
        appBar: AppBar(
          title: Text(S.of(context).account),
          backgroundColor: Color.fromRGBO(70, 130, 180, 1),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Text(S.of(context).user_info,
                      style: TextStyle(fontSize: 22, color: Colors.white)),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("Language: ",
                      style: TextStyle(fontSize: 19, color: Colors.white)),
                ),
                _languageList()
              ]),
            ]),
      ),
    );
  }

  Widget _languageList() {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 8),
      child: Container(
        height:  35,
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black),
          color: Colors.white,
        ),
        child: DropdownButton<String>(
          style: TextStyle(color: Colors.black, fontSize: 20),
          underline: Container(
            height: 1,
            width: 5,
            color: Colors.blueAccent,
          ),
          icon: Icon(
            Icons.language,
            color: Colors.blueAccent,
            size: 19,
          ),
          value: context.read<AppCubit>().state.lang,
          hint: Text(context.read<AppCubit>().state.lang,
              style: TextStyle(
                color: Colors.white,
              )),
          items: [
            DropdownMenuItem(
              value: "en",
              child: Text(
                "EN",
                style: TextStyle(fontSize: 19),
              ),
            ),
            DropdownMenuItem(
                value: "vi",
                child: Text(
                  "VN",
                ))
          ],
          onChanged: (v) {
            appCubit.changeLanguage(v!);
          },
          isExpanded: true,
        ),
      ),
    );
  }
}
