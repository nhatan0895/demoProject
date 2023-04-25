import 'package:flutter/material.dart';
import 'package:toy_app/representation/data/product.dart';

class Lego extends StatefulWidget {
  Lego(this.title, this.lego, {Key? key}) : super(key: key);
  String? title;
  List<Product> lego;

  @override
  State<Lego> createState() => _LegoState();
}

class _LegoState extends State<Lego> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title!,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w600)),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Tất cả",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 230,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.lego.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 165,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image:
                                  AssetImage(widget.lego[index].productImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.lego[index].productName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.lego[index].productPrice}K/ VNĐ',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 4),
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.blueGrey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child: Text(
                                              'Small',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                          Expanded(
                                            child: Icon(Icons.arrow_drop_down,
                                                size: 20, color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.blueGrey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child: Icon(Icons.remove_circle,
                                                size: 20, color: Colors.green),
                                          ),
                                          Center(
                                            child: Text(
                                              '1',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                          Expanded(
                                            child: Icon(Icons.add_circle,
                                                size: 20, color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
