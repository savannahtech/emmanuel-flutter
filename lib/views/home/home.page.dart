import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:nfc_data_logger/global_widgets/base_view.dart';
import 'package:nfc_data_logger/global_widgets/infinite_scroll_view.dart';
import 'package:nfc_data_logger/utils/navigate.dart';
import 'package:nfc_data_logger/views/create/create.page.dart';
import 'package:nfc_data_logger/views/home/widgets/nfc_tile.dart';
import 'package:stacked/stacked.dart';
import 'home.vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return BaseView(
          title: "Home",
          fab: FloatingActionButton(
            onPressed: () {
              Navigate.to(const CreatePage(), fullscreenDialog: true);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                bool isDark = Theme.of(context).brightness == Brightness.dark;
                EasyDynamicTheme.of(context).changeTheme(
                  dark: isDark ? false : true,
                );
              },
              icon: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
              ),
            ),
          ],
          body: InfiniteScrollView(
            data: model.data,
            itemBuilder: (_, i) {
              return NfcTile(
                data: model.data[i],
                index: i,
              );
            },
            isLoading: model.listLoading,
          ),
        );
      },
    );
  }
}
