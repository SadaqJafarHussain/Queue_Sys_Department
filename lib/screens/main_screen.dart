import 'package:flutter/material.dart';
import 'package:queue_system/screens/all_branches.dart';
import 'package:queue_system/screens/main_board.dart';
import 'package:queue_system/screens/new_branch_account.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  int subIndex = 0;
  int screenIndex = 0;
  List<Widget> screens = [
    const MainBoardScreen(),
    const AllBranches(),
    const NewBranchAccount(),
    Container(),
    Container(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          screens[screenIndex],
          Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.16,
            decoration:
                const BoxDecoration(color: Color(0xff283046), boxShadow: [
              BoxShadow(
                color: Color(0xff171D31),
                blurRadius: 0.3,
                spreadRadius: 0,
              ),
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "asset/images/place.png",
                  height: 100,
                  color: const Color(0xffFFFFFF),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      index = 0;
                      screenIndex = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: index == 0
                            ? const Color(0xffF4F9FF)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Opacity(
                          opacity: 0.0,
                          child: Icon(
                            index == 1
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_left,
                            size: 18,
                            color: index == 1
                                ? const Color(0xff3E92F9)
                                : const Color(0xff9BA5BE),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text(
                                  "الصفحة الرئيسية",
                                  style: TextStyle(
                                    overflow: TextOverflow.fade,
                                    color: index == 0
                                        ? const Color(0xffFFB729)
                                        : const Color(0xff9BA5BE),
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "asset/images/home.png",
                                height: 16,
                                color: index == 0
                                    ? const Color(0xffFFB729)
                                    : const Color(0xff9BA5BE),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: index == 1
                            ? const Color(0xffF4F9FF)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          index == 1
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_left,
                          size: 18,
                          color: index == 1
                              ? const Color(0xffFFB729)
                              : const Color(0xff9BA5BE),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text(
                                  "حسابات الافرع",
                                  style: TextStyle(
                                    overflow: TextOverflow.visible,
                                    color: index == 1
                                        ? const Color(0xffFFB729)
                                        : const Color(0xff9BA5BE),
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "asset/images/group.png",
                                height: 16,
                                color: index == 1
                                    ? const Color(0xffFFB729)
                                    : const Color(0xff9BA5BE),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                index == 1
                    ? Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      subIndex = 1;
                                      screenIndex = 1;
                                    });
                                  },
                                  child: Text(
                                    "كل الافرع",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Cairo',
                                      color: subIndex == 1
                                          ? const Color(0xffFFB729)
                                          : const Color(0xff9BA5BE),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      subIndex = 2;
                                      screenIndex = 2;
                                    });
                                  },
                                  child: Text(
                                    "اضافة حساب فرع",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Cairo',
                                      color: subIndex == 2
                                          ? const Color(0xffFFB729)
                                          : const Color(0xff9BA5BE),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      subIndex = 3;
                                      screenIndex = 3;
                                    });
                                  },
                                  child: Text(
                                    "موضفي الفرع",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Cairo',
                                      color: subIndex == 3
                                          ? const Color(0xffFFB729)
                                          : const Color(0xff9BA5BE),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      subIndex = 4;
                                      screenIndex = 4;
                                    });
                                  },
                                  child: Text(
                                    "اعدادات الفرع",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Cairo',
                                      color: subIndex == 4
                                          ? const Color(0xffFFB729)
                                          : const Color(0xff9BA5BE),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 2,
                                  height: 25,
                                  color: subIndex == 1
                                      ? const Color(0xffFFB729)
                                      : const Color(0xff9BA5BE),
                                ),
                                Container(
                                  width: 2,
                                  height: 25,
                                  color: subIndex == 2
                                      ? const Color(0xffFFB729)
                                      : const Color(0xff9BA5BE),
                                ),
                                Container(
                                  width: 2,
                                  height: 25,
                                  color: subIndex == 3
                                      ? const Color(0xffFFB729)
                                      : const Color(0xff9BA5BE),
                                ),
                                Container(
                                  width: 2,
                                  height: 25,
                                  color: subIndex == 4
                                      ? const Color(0xffFFB729)
                                      : const Color(0xff9BA5BE),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : Container(),
                const SizedBox(height: 10),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: index == 2
                            ? const Color(0xffF4F9FF)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          index == 2
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_left,
                          size: 18,
                          color: index == 2
                              ? const Color(0xffFFB729)
                              : const Color(0xff9BA5BE),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text(
                                  "اعدادات النظام",
                                  style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    color: index == 2
                                        ? const Color(0xffFFB729)
                                        : const Color(0xff9BA5BE),
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Image.asset(
                                "asset/images/settings.png",
                                height: 18,
                                color: index == 2
                                    ? const Color(0xffFFB729)
                                    : const Color(0xff9BA5BE),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
