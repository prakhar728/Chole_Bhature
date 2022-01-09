import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/widgets/request_containers.dart';
import 'package:cholebhature/widgets/search_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsBody extends StatefulWidget {
  const FriendsBody({Key? key}) : super(key: key);

  @override
  _FriendsBodyState createState() => _FriendsBodyState();
}

class _FriendsBodyState extends State<FriendsBody> {
  String _search = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            height: 45,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                onChanged: (string){
                  setState(() {
                    _search = string;
                  });
                },
                cursorColor: Red,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Red,
                  iconColor: Red,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 0)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 0)
                  ),
                ),
              ),
            ),
          ),
        ),
        
        Expanded(
          child: Container(
            child: _search != "" ? SearchContainer(Search: _search) : RequestContainer(),
          ),
        )
      ],
    );
  }
}
