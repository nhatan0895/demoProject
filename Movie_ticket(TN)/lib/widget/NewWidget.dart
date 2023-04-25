import 'package:flutter/material.dart';
import 'package:project/models/product.dart';
import 'package:project/pages/DetailMovies.dart';
import 'package:project/widget/Selectmovie2.dart';

class NewWidget extends StatefulWidget {
  NewWidget(this.title, this.movies, {Key? key}) : super(key: key);
  String? title;
  List<Product> movies;
  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Tất cả",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 1.0,
          ),
          Container(
            height: 310.0,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (context, index) => Selectmovie2(
                widget.movies[index],
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailMovies(widget.movies[index])));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
