import 'package:flutter/material.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/config/style/text_styles.dart';
import 'package:pos_flutter/config/validationform.dart';
import 'package:pos_flutter/core/components/app_textfield.dart';
import 'package:pos_flutter/core/utils/strings/app_strings.dart';
import 'package:pos_flutter/core/widgets/button_1.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/contact_cubit/contact_cubit.dart';

void showContactDialogForm(BuildContext context) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController contactMobileController = TextEditingController();
  final TextEditingController carNumberController = TextEditingController();
  final TextEditingController carModelController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final ContactCubit contactCubit = ContactCubit.get(context);
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: ContactDialogFormContent(
          formKey: formKey,
          contactNameController: contactNameController,
          contactMobileController: contactMobileController,
          carNumberController: carNumberController,
          carModelController: carModelController,
          companyNameController: companyNameController,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          AppSingleButton(
            height: 50,
            width: MediaQuery.of(context).size.width / 2.5,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                contactCubit.addContact(
                    name: contactNameController.text,
                    mobile: contactMobileController.text,
                    companyName: companyNameController.text,
                    carNumber: carNumberController.text,
                    carModel: carModelController.text);
                Navigator.pop(context);
                contactNameController.clear();
                contactMobileController.clear();
                carNumberController.clear();
                carModelController.clear();
                companyNameController.clear();
              }
            },
            text: AppStrings.save,
            color: AppColors.green,
          ),
          AppSingleButton(
            height: 50,
            width: MediaQuery.of(context).size.width / 2.5,
            onPressed: () => Navigator.pop(context),
            text: AppStrings.cancel,
            color: AppColors.red,
          ),
        ],
      );
    },
  );
}

class ContactDialogFormContent extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController contactNameController;
  final TextEditingController contactMobileController;
  final TextEditingController carNumberController;
  final TextEditingController carModelController;
  final TextEditingController companyNameController;
  const ContactDialogFormContent({
    super.key,
    required this.formKey,
    required this.contactNameController,
    required this.contactMobileController,
    required this.carNumberController,
    required this.carModelController,
    required this.companyNameController,
  });

  @override
  State<ContactDialogFormContent> createState() =>
      _ContactDialogFormContentState();
}

class _ContactDialogFormContentState extends State<ContactDialogFormContent> {
  String type = AppStrings.individuals;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10.0,
          children: [
            paymentRadioButton(),
            AppTextFormField(
              hintText: AppStrings.contactName,
              isCustom: true,
              controller: widget.contactNameController,
              validator: ValidationForm.nameValidator,
            ),
            AppTextFormField(
              hintText: AppStrings.phoneNumber,
              isCustom: true,
              textInput: TextInputType.number,
              controller: widget.contactMobileController,
              validator: ValidationForm.phoneValidator,
            ),
            if (type == AppStrings.companies)
              AppTextFormField(
                hintText: AppStrings.companyName,
                isCustom: true,
                controller: widget.companyNameController,
              ),
            AppTextFormField(
              hintText: AppStrings.carNumber,
              isCustom: true,
              controller: widget.carNumberController,
              validator: ValidationForm.carNumberValidator,
            ),
            AppTextFormField(
              hintText: AppStrings.carModel,
              isCustom: true,
              controller: widget.carModelController,
              validator: ValidationForm.carModelValidator,
            ),
          ],
        ),
      ),
    );
  }

  Row paymentRadioButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      RadioMenuButton(
        value: AppStrings.individuals,
        groupValue: type,
        onChanged: (index) {
          setState(() {
            type = AppStrings.individuals;
          });
        },
        child: Text(AppStrings.individuals,
            style: AppTextStyle.cairoSemiBold15black),
      ),
      RadioMenuButton(
        value: AppStrings.companies,
        groupValue: type,
        onChanged: (index) {
          setState(() {
            type = AppStrings.companies;
          });
        },
        child: Text(AppStrings.companies,
            style: AppTextStyle.cairoSemiBold15black),
      ),
    ]);
  }
}
