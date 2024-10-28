import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:queue_system/Model/admin_model.dart';
import 'package:queue_system/Model/department_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AppProvider with ChangeNotifier {
  AdminModel? admin;
  bool  loading=false;
  List<DepartmentModel> _departments=[];
  List<DepartmentModel> get departments=> _departments;


  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<String> logIn(String email, String password) async {
    try {
      final response = await http.get(Uri.parse(
          "https://queue.nustsys.info/apis/firm/login?email=$email&&password=$password"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        //print(data);
        admin = AdminModel.fromJson(data["info"]["data"], data["token"]);
        final ref=await SharedPreferences.getInstance();
        ref.setString("token", data["token"].toString());
        notifyListeners();
        return "تم تسجيل الدخول بنجاح";
      } else if (response.statusCode == 400) {
        // Handle other status codes
        print('Failed to load data. Status code: ${response.statusCode}');
        return jsonDecode(response.body)["message"].toString();
      } else {
        return "حدث خطأ ما";
      }
    } catch (e) {
      // Handle errors like network failure
      print('Error: $e');
      return "البريد الالكتروني او كلمة السر غير صحيحة";
    }
  }

  Future<String> addDepartment(String departmentName, String email, String phone,
      File? image, String employeeName, String password) async {
    var uri = Uri.parse('https://queue.nustsys.info/apis/firm/add_deprtment');
    var request = http.MultipartRequest('POST', uri);

    var ref=await SharedPreferences.getInstance();
    var token=ref.getString("token");
    request.headers['Authorization'] = 'Bearer $token';

    // Add additional fields
    request.fields['firm_id'] = admin!.userId.toString();
    request.fields['depart_name'] = departmentName;
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

  Future<String> updateDepartment(String? departmentName, String? email, String? phone,
      File? image, String? employeeName, String? password,DepartmentModel department) async {
    var ref=await SharedPreferences.getInstance();
    var token=ref.getString("token");
  var uri = Uri.parse('https://queue.nustsys.info/apis/firm/edit_department');
  var request = http.MultipartRequest('POST', uri);


  request.headers['Authorization'] = 'Bearer $token';

  // Add additional fields
  request.fields['department_id']=department.departmentId.toString();
  request.fields['firm_id'] = admin!.userId.toString();
  request.fields['depart_name'] = departmentName??department.departmentName;
  request.fields['email'] = email??department.email;
  request.fields['phone'] = phone??department.phoneNumber;
  request.fields['employe_name'] = employeeName??department.employeeName;
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
    }else {
      // Step 1: Download the image from URL
      var response = await http.get(Uri.parse(department.imageUrl));

      // Step 2: Get the temporary directory to save the file
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      // Step 3: Create a file from the downloaded image
      File imageFile = File('$tempPath/${path.basename(department.imageUrl)}');
      await imageFile.writeAsBytes(response.bodyBytes);
    // Step 4: Add the image to the multipart request
    request.files.add(await http.MultipartFile.fromPath(
    'image',
    imageFile.path,
    filename: path.basename(imageFile.path), // Optional, provides the filename
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

  Future<String> deleteDepartment(String departmentId)async{
    _departments.removeWhere((dep)=>dep.departmentId.toString()==departmentId);
     notifyListeners();
    var ref=await SharedPreferences.getInstance();
    var token= ref.getString("token");
    var response=await http.post(Uri.parse("https://queue.nustsys.info/apis/firm/delete_depart"),headers:{
      'Authorization': 'Bearer $token',
    },body: {
      "department_id": departmentId,
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

  Future<void> getDepartments() async {
    var ref=await SharedPreferences.getInstance();
    var token=ref.getString("token");
    var headers = {
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http.get(Uri.parse(
          "https://queue.nustsys.info/apis/firm/all_department"),headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data["message"]);
        if(data["message"]=="no data !"){
          _departments=[];
        }
       else{
          _departments = data["message"].map<DepartmentModel>((item) {
            return DepartmentModel.fromJson(item as Map<String, dynamic>);
          }).toList();
        }
        notifyListeners();
      } else if (response.statusCode == 400) {
        // Handle other status codes
        print('Failed to load data. Status code: ${response.statusCode}');
      } else {
        print(response.body);
      }
    } catch (e) {
      // Handle errors like network failure
      print('Error: $e');
    }
  }

 /* Future<void> clearLoginTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('login_time');
  }

  */
}
