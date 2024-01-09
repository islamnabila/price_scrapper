import 'package:flutter/material.dart';

class NewtaskCardItem extends StatefulWidget {
  const NewtaskCardItem({
    super.key,
  });
  @override
  State<NewtaskCardItem> createState() => _NewtaskCardItemState();
}

class _NewtaskCardItemState extends State<NewtaskCardItem> {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 50,
                width: 100,
                child: Image.asset("assets/images/skyland.jpg")),
            const SizedBox(height: 10,),
            Text(
              "Product Name",
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
                    child: Text("Price:", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange
                    ),
                    child: Text("Lowest Price!", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                ),
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
                  text: "In Stock",style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)
                )
              ]
            )),
            SizedBox(height: 10,),
            Text("From: TechLand", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Product URL:", style: TextStyle(fontSize: 17),)

          ],
        ),
      ),
    );
  }
}