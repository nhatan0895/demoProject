import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFF292B37),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(
          Icons.search,
          color: Colors.white54,
          size: 30,
        ),
        Container(
          width: 250,
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Nhập tên phim bạn cần tìm",
              hintStyle: TextStyle(color: Colors.white54),
            ),
          ),
        ),
        const Icon(
          Icons.mic,
          color: Colors.white54,
          size: 30,
        ),
      ]),
    );
  }
}
