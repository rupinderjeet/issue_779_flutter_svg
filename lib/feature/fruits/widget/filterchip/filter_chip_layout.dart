import 'package:flutter/material.dart';
import 'package:great_list_view/great_list_view.dart';

import 'filter_chip.widget.dart';

class FilterChipItem {
  FilterChipItem({
    required this.text,
    required this.action,
  });

  final String text;
  final VoidCallback action;
}

class FilterChipLayout extends StatefulWidget {
  const FilterChipLayout({
    Key? key,
    required this.items,
    this.listController,
    this.scrollController,
    this.margin,
  }) : super(key: key);

  final List<FilterChipItem> items;
  final AnimatedListController? listController;
  final ScrollController? scrollController;
  final EdgeInsets? margin;

  @override
  State<FilterChipLayout> createState() => _FilterChipLayoutState();
}

class _FilterChipLayoutState extends State<FilterChipLayout> {
  late AnimatedListController _listController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _listController = widget.listController ?? AnimatedListController();
    _scrollController = widget.scrollController ?? ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        margin: widget.margin,
        child: AutomaticAnimatedListView<FilterChipItem>(
          list: widget.items,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          comparator: AnimatedListDiffListComparator<FilterChipItem>(
              sameItem: (a, b) => a.text == b.text,
              sameContent: (a, b) => a.text == b.text),
          itemBuilder: (context, item, data) => _buildItem(item),
          listController: _listController,
          scrollController: _scrollController,
        ));
  }

  Widget _buildItem(FilterChipItem item) {
    return FilterChipWidget(
        title: item.text,
        iconPath: "assets/icon_cross_bold.svg",
        margin: const EdgeInsets.only(right: 8),
        onIconTap: () => item.action());
  }
}
