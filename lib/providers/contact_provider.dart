import 'dart:convert';
import 'dart:io';

import 'package:contactlist/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactProvider with ChangeNotifier {
  // store contacts from internet
  List<dynamic> apiContact = [];
  List<dynamic> get apiContacts => apiContact;
  // store contact to a list of favorite
  List<ContactModel> favContact = [];
  List<ContactModel> get favContacts => favContact;
  //**
  // method to fetch contact from internet
  //* @return null
  Future<void> fectchContact() async {
    try {
      final resp = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (resp.statusCode == 200) {
        // decode the response data
        final jsonData = jsonDecode(resp.body);
       // print(jsonData);
        // loop through the data and store in apicontact list
        for (var data in jsonData) {
          apiContact.add(ContactModel(
            name: data["name"],
            email: data['email'],
            phone: data['phone'],
            address: data['address']['city'] +
                "," +
                data['address']['street'] +
                "," +
                data['address']['suite'],
            webSite: data['website'],
            id: data['id'],
          ));
        }
        // print(apiContact);
      } else {
       print("could notfetch data from the internet");
      }
    } on SocketException {
      // return a sneakerBar with a message, no internet access
    }
    notifyListeners();
  }
}
