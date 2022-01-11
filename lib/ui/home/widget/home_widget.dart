import 'package:flutter/material.dart';
import 'package:majootestcase/models/movie_response.dart';
import 'package:majootestcase/ui/home/widget/movie_item_widget.dart';

class HomeWidget extends StatelessWidget {
  final List<Data>? data;

  const HomeWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, index) {
          return MoveItemWidget(data: data![index]);
        },
      ),
    );
  }
}
