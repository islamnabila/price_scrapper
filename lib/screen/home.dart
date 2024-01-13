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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageWidget(image:"https://www.startech.com.bd/image/catalog/logo.png"),
                      ImageWidget(image:"https://www.techlandbd.com/image/cache/wp/gp/techland/logo/techland-white-logo-300x48.webp"),
                      ImageWidget(image: "https://www.skyland.com.bd/image/cache/catalog/skyland-logo-200x42.png.webp"),

                      // AnimatedImage(imagePath: 'assets/images/startech.png'),
                      // AnimatedImage(imagePath: 'assets/images/techland.png'),
                      // AnimatedImage(imagePath: 'assets/images/skyland.jpg'),
                    ],
                  ),
                  SizedBox(
                    height: 24,
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
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
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
                  isLoading
                      ? CircularProgressIndicator()
                  : Expanded(
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
    setState(() {
      isLoading = true;
    });
    String apiUrl = "https://price-scrapper-backend.onrender.com/api/v1/scrape/$keyword";
    NetworkResponse response = await _networkCaller.getRequest(apiUrl);
    print("API Response: ${response.jsonResponse}");

    setState(() {
      isLoading = false;
    });
    if (response.isSuccess) {
      setState(() {
        var searchDataMap = response.jsonResponse['data'];
        searchData = [];
        searchDataMap.forEach((key, value) {
          searchData.add(value);
        });
      });
      _searchController.clear();
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

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key, required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(left: 2, right: 2),
        height: 50,
          width: 80,
          decoration: BoxDecoration(
            color:Color.fromRGBO(52,58,64, 1),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Image.network(image)),
    );
  }
}

