import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  Function(String)? searchingContent;

  SearchTextField({this.searchingContent, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
              onChanged: searchingContent,
              decoration: const InputDecoration(
                filled: true,
                hintText: 'Search product',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.grey)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 20,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide.none),
              )),
        ),
      ),
    );
  }
}
