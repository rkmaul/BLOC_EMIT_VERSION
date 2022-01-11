import 'package:flutter/material.dart';
import 'package:majootestcase/models/movie_response.dart';
import 'package:majootestcase/ui/home/widget/movie_detail_widget.dart';
import 'package:majootestcase/utils/text_styles.dart';

class MoveItemWidget extends StatefulWidget {
  final Data? data;
  const MoveItemWidget({Key? key, this.data}) : super(key: key);

  @override
  _MoveItemWidgetState createState() => _MoveItemWidgetState();
}

class _MoveItemWidgetState extends State<MoveItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(25),
                child: Image.network(widget.data!.i!.imageUrl!),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  widget.data!.l!,
                  textDirection: TextDirection.ltr,
                  style: normalFont14Bold,
                ),
              )
            ],
          ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => MovieDetailWidget(
                      data: widget.data,
                    )),
          );
        },
      ),
    );
  }
}
