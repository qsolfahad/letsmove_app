import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  final List<Map> items;

  const CardList({super.key, required this.items});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<bool> selected = List.generate(6, (index) => false);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5.0,
            color: selected[index] ? Colors.blue : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              title: Text(
                'Lose Weight $index',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: selected[index] ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                setState(() {
                  selected = List.generate(6, (index) => false);
                  selected[index] = !selected[index];
                });
              },
            ),
          ),
        );
      },
    );
  }
}
