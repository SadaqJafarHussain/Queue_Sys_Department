import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:queue_system/Controller/app_provider.dart';
import 'package:queue_system/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171D31),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C294B),
        title: const Text(
          "تطبيق الطابور",
          style: TextStyle(fontFamily: 'Cairo', fontSize: 15, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .43,
          width: MediaQuery.of(context).size.width * .4,
          decoration: BoxDecoration(
            color: const Color(0xff1C294B),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "تسجيل دخول",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffFFFFFF),
                  fontFamily: 'Cairo',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 12, fontFamily: 'Cairo'),
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp("[0-9@a-zA-Z.]")),
                      ],
                      autocorrect: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: email,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 2),
                          hintText: "البريد الالكتروني",
                          hintStyle: const TextStyle(
                              fontFamily: 'Cairo',
                              color: Color(0xff9BA5BE),
                              fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none),
                          fillColor: const Color(0xffE9F3FF),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xff9BA5BE),
                            size: 15,
                          )),
                      textInputAction: TextInputAction.done,
                      validator: validateEmail,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Form(
                    child: TextFormField(
                      style: const TextStyle(fontSize: 12),
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
                              borderRadius: BorderRadius.circular(5),
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
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    if (email.text.isEmpty || password.text.isEmpty) {
                      showMyDialog(context, "asset/images/no.png",
                          const Color(0xffFFCC00), "يجب ملئ جميع الحقول", () {
                        Navigator.pop(context);
                      });
                    } else if (!_formKey.currentState!.validate()) {
                      showMyDialog(
                          context,
                          "asset/images/no.png",
                          const Color(0xffFFCC00),
                          "البريد الالكتروني غير صالح", () {
                        Navigator.pop(context);
                      });
                    } else {
                      Provider.of<AppProvider>(context,listen: false).logIn(email.text.trim(), password.text.trim())
                          .then((str) {
                        if (str == "تم تسجيل الدخول بنجاح") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MainScreen()));
                        } else {
                          showMyDialog(context, "asset/images/no.png",
                              const Color(0xffFFCC00), str, () {
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "تسجيل دخول",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xffFFFFFF),
                            fontFamily: 'Cairo',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "asset/images/save.png",
                          height: 17,
                          color: const Color(0xffFFFFFF),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showMyDialog(BuildContext context, String img, Color color, String text,
      VoidCallback fun) {
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
                      fontSize: 15,
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

  String? validateEmail(String? value) {
    // Regular expression for validating an email
    String pattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'البريد الالكتروني مطلوب';
    } else if (!regex.hasMatch(value)) {
      return 'البريد الالكتروني غير صالح';
    } else {
      return null; // Validation passed
    }
  }
}
