import 'package:ecommerce_flutter/modals/category_modals.dart';
import 'package:flutter/material.dart';

class HeroCoursel extends StatelessWidget {
  final Category category;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  HeroCoursel({required this.category});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/catalog', arguments: category);
      },
      child: Container(
        // ignore: prefer_const_constructors
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(category.imgUrl,
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      // ignore: prefer_const_constructors
                      gradient: LinearGradient(
                        // ignore: prefer_const_literals_to_create_immutables
                        colors: [
                          // ignore: prefer_const_constructors
                          Color.fromARGB(200, 0, 0, 0),
                          // ignore: prefer_const_constructors
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        // ignore: prefer_const_constructors
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(category.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
