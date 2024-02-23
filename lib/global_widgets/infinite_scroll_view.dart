import '../../config/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../constants/assets.dart';
import 'package:velocity_x/velocity_x.dart';

import 'empty_state.dart';
import 'generic_loading_grid_widget.dart';
import 'generic_loading_widget.dart';

class InfiniteScrollView extends StatefulWidget {
  final List data;
  final bool isList;
  final IndexedWidgetBuilder itemBuilder;
  final SliverGridDelegate? gridDelegate;
  final RefreshCallback? onScrollEnd;
  final bool isLoading;
  final RefreshCallback? onRefresh;
  final bool shrinkWrap;
  final String? emptyMessage;
  final String? emptyImage;
  final Widget? emptyWidget;
  final Widget? separatorWidget;
  final Widget? loadingWidget;

  const InfiniteScrollView({
    super.key,
    required this.data,
    this.isList = true,
    required this.itemBuilder,
    this.gridDelegate,
    this.onScrollEnd,
    this.isLoading = false,
    this.onRefresh,
    this.shrinkWrap = true,
    this.emptyMessage = "No data to show",
    this.emptyImage = AppImages.empty,
    this.emptyWidget,
    this.separatorWidget,
    this.loadingWidget,
  });

  @override
  State<InfiniteScrollView> createState() => _InfiniteScrollViewState();
}

class _InfiniteScrollViewState extends State<InfiniteScrollView> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  void _loadMore() async {
    if (widget.onScrollEnd != null) {
      setState(() => isLoading = true);
      await widget.onScrollEnd!();
      setState(() => isLoading = false);
    }
  }

  bool onScrollEnd(ScrollNotification notification) {
    if (notification is UserScrollNotification) {
      if (notification.direction == ScrollDirection.forward) {
        // Handle scroll down.
      } else if (notification.direction == ScrollDirection.reverse) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent * 0.6) {
          _loadMore();
        }
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final view = _buildView(context);

    return NotificationListener(
      onNotification: onScrollEnd,
      child: widget.onRefresh == null
          ? view
          : RefreshIndicator(
              onRefresh: widget.onRefresh!,
              color: Theme.of(context).primaryColor,
              child: view,
            ),
    );
  }

  Widget _buildView(context) {
    if (!widget.isLoading && widget.data.isEmpty) {
      // Show Empty State
      return _buildEmptyView();
    } else {
      if (widget.isList) {
        return _buildList();
      } else {
        return _buildGrid();
      }
    }
  }

  Widget _buildGrid() {
    return GridView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: widget.isLoading || isLoading
          ? widget.data.length + 3
          : widget.data.length,
      gridDelegate: widget.gridDelegate!,
      itemBuilder: (context, index) {
        if (index == widget.data.length ||
            index == widget.data.length + 1 ||
            index == widget.data.length + 2) {
          return widget.loadingWidget != null
              ? VxShimmer(
                  primaryColor: Colors.grey[300]!,
                  secondaryColor: Colors.grey[50],
                  child: widget.loadingWidget!,
                )
              : const VxSkeleton().loadingWidget(
                  isLoading: true,
                  loader: const GenericLoadingGridWidget(),
                );
        }
        return widget.itemBuilder(context, index);
      },
      padding:
          const EdgeInsets.only(left: 1.0, right: 1.0, bottom: 50.0, top: 20.0),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      shrinkWrap: widget.shrinkWrap,
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: widget.isLoading || isLoading
          ? widget.data.length + 1
          : widget.data.length,
      itemBuilder: (context, index) {
        if (index == widget.data.length) {
          return ListView.separated(
            itemCount: 3,
            itemBuilder: (_, __) => widget.loadingWidget != null
                ? VxShimmer(
                    primaryColor: Colors.grey[300]!,
                    secondaryColor: Colors.grey[50],
                    child: widget.loadingWidget!,
                  )
                : const VxSkeleton().loadingWidget(
                    isLoading: true,
                    loader: const GenericLoadingWidget(),
                  ),
            shrinkWrap: true,
            primary: false,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
          );
        }
        return widget.itemBuilder(context, index);
      },
      separatorBuilder: (_, __) =>
          widget.separatorWidget ?? const SizedBox(height: 20),
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
    );
  }

  Widget _buildEmptyView() {
    return ListView(
      children: <Widget>[
        LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.minWidth * 1.5,
              child: EmptyState(
                message: widget.emptyMessage!,
                image: widget.emptyImage!,
              ),
            );
          },
        )
      ],
    );
  }
}
