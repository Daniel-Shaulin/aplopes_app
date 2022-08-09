import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:aplopes_app/src/pages/home/nav_drawer.dart';
import 'package:aplopes_app/src/pages/home/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:aplopes_app/src/config/mocks/UserMock.dart' as userMock;

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);
  final Color colorStatus = Colors.green;


  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 5.0,
          backgroundColor: CustomColors.aplopesBasicColor,
          title: Row(
            children: <Widget>[
              const SizedBox(width: 15,),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                  decoration: new BoxDecoration(
                    border: new Border.all(
                      color: widget.colorStatus,
                      width: 1.0,
                    ),
                    borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(userMock.user.userIcon ?? ""),
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 130, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        userMock.user.name ?? "",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.trip_origin_outlined,
                            color: Utils.statusColor(status: userMock.user.status ?? ""),
                            size: 12.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(userMock.user.status ?? "", style: TextStyle(fontSize: 12.0))
                        ],
                      ),
                    ]
                ),
              )
            ],
          ),
        ),
        drawer: NavDrawer()
    );
  }
}
