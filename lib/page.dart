import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  Widget centreSection() {
    return Container(
      height: 300,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //每一行的列数
          mainAxisSpacing: 10, //主轴方向上的间距
          crossAxisSpacing: 10, //交叉轴轴方向上的间距
          childAspectRatio: 1.2, //子元素的宽高比例
        ),
        children: [
          CachedNetworkImage(
            imageUrl:
            "https://images.fineartamerica.com/images-medium-large-5/new-pittsburgh-emmanuel-panagiotakis.jpg",
            height: 120.0,
            width:100,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: EdgeInsets.all(10.0), child: centreSection()),
    );
  }
}
