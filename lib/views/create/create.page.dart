import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:nfc_data_logger/global_widgets/base_view.dart';
import 'package:nfc_data_logger/views/create/create.vm.dart';
import 'package:stacked/stacked.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateViewModel>.reactive(
      viewModelBuilder: () => CreateViewModel(),
      onViewModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return BaseView(
          title: "Add New NFC Tag",
          body: Center(
            child: AvatarGlow(
              animate: model.isLoading,
              glowColor: Theme.of(context).primaryColor,
              duration: const Duration(milliseconds: 2000),
              repeat: true,
              child: GestureDetector(
                onTap: () {
                  model.discover();
                },
                behavior: HitTestBehavior.opaque,
                child: const CircleAvatar(
                  radius: 60,
                  child: Text(
                    "Discover NFC Tag",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
