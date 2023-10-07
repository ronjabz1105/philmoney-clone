import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RemittanceHistoryHolderScreen extends StatelessWidget {
  RemittanceHistoryHolderScreen({Key? key, required this.listCount})
      : super(key: key);
  int listCount;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.blueGrey.withOpacity(0.5),
      child: ListView.builder(
          itemCount: listCount,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        _buildContainerForShimmering(80, 80),
                        _buildContainerForShimmering(10, 70)
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      _buildContainerForShimmering(10, 70),
                      _buildContainerForShimmering(10, 100),
                      _buildContainerForShimmering(10, 70),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildContainerForShimmering(10, 80),
                      _buildContainerForShimmering(10, 70),
                      _buildContainerForShimmering(10, 100),
                      _buildContainerForShimmering(10, 70),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

Widget _buildContainerForShimmering(
  double height,
  double width,
) {
  return Container(
    margin: const EdgeInsets.only(top: 5, right: 10),
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.2),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),
  );
}
