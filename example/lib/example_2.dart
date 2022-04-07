import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Example02 extends StatelessWidget {
  // 14-16人
  // final List<int> _sizes = [
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  // ];

  // 11-13人
  // final List<int> _sizes = [
  //   2,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  // ];

  // 8-10人
  // final List<int> _sizes = [
  //   2,
  //   2,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  // ];

  // 5-7人
  // final List<int> _sizes = [
  //   2,
  //   2,
  //   2,
  //   1,
  //   1,
  // ];

  // 4人
  // final List<int> _sizes = [
  //   2,
  //   2,
  //   2,
  //   2,
  // ];

  // 3人
  // final List<int> _sizes = [
  //   2,
  //   2,
  //   2,
  // ];

  // 2人
  // final List<int> _sizes = [
  //   2,
  //   2,
  // ];

  final int _hostNum = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('example 02'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: _hostNum,
          itemBuilder: (BuildContext context, int index) => Container(
            color: Colors.green,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('${index + 1}'),
              ),
            ),
          ),
          staggeredTileBuilder: (int index) {
            // 特殊场景
            if (_hostNum == 2) {
              return const StaggeredTile.count(2, 4);
            } else if (_hostNum == 3) {
              if (index < 1) {
                return const StaggeredTile.count(2, 4);
              } else {
                return const StaggeredTile.count(2, 2);
              }
            } else if (_hostNum == 4) {
              return const StaggeredTile.count(2, 2);
            } else if (_hostNum > 4 && _hostNum < 8 ) {
              // 5-7人
              if (index < 3) {
                return const StaggeredTile.count(2, 2);
              } else {
                return const StaggeredTile.count(1, 1);
              }
            } else if (_hostNum > 7 && _hostNum < 11 ) {
              // 8-10人
              if (index < 2) {
                return const StaggeredTile.count(2, 2);
              } else {
                return const StaggeredTile.count(1, 1);
              }
            } else if (_hostNum > 10 && _hostNum < 14 ) {
              // 11-13人
              if (index < 1) {
                return const StaggeredTile.count(2, 2);
              } else {
                return const StaggeredTile.count(1, 1);
              }
            } else if (_hostNum > 13 && _hostNum < 17 ) {
              // 14-16人
              return const StaggeredTile.count(1, 1);
            } else {
              // 其他
              return const StaggeredTile.count(1, 1);
            }
          },
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
      ),
    );
  }
}
