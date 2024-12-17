// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/config/style/text_styles.dart';
import 'package:pos_flutter/core/components/contact_dialog_form.dart';
import 'package:pos_flutter/core/utils/strings/app_strings.dart';
import 'package:pos_flutter/modules/home/data/models/contact_model/contact_model.dart';
import 'package:search_choices/search_choices.dart';

class HomeContactDropdownMenu extends StatefulWidget {
  String title;
  List<ContactModel> contacts;
  final Function onChanged;
  final Function searchFn;

  HomeContactDropdownMenu({
    super.key,
    required this.title,
    required this.contacts,
    required this.onChanged,
    required this.searchFn,
  });

  @override
  State<HomeContactDropdownMenu> createState() =>
      _HomeContactDropdownMenuState();
}

class _HomeContactDropdownMenuState extends State<HomeContactDropdownMenu> {
  ContactModel? selectedContact;
  @override
  void initState() {
    selectedContact = widget.contacts.last;
    widget.onChanged(selectedContact);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<dynamic>> dropdownMenuItems =
        widget.contacts.map((contact) {
      return DropdownMenuItem<ContactModel>(
        value: contact,
        child: Center(
          child: Text(contact.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.cairoSemiBold15Grey),
        ),
      );
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                widget.title,
                style: AppTextStyle.cairoSemiBold16Red,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.25,
              child: Center(
                child: SearchChoices.single(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  
                  searchFn: widget.searchFn,
                  underline: const SizedBox(),
                  icon: const SizedBox(),
                  displayClearIcon: false,
                  items: dropdownMenuItems,
                  value: selectedContact,
                  autofocus: false,
                  rightToLeft: true,
                  searchHint:
                      "${AppStrings.searchfor} ${AppStrings.contactName}",
                  onChanged: (value) {
                    widget.onChanged(value);
                    setState(() {
                      selectedContact = value;
                    });
                  },
                ),
              ),
            ),
            IconButton(
                onPressed: () => showContactDialogForm(context),
                icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
