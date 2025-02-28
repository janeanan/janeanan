import 'package:flutter/material.dart';
import 'package:janeanan/component/shimmer_load.dart';
import 'package:janeanan/extension/space_extension.dart';


class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index) {
            return  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                        children: [
                          const CircleAvatar(
                            radius: 20,
                           child: ShimmerLoad(),
                          ),
                          5.sBoxHeight,
                          ShimmerLoad(width: MediaQuery.of(context).size.width*0.5),
                          ShimmerLoad(width: MediaQuery.of(context).size.width*0.7,),
                          ShimmerLoad(width: MediaQuery.of(context).size.width*0.8,),
                          ShimmerLoad(width: MediaQuery.of(context).size.width*0.9,),
                        ],
                      ),
                    ),
                  );
          }
        );
  }
}