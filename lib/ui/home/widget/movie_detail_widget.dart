import 'package:flutter/material.dart';
import 'package:majootestcase/constant/constant.dart';
import 'package:majootestcase/models/movie_response.dart';
import 'package:majootestcase/utils/dynamic_space.dart';
import 'package:majootestcase/utils/text_styles.dart';

class MovieDetailWidget extends StatefulWidget {
  final Data? data;
  const MovieDetailWidget({Key? key, this.data}) : super(key: key);

  @override
  _MovieDetailWidgetState createState() => _MovieDetailWidgetState();
}

class _MovieDetailWidgetState extends State<MovieDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          PageText.movieDetailTex,
          style: normalFont16Bold,
        ),
      ),
      body: SingleChildScrollView(
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
            ),
            Text(
              widget.data!.year.toString(),
              textDirection: TextDirection.ltr,
              style: normalFont14Bold,
            ),
            DynamicSpace.verticalSpace16,
            widget.data!.series == null
                ? Container()
                : GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.data!.series!.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                                widget.data!.series![index].i!.imageUrl!),
                          ),
                          DynamicSpace.verticalSpace4,
                          Text(
                            widget.data!.series![index].l!,
                            textAlign: TextAlign.center,
                            style: normalFont12Black,
                          ),
                        ],
                      );
                    },
                  ),
            DynamicSpace.verticalSpace60,
          ],
        ),
      ),
    );
  }
}
