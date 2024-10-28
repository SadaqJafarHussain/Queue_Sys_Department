import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_system/Controller/app_provider.dart';
import 'package:queue_system/widgets/branches_data.dart';
import '../widgets/app_bar.dart';

class AllBranches extends StatefulWidget {
  const AllBranches({super.key});

  @override
  State<AllBranches> createState() => _AllBranchesState();
}

class _AllBranchesState extends State<AllBranches> {
  late ScrollController _scrollController;
  @override
  void initState() {
    Provider.of<AppProvider>(context,listen: false).getDepartments();
    _scrollController = ScrollController(); // Initialize ScrollController
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose(); // Dispose ScrollController
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff171D31),
      width: MediaQuery.of(context).size.width * 0.84,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "كل الافرع",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Color(0xff9BA5BE),
                    fontSize: 12),
              ),
              Icon(
                Icons.keyboard_arrow_left_outlined,
                color: Color(0xff9BA5BE),
                size: 20,
              ),
              Text(
                "حسابات الافرع",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Color(0xff9BA5BE),
                    fontSize: 12),
              ),
              SizedBox(
                width: 80,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width * .75,
                decoration: BoxDecoration(
                  color: const Color(0xff283046),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap:(){
                                Provider.of<AppProvider>(context,listen: false).getDepartments();
                                setState(() {
                                });
                              },
                              child: Image.asset("asset/images/refresh.png",height: 28,)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'حسابات الافرع الحالية',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 12,
                                    color: Color(0xffFFFFFF)),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Image.asset("asset/images/account.png",
                                  height: 15, color: const Color(0xffFFFFFF))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                      child: Container(
                        height: 30,
                        color: const Color(0xffFFB729),
                        child: Row(
                          children:[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .2,
                              child: const Center(
                                child: Text(
                                  "التحكم",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Cairo',
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .08,
                              child: const Center(
                                child: Text(
                                  "رقم الهاتف",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Cairo',
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .14,
                              child: const Center(
                                child: Text(
                                  "البريد الالكتروني",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Cairo',
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .13,
                              child: const Center(
                                child: Text(
                                  "اسم مسوؤل الفرع",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Cairo',
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .12,
                              child: const Center(
                                child: Text(
                                  "اسم الفرع",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Cairo',
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .062,
                              child: const Center(
                                child: Text(
                                  "logo",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily: 'Cairo',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child:Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
                        child: Consumer<AppProvider>(
                          builder: (context,provider,child){
                            if(provider.departments.isEmpty){
                              return const Center(
                                child: Text("لم تقم باضافة حسابات",style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Cairo',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),),
                              );
                            }
                            return  Theme(
                              data: Theme.of(context).copyWith(
                                scrollbarTheme: ScrollbarThemeData(
                                  thumbColor: WidgetStateProperty.all(const Color(0xffFFB729),), // Set scrollbar color
                                ),
                              ),
                              child: Scrollbar(
                                thumbVisibility: true,
                                thickness: 5.0,
                                radius:const Radius.circular(20),
                                controller: _scrollController, // Attach ScrollController to Scrollbar
                                child: ListView.builder(
                                  controller: _scrollController,
                                    itemCount: provider.departments.length,
                                    itemBuilder: (context, index) {
                                      return  BranchesData(
                                         department: provider.departments[index],);
                                    }),
                              ),
                            );
                          },
                        ),
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
