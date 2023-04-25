import 'package:flutter/material.dart';
import 'package:toy_app/representation/data/product.dart';

class Model extends StatefulWidget {
  Model(this.title, this.models, {Key? key}) : super(key: key);
  String? title;
  List<Product> models;

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
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
              itemCount: widget.models.length,
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
                                  AssetImage(widget.models[index].productImage),
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
                                widget.models[index].productName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.models[index].productPrice}K/ VNĐ',
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
