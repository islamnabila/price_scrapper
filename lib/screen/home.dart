import 'package:flutter/material.dart';
import 'package:price_scrapper/screen/widget/animation.dart';
import 'package:price_scrapper/screen/widget/card.dart';

import '../Rest Api/network_caller.dart';
import '../Rest Api/network_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final NetworkCaller _networkCaller = NetworkCaller();
  List<Map<String, dynamic>> searchData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Price Scraper",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      AnimatedImage(imagePath: 'assets/images/startech.png'),
                      AnimatedImage(imagePath: 'assets/images/techland.png'),
                      AnimatedImage(imagePath: 'assets/images/skyland.jpg'),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.shade800,
                        ),
                        hintText: "Enter Product Keyword",
                        hintStyle: TextStyle(color: Colors.grey.shade800),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12))),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter Product name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.13,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _searchData(_searchController.text);
                        }
                      },
                      child: Text(
                        "Search",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: searchData.length,
                        itemBuilder: (context, index) {
                          return NewtaskCardItem(
                              productData: searchData[index]
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _searchData(String keyword) async {
    String apiUrl = "https://price-scrapper-backend.onrender.com/api/v1/scrape/A4 Tech";
    NetworkResponse response = await _networkCaller.getRequest(apiUrl);

    if (response.isSuccess) {
      setState(() {
        var searchDataMap = response.jsonResponse['data'];
        searchData = [
          searchDataMap['startech'],
          searchDataMap['techland'],
          searchDataMap['skyland'],
        ];
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text(response.errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

}
