import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:queue_system/Model/user_model.dart';
import 'package:queue_system/Model/employee_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

String baseUrl="http://192.168.10.16:80/";

class AppProvider with ChangeNotifier {
  UserModel? userModel;
  bool  loading=false;


  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<void> getUser() async {
    var pref = await SharedPreferences.getInstance();
    String? userJson = pref.getString('user');  // Get user data from SharedPreferences
    if (userJson == null) {
      userModel = null;  // If no user data found, set userModel to null
      notifyListeners();
    } else {
      var data = jsonDecode(userJson);
      // Ensure proper token and data parsing
      userModel = UserModel.fromJson(data['info']['data'], token: data['token']);
      notifyListeners();  // Update the state after user data is fetched
    }
  }
  Future<String> logIn(String email, String password) async {
    var pref = await SharedPreferences.getInstance();
    try {
      final response = await http.get(Uri.parse(
          "${baseUrl}queue/apis/department/login.php?email=$email&&password=$password"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        // Save the response (user data) to SharedPreferences
        pref.setString("user", response.body);
        // Now fetch user data from SharedPreferences and notify listeners
        await getUser(); // Ensure user data is loaded after login
        return "تم تسجيل الدخول بنجاح";
      } else if (response.statusCode == 400) {
        return jsonDecode(response.body)["message"].toString();
      } else {
        return "حدث خطأ ما";
      }
    } catch (e) {
      return "$e";
    }
  }

  Future<String> addEmployee(String counterName, String email, String phone,
      File? image, String employeeName, String password) async {
    var uri = Uri.parse('http://192.168.10.16:80/queue/apis/department/add_employee.php');
    var request = http.MultipartRequest('POST', uri);

    request.headers['Authorization'] = 'Bearer ${userModel!.token}';
    // Add additional fields
    request.fields['depart_id'] = userModel!.departmentID.toString();
    request.fields['c_name'] = counterName;
    request.fields['email'] = email;
    request.fields['phone'] = phone;
    request.fields['employe_name'] = employeeName;
    request.fields['password'] = password;

    if (image != null) {
      // If file is picked, upload the picked file
      request.files.add(await http.MultipartFile.fromPath(
        'image',  // Field name for file
        image.path,
        filename: "logo.png",
      ));
    } else {
      // Load and upload the asset image
      Uint8List imageBytes = await loadAssetImage();
      request.files.add(http.MultipartFile.fromBytes(
        'image',  // Field name for file
        imageBytes,
        filename: 'default_image.png',
      ));
    }

    // Send request
    var response = await request.send();
    loading=true;
    notifyListeners();
    if (response.statusCode == 200) {
      print('File uploaded successfully.');
      loading=false;
      notifyListeners();
      return "success";
    } else {
      print('File upload failed with status: ${response.statusCode}');
      loading=false;
      notifyListeners();
      return 'File upload failed with status: ${response.statusCode}}';
    }
  }

  Future<String> updateEmployee(String? counterName, String? email, String? phone,
      File? image, String? employeeName, String? password,EmployeeModel employee) async {
    String url = 'http://192.168.10.16:80/queue/apis/department/edit_employee.php';
    print('URL: $url');
    var uri = Uri.parse(url);
  var request = http.MultipartRequest('POST', uri);

  request.headers['Authorization'] = 'Bearer ${userModel!.token}';
  // Add additional fields
  request.fields['employe_id'] = employee.employeeID.toString();
  request.fields['depart_id']=userModel!.departmentID.toString();
  request.fields['c_name'] = counterName??employee.counterName;
  request.fields['email'] = email??employee.email;
  request.fields['phone'] = phone??employee.phoneNumber;
  request.fields['employe_name'] = employeeName??employee.employeeName;
  if(password==null){
    null;
  }else{
    request.fields['password'] = password;
  }
    // If file is picked, upload the picked file
    if(image!=null){
      request.files.add(await http.MultipartFile.fromPath(
        'image',  // Field name for file
        image.path,
        filename: "logo.png",
      ));
    } else {
    // Load and upload the asset image
    Uint8List imageBytes = await loadAssetImage();
    request.files.add(http.MultipartFile.fromBytes(
    'image',  // Field name for file
    imageBytes,
    filename: 'default_image.png',
    ));
    }
  // Send request
  var response = await request.send();
  loading=true;
  notifyListeners();
  if (response.statusCode == 200) {
    print('File uploaded successfully.');
    loading=false;
    notifyListeners();
    return "success";
  } else {
    print('File upload failed with status: ${response.statusCode}');
    loading=false;
    notifyListeners();
    return 'File upload failed with status: ${response.statusCode}}';
   }
  }

  Future<String> deleteEmployee(String employeeID)async{
    var response=await http.post(Uri.parse("${baseUrl}queue/apis/department/delete_employee.php"),headers:{
      'Authorization': 'Bearer ${userModel!.token}',
    },body: {
      "employee_id": employeeID,
    });
    if(response.statusCode==200){
      print(response.body);
      return"success";
    }else{
      print(response.body);
      return response.body;
    }
  }

  Future<Uint8List> loadAssetImage() async {
    return await rootBundle.load('asset/images/default.png').then((data) {
      return data.buffer.asUint8List();
    });
  }

  Future<List<EmployeeModel>> getEmployees() async {
    var headers = {
      'Authorization': 'Bearer ${userModel!.token}',
    };
    try {
      final response = await http.get(Uri.parse(
          "${baseUrl}queue/apis/department/all_employee.php"),headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data["message"]);
        if(data["message"]=="no data !"){

          return [];
        }
       else{
        return data["message"].map<EmployeeModel>((item) {
            return EmployeeModel.fromJson(item as Map<String, dynamic>);
          }).toList();
        }
       notifyListeners();
      } else if (response.statusCode == 400) {
        // Handle other status codes
        print('Failed to load data. Status code: ${response.statusCode}');

        return [];
      } else {
        print(response.body);

        return [];
      }
    } catch (e) {
      // Handle errors like network failure
      print('Error: $e');

      return [];
    }
  }

  Stream<List<EmployeeModel>> employeesStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      var someTable =await getEmployees();
      yield someTable;
    }
  }

  Future<void> signUp(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    await pref.remove("user"); // Remove user data from SharedPreferences
    userModel = null;
    notifyListeners();
  }
}
