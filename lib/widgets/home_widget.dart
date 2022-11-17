import 'package:contactlist/providers/contact_provider.dart';
import 'package:contactlist/screens/contact_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

  getContact() async => await context.read<ContactProvider>().fectchContact();
  @override
  Widget build(BuildContext context) {
    var Contactlists = Provider.of<ContactProvider>(context).apiContact;
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          // this renders the search input
          const Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: "Search contacts..."),
            ),
          ),
          const SizedBox(height: 10.0),
          // THIS will render a list of contacts
          Expanded(
            child: ListView.builder(
                itemCount: Contactlists.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const ContactScreen();
                      }));
                    },
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset("assets/images/rona.jpeg")),
                    title: Text(Contactlists[index].name),
                    subtitle: Text(Contactlists[index].phone),
                    trailing: const Icon(Icons.arrow_forward_rounded),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
