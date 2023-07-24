import 'package:find_scan_return_web/app/di.dart';
import 'package:find_scan_return_web/presentation/qrcode/bloc/qr_bloc.dart';
import 'package:find_scan_return_web/presentation/resources/assets_manager.dart';
import 'package:find_scan_return_web/presentation/resources/color_manager.dart';
import 'package:find_scan_return_web/presentation/resources/size_config.dart';
import 'package:find_scan_return_web/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_web/presentation/resources/style_constants.dart';
import 'package:find_scan_return_web/presentation/widgets/inputFields/input_widgets.dart';
import 'package:flutter/material.dart';

void showDialogToGenerateQr(BuildContext context) {
  TextEditingController editingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final QrBloc qrBloc = sl<QrBloc>();
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), // Set the border radius
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20),
            child: Scaffold(
              body: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(2),
                    ),
                    SizedBox(
                        height: getProportionateScreenHeight(150),
                        width: getProportionateScreenWidth(150),
                        child: Image.asset(ImageAssets.findScanReturnQr)),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      AppStrings.enterTheNumberOfQr,
                      style: labelStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(12),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: InputFields(
                        inputController: editingController,
                        isRequired: true,
                        inputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    MaterialButton(
                      minWidth: getProportionateScreenWidth(150),
                      color: ColorManager.primary,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          qrBloc.add(CreateQrEvent(
                              numberOfQrcodes:
                                  int.parse(editingController.text)));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text(
                        AppStrings.createQr,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
