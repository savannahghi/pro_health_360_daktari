// Flutter imports
import 'package:flutter/material.dart';

class PatientSearchResults extends StatelessWidget {
  const PatientSearchResults({
    required this.items,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (_, int index) {
                return GestureDetector(
                  child: items[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
