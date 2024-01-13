import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewtaskCardItem extends StatefulWidget {
  final Map<String, dynamic> productData;
  const NewtaskCardItem({
    super.key, required this.productData,

  });
  @override
  State<NewtaskCardItem> createState() => _NewtaskCardItemState();
}

class _NewtaskCardItemState extends State<NewtaskCardItem> {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.productData['productName'] ?? 'Product Name Not Found',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),


            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade700,
                    ),
                    child:
                    Text(
                      "Price:${widget.productData['price'] ?? 'N/A'}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                ),

                // Container(
                //     padding: const EdgeInsets.all(8),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.red
                //     ),
                //     child: Text(widget.productData['minSitename'] == widget.productData['siteName']
                //         ? 'Lowest Price'
                //         : "Not found", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                // ),

                if (widget.productData['siteName'] == widget.productData['minSitename'])
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Text(
                      'Lowest Price: ${widget.productData['lowestPrice'] ?? 'N/A'}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )else
                    Container(),
              ],
            ),
            SizedBox(height: 10,),
            RichText(text: TextSpan(
                style: TextStyle(color: Colors.black,  fontSize: 18),
              children: [
                TextSpan(
                  text: "Availability: ",
                ),
                TextSpan(
                  text: widget.productData['availability'] ?? 'N/A',style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)
                )
              ]
            )),
            SizedBox(height: 10,),
            Text("From: ${widget.productData['siteName'] ?? 'Site Not Found'}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product URL: ", style: TextStyle(fontSize: 17),),
                GestureDetector(
                    onTap: () {
                      _launchURL(widget.productData['productUrl']);
                    },
                    child: Text(
                      "${widget.productData['productUrl'] ?? 'N/A'}",
                      style: TextStyle(fontSize: 17,
                      color: Colors.blue, decoration: TextDecoration.underline),))
              ],
            )

          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}