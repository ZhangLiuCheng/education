import 'dart:math';

import 'package:flutter/widgets.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
    SliverHeaderDelegate({
        @required this.minHeight,
        @required this.maxHeight,
        @required this.child,
    });

    final double minHeight;
    final double maxHeight;
    final Widget child;

    @override
    double get minExtent => minHeight;

    @override
    double get maxExtent => max(maxHeight, minHeight);

    @override
    Widget build(BuildContext context, double shrinkOffset,
        bool overlapsContent) {
        return child;
    }

    @override
    bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
        return maxHeight != oldDelegate.maxHeight ||
            minHeight != oldDelegate.minHeight ||
            child != oldDelegate.child;
    }
}
