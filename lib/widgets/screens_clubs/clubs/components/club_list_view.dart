import 'package:flutter/material.dart';
import 'package:movity_app/data/clubs.dart';
import 'package:movity_app/widgets/screens_clubs/clubs/components/club_index.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class ClubListView extends StatefulWidget {

  final ScrollController movieScrollController;
  final double movieItemWidth;

  ClubListView(this.movieScrollController,this.movieItemWidth);

  @override
  _ClubListViewState createState() => _ClubListViewState();
}

class _ClubListViewState extends State<ClubListView> {
  var clubData = ClubData();


  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 700),
      tween: Tween<double>(begin: 600, end: 0),
      curve: Curves.easeOutCubic,
      builder: (_,value, child) {
        return Transform.translate(
          offset: Offset(4, 0),
          child: child,
        );
      },
      child: Container(
        height: size.height * .8,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: ScrollSnapList(
            listController: widget.movieScrollController,
            onItemFocus: (item) {
            },
            itemSize: widget.movieItemWidth,
            padding: EdgeInsets.zero,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ClubIndex(index, widget.movieScrollController, widget.movieItemWidth);
            },
          ),
        ),
      ),
    );
  }
}
