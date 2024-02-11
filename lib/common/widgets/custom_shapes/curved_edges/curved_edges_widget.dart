import 'package:e_mart/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class PCurvedEdgeWidget extends StatelessWidget {
  const PCurvedEdgeWidget({
    super.key, this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PCustomCurvedEdges(),
      child: child,
    );
  }
}