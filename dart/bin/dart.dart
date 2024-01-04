import 'package:dart/dart.dart' as dart;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() async {
  // Gửi request POST để thêm khách hàng
  await addCustomer();

  // Gửi request GET để lấy danh sách khách hàng
  await getAllCustomers();
}

Future<void> addCustomer() async {
  final url = Uri.parse('http://localhost:8080/api/customers/add');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'fullName': 'John Doe 3',
    'birthday': '1990-01-02',
    'address': '123 Main St 3',
    'phoneNumber': '1234567893'
  });

  try {
    final response = await http.post(url, headers: headers, body: body);
    print('Add Customer Response: ${response.statusCode}');
  } catch (e) {
    print('Error adding customer: $e');
  }
}

Future<void> getAllCustomers() async {
  final url = Uri.parse('http://localhost:8080/api/customers/getAll');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> customers = jsonDecode(response.body);
      print('All Customers:');
      for (var customer in customers) {
        print(' - ${customer['fullName']}, ${customer['birthday']}, ${customer['address']}, ${customer['phoneNumber']}');
      }
    } else {
      print('Error getting customers. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error getting customers: $e');
  }
}
