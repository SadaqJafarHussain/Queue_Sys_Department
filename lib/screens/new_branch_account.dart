import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:queue_system/Controller/app_provider.dart';
import 'package:queue_system/widgets/app_bar.dart';

class NewBranchAccount extends StatefulWidget {
  const NewBranchAccount({super.key});

  @override
  State<NewBranchAccount> createState() => _NewBranchAccountState();
}

class _NewBranchAccountState extends State<NewBranchAccount> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController counterName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController employee = TextEditingController();
  File? _selectedImage;
  RegExp emailRegex= RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  RegExp phoneRegex = RegExp(r'^07[0-9]{9}$');
  @override
  void initState() {
    super.initState();
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
                "اضافة حساب فرع",
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
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .48,
                width: MediaQuery.of(context).size.width * .62,
                decoration: BoxDecoration(
                  color: const Color(0xff283046),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'اضافة حساب فرع',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.person_add_alt,
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
                            width: MediaQuery.of(context).size.width * .05,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .18,
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
                            width: MediaQuery.of(context).size.width * .18,
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
                            width: MediaQuery.of(context).size.width * .18,
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
                            width: MediaQuery.of(context).size.width * .05,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .18,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _selectedImage != null
                                    ? Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: FileImage(_selectedImage!),
                                              fit: BoxFit.fill,
                                            ),
                                            color: const Color(0xffE9F3FF),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                      )
                                    : Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffE9F3FF),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          "asset/images/default.png",
                                          color: const Color(0xff9BA5BE),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 30,
                                  child: ElevatedButton(
                                    onPressed: pickImage,
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
                            width: MediaQuery.of(context).size.width * .18,
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
                            width: MediaQuery.of(context).size.width * .18,
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
                            onPressed:Provider.of<AppProvider>(context).loading?null: () {
                              if (email.text.isEmpty ||
                                  password.text.isEmpty ||
                                  phone.text.isEmpty ||
                                  counterName.text.isEmpty ||
                                  employee.text.isEmpty ) {
                                showMyDialog(
                                    context,
                                    "asset/images/no.png",
                                    const Color(0xffFFCC00),
                                    "يجب كتابة جميع المعلومات",(){
                                  Navigator.pop(context);
                                });
                              }else if(!emailRegex.hasMatch(email.text.trim())){
                                showMyDialog(
                                    context,
                                    "asset/images/no.png",
                                     Colors.red,
                                    "البريد الالكتروني غير صالح",(){
                                  Navigator.pop(context);
                                });
                              }else if(!phoneRegex.hasMatch(phone.text.trim())){
                                showMyDialog(
                                    context,
                                    "asset/images/no.png",
                                    Colors.red,
                                    "رقم الهاتف غير صالح",(){
                                      Navigator.pop(context);
                                });
                              } else {
                                Provider.of<AppProvider>(context,listen: false).addEmployee(
                                    counterName.text.trim(),
                                    email.text.trim(),
                                    phone.text.trim(),
                                    _selectedImage,
                                    employee.text.trim(),
                                    password.text.trim()).then((str){
                                      if(str=="success"){
                                        showMyDialog(
                                            context,
                                            "asset/images/cheack.png",
                                            const Color(0xff00CEC9),
                                            "تم تسجيل حساب الفرع بنجاح",(){
                                              setState(() {
                                                counterName.clear();
                                                email.clear();
                                                phone.clear();
                                                _selectedImage=null;
                                                employee.clear();
                                                password.clear();
                                              });
                                              Navigator.pop(context);
                                        });
                                      }else{
                                        showMyDialog(
                                            context,
                                            "asset/images/no.png",
                                            Colors.red,
                                            str,(){
                                          Navigator.pop(context);
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
                              child:Provider.of<AppProvider>(context).loading?const CircularProgressIndicator(): Row(
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
              const SizedBox(
                width: 80,
              ),
            ],
          ),
        ],
      ),
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

  void showMyDialog(BuildContext context, String img, Color color, String text,VoidCallback fun) {
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
}
