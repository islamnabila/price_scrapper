import 'package:flutter/material.dart';
import 'package:price_scrapper/screen/widget/card.dart';

class AnimatedImage extends StatefulWidget {
  final String imagePath;

  const AnimatedImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 6),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(5, 0), // Start from right
      end: Offset(-5, 0), // Move to left
    ).animate(_controller);

    // Repeat the animation indefinitely
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        margin: EdgeInsets.all(8),
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(widget.imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "Price Scraper",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    AnimatedImage(imagePath: 'assets/images/startech.png'),
                    AnimatedImage(imagePath: 'assets/images/techland.png'),
                    AnimatedImage(imagePath: 'assets/images/skyland.jpg'),
                  ],
                ),
                SizedBox(height: 15,),
                textFormField,
                SizedBox(height: 25,),
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.13,
                    child: ElevatedButton(onPressed: (){}, child: Text("Search", style: TextStyle(fontSize: 18),),
                    ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                      itemBuilder: (context, index){
                        return NewtaskCardItem();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField get textFormField {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade800,),
          hintText: "Enter Product Keyword",
          hintStyle: TextStyle(color: Colors.grey.shade800),
          filled: true,
          fillColor: Colors.grey.shade300,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)
          )
      ),
    );
  }
}