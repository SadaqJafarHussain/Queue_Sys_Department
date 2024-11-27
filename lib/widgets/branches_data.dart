import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:queue_system/Model/employee_model.dart';

import '../Controller/app_provider.dart';

class BranchesData extends StatefulWidget {
  final EmployeeModel employee;
  const BranchesData(
      {
      required this.employee,
      super.key});

  @override
  State<BranchesData> createState() => _BranchesDataState();
}

class _BranchesDataState extends State<BranchesData> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController counterName = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController employee = TextEditingController();

  File? _selectedImage;

  RegExp emailRegex= RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

  RegExp phoneRegex = RegExp(r'^07[0-9]{9}$');
  String errorMessage='';
  Color errorColor= Colors.red;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Container(
        height: MediaQuery.of(context).size.height*.07,
        color: const Color(0xff171D31),
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .07,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              backgroundColor: const Color(0xff9BA5BE),
                            ),
                            child:const  Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ايقاف الحساب",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontFamily: 'Cairo'),
                                  ),
                                 SizedBox(
                                    width: 5,
                                  ),
                                Icon(
                                    Icons.cancel_outlined,
                                    size: 16,
                                    color: Color(0xffFFFFFF),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .05,
                          height: 30,
                          child: ElevatedButton(
                            onPressed:(){
                              showConfirmationDialog(
                                  context, "asset/images/Warning.png",
                                 const Color(0xff00CEC9),
                                  'هل انت متاكد من حذف هذا الحساب ؟',
                                    () {
                                  Provider.of<AppProvider>(context,listen: false).deleteEmployee(widget.employee.employeeID.toString());
                                  setState(() {
                                  });
                                },);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              backgroundColor: const Color(0xffD63031),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                const  Text(
                                    "حذف",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:Colors.white,
                                        fontFamily: 'Cairo'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "asset/images/delete.png",
                                    height: 13,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .05,
                          height: 30,
                          child: ElevatedButton(
                            onPressed:() {
                              showEditDialog(context,widget.employee);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              backgroundColor:const Color(0xff00CEC9),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "تعديل",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontFamily: 'Cairo'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "asset/images/edit.png",
                                    height: 13,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .08,
                  child: Center(
                    child: Text(
                      widget.employee.counterName,
                      style: const TextStyle(
                        color: Color(0xffFFFFFF),
                        fontFamily: 'Cairo',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .14,
                  child: Center(
                    child: Text(
                      widget.employee.email,
                      style: const TextStyle(
                        color: Color(0xffFFFFFF),
                        fontFamily: 'Cairo',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .13,
                  child: Center(
                    child: Text(
                      widget.employee.employeeName,
                      style:const  TextStyle(
                        color: Color(0xffFFFFFF),
                        fontFamily: 'Cairo',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .12,
                  child: Center(
                    child: Text(
                      widget.employee.counterName,
                      style: const TextStyle(
                        color: Color(0xffFFFFFF),
                        fontFamily: 'Cairo',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .062,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: widget.employee.imageUrl=="no"?const AssetImage("asset/images/default.png"): NetworkImage(widget.employee.imageUrl),
                      fit: BoxFit.contain,
                    )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showWarningDialog(BuildContext context, String img, Color color, String text,VoidCallback fun) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.width * .35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  img,
                  height: 70,
                  color: color,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .1,
                  child: ElevatedButton(
                    onPressed: fun,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      backgroundColor: color,
                    ),
                    child: const Center(
                      child: Text(
                        "حسنا",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontFamily: 'Cairo'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showEditDialog(BuildContext context,EmployeeModel department) {
    setState(() {
      email.text=department.email;
      phone.text=department.phoneNumber;
      employee.text=department.employeeName;
      counterName.text=department.counterName;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
       return StatefulBuilder(
          builder: (context, setStateInsideDialog)
        {
          return AlertDialog(
            backgroundColor: const Color(0xff283046),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            content: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .48,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .62,
              decoration: BoxDecoration(
                color: const Color(0xff283046),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Opacity(
                          opacity: 0.0,
                          child: Text(
                            'just demo', style: TextStyle(color: Colors
                              .white),)),
                      Text(errorMessage,
                        style: TextStyle(color: errorColor),),
                      const Opacity(
                          opacity: 0.0,
                          child: Text(
                            'just demo', style: TextStyle(color: Colors
                              .white),)),

                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'تعديل حساب الفرع',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.edit,
                          size: 16,
                          color: Color(0xffFFFFFF),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .05,
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          height: 40,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Form(
                              child: TextFormField(
                                style:
                                const TextStyle(height: .8, fontSize: 13),
                                keyboardType: TextInputType.text,
                                autocorrect: false,
                                controller: password,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "كلمة السر",
                                    hintStyle: const TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Color(0xff9BA5BE),
                                        fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        borderSide: BorderSide.none),
                                    fillColor: const Color(0xffE9F3FF),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Color(0xff9BA5BE),
                                      size: 15,
                                    )),
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          height: 40,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Form(
                              child: TextFormField(
                                style: const TextStyle(
                                    height: .8,
                                    fontSize: 13,
                                    fontFamily: 'Cairo'),
                                keyboardType: TextInputType.emailAddress,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[0-9@a-zA-Z.]")),
                                ],
                                autocorrect: false,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                controller: email,
                                decoration: InputDecoration(
                                    hintText: "البريد الالكتروني",
                                    hintStyle: const TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Color(0xff9BA5BE),
                                        fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        borderSide: BorderSide.none),
                                    fillColor: const Color(0xffE9F3FF),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Color(0xff9BA5BE),
                                      size: 15,
                                    )),
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          height: 40,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Form(
                              child: TextFormField(
                                style: const TextStyle(
                                    height: .8,
                                    fontSize: 13,
                                    fontFamily: 'Cairo'),
                                keyboardType: TextInputType.text,
                                autocorrect: false,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                controller: counterName,
                                decoration: InputDecoration(
                                    hintText: "اسم الشباك",
                                    hintStyle: const TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Color(0xff9BA5BE),
                                        fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        borderSide: BorderSide.none),
                                    fillColor: const Color(0xffE9F3FF),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      Icons.home_max,
                                      color: Color(0xff9BA5BE),
                                      size: 16,
                                    )),
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .05,
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    image:_selectedImage!=null? DecorationImage(
                                      image: FileImage(_selectedImage!),
                                      fit: BoxFit.fill,
                                    ):DecorationImage(
                                        image:department.imageUrl=="no"?const AssetImage("asset/images/default.png") :NetworkImage(department.imageUrl),
                                        fit: BoxFit.fill
                                    ),
                                    color: const Color(0xffE9F3FF),
                                    borderRadius:
                                    BorderRadius.circular(5)),
                                alignment: Alignment.center,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 150,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: ()async{
                                    await pickImage();
                                    setStateInsideDialog((){
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5),
                                    backgroundColor: const Color(0xff9BA5BE),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "صورة الموظف",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontFamily: 'Cairo'),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(
                                          "asset/images/shape.png",
                                          height: 13,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          height: 40,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Form(
                              child: TextFormField(
                                style: const TextStyle(
                                    height: .8,
                                    fontSize: 13,
                                    fontFamily: 'Cairo'),
                                keyboardType: TextInputType.number,
                                autocorrect: false,
                                controller: phone,
                                decoration: InputDecoration(
                                    hintText: "رقم الهاتف",
                                    hintStyle: const TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Color(0xff9BA5BE),
                                        fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        borderSide: BorderSide.none),
                                    fillColor: const Color(0xffE9F3FF),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      color: Color(0xff9BA5BE),
                                      size: 15,
                                    )),
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          height: 40,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Form(
                              child: TextFormField(
                                style: const TextStyle(
                                    height: .8,
                                    fontSize: 13,
                                    fontFamily: 'Cairo'),
                                keyboardType: TextInputType.text,
                                autocorrect: false,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                controller: employee,
                                decoration: InputDecoration(
                                    hintText: "اسم الموظف",
                                    hintStyle: const TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Color(0xff9BA5BE),
                                        fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        borderSide: BorderSide.none),
                                    fillColor: const Color(0xffE9F3FF),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      Icons.person_outline,
                                      color: Color(0xff9BA5BE),
                                      size: 15,
                                    )),
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //this is not gonna be showen it's just for making the button in the middle
                      Opacity(
                        opacity: 0.0,
                        child: SizedBox(
                          width: 150,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding:
                              const EdgeInsets.symmetric(vertical: 5),
                              backgroundColor: const Color(0xff9BA5BE),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "تعديل التصميم",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontFamily: 'Cairo'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "asset/images/shape.png",
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 170,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: Provider
                              .of<AppProvider>(context)
                              .loading ? null : () {
                            if (!emailRegex.hasMatch(email.text.trim())) {
                                 showWarningDialog(
                                     context,
                                     "asset/images/cheack.png",
                                     const Color(0xffFFCC00),
                                     "البريد الالكتروني غير صالح",(){
                                   setState(() {
                                   });
                                   Navigator.pop(context);
                                 });
                            } else
                            if (!phoneRegex.hasMatch(phone.text.trim())) {
                              showWarningDialog(
                                  context,
                                  "asset/images/cheack.png",
                                  const Color(0xffFFCC00),
                                  "رقم الهاتف غير صالح",(){
                                setState(() {

                                });
                                Navigator.pop(context);
                              });
                            } else {
                              Provider.of<AppProvider>(context, listen: false)
                                  .updateEmployee(
                                  counterName.text.trim(),
                                  email.text.trim(),
                                  phone.text.trim(),
                                  _selectedImage,
                                  employee.text.trim(),
                                  password.text.trim(),department)
                                  .then((str) {
                                if (str == "success") {
                                  showWarningDialog(
                                      context,
                                      "asset/images/cheack.png",
                                      const Color(0xff00CEC9),
                                      "تم تعديل المعلومات بنجاح",(){
                                    setState(() {
                                    });
                                    Navigator.pop(context);
                                  });
                                  Future.delayed(const Duration(seconds: 2),(){
                                    Navigator.pop(context);
                                  });
                                } else {
                                  setStateInsideDialog((){
                                    errorMessage=str;
                                    errorColor=Colors.red;
                                  });
                                }
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            backgroundColor: const Color(0xffFFCC00),
                          ),
                          child: Center(
                            child: Provider
                                .of<AppProvider>(context)
                                .loading ? const CircularProgressIndicator() : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "حفظ البيانات",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff171D31),
                                      fontFamily: 'Cairo'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "asset/images/save.png",
                                  height: 15,
                                  color: const Color(0xff171D31),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // this is not gonna appear too
                      Opacity(
                        opacity: 0.0,
                        child: SizedBox(
                          width: 150,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding:
                              const EdgeInsets.symmetric(vertical: 5),
                              backgroundColor: const Color(0xff9BA5BE),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "لتعديل التصميم",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontFamily: 'Cairo'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "asset/images/shape.png",
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Future<void> pickImage() async {
    // Open file picker to select an image
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Restrict the picker to image files
      allowMultiple: false, // Pick only one image
    );

    if (result != null) {
      // The path of the selected file
      String filePath = result.files.single.path!;
      if (filePath.isNotEmpty) {
        setState(() {
          _selectedImage = File(filePath);
        });
      }
    } else {
      // User canceled the picker
      print('Image selection canceled.');
    }
  }

  void showConfirmationDialog(BuildContext context, String img, Color color, String text,VoidCallback fun) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context,setStateInsideDialog) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width * .35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      img,
                      height: 70,
                      color: color,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .1,
                          child: ElevatedButton(
                            onPressed:(){
                              fun();
                              setStateInsideDialog((){});
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              backgroundColor: color,
                            ),
                            child: const Center(
                              child: Text(
                                "حذف",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontFamily: 'Cairo'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .1,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              backgroundColor: Colors.grey,
                            ),
                            child: const Center(
                              child: Text(
                                "الغاء",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontFamily: 'Cairo'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        );
      },
    );
  }
}
