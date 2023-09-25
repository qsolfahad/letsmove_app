import 'package:flutter/material.dart';

import '../../../model/data/constant.dart';
import 'header.dart';

class CardList extends StatefulWidget {
  final List<Map> items;
  final title;
  const CardList({super.key, required this.items, this.title});

  @override
  State<CardList> createState() => _CardListState();
}
 List<bool> _selected = List.generate(6, (index) => false);
 
class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
        header(widget.title),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 20),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5.0,
                    color: _selected[index] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(
                        cardOption[index],
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: _selected[index] ? Colors.white : Colors.black,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selected = List.generate(6, (index) => false);
                          _selected[index] = !_selected[index];
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
