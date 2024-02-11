import 'package:e_mart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_mart/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:flutter/material.dart';

class PPrimartHeaderContainer extends StatelessWidget {
  const PPrimartHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PCurvedEdgeWidget(
      child: Container(
        color: PColors.primary,
        padding: const EdgeInsets.all(0),

        // .........sizedbox may be remoed further.............
        child: SizedBox(
          height: 400,

          
          child: Stack(
            children: [

              // .........Background Custom Shapes.......
              Positioned(
                top: -150,
                right: -250,
                child: PCircularContainer(
                  backgroundColor: PColors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: PCircularContainer(
                  backgroundColor: PColors.white.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
