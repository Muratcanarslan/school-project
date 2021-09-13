import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> views;
  const TabBarWidget({
    required this.tabs,
    required this.views,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: selectedIndex,
      length: widget.tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: widget.tabs,
          controller: tabController,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
              tabController.animateTo(index);
            });
          },
        ),
        IndexedStack(
          children: <Widget>[
            for (int i = 0; i < widget.tabs.length; i++) ...{
              Visibility(
                child: widget.views[i],
                maintainState: true,
                visible: selectedIndex == i,
              ),
            }
          ],
          index: selectedIndex,
        ),
      ],
    );
  }
}
