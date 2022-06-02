import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intrests/providers/provider.dart';
import 'package:intrests/utils/const.dart';
import 'package:intrests/views/widgets/button.dart';
import 'package:intrests/views/widgets/custom_field.dart';
import 'package:intrests/views/widgets/dialogs.dart';
import 'package:intrests/views/widgets/interest_frame.dart';
import 'package:intrests/views/widgets/success_bottom_sheet.dart';

class Home extends ConsumerWidget {
  TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModel);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ySpace3,
            ),
            Text(
              'Interests',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline3
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: ySpaceMin,
            ),
            Text(
              'Select a minimum of 3 interests and a maximum of 7 interests.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4
                  ?.copyWith(color: Theme.of(context).disabledColor),
            ),
            SizedBox(
              height: ySpace3,
            ),
            CustomField(
              hint: 'Search',
              controller: _search,
              hintstyle: Theme.of(context).primaryTextTheme.headline4?.copyWith(
                  color: Theme.of(context).disabledColor.withOpacity(0.5)),
              fillColor: Theme.of(context).disabledColor.withOpacity(0.2),
            ),
            SizedBox(
              height: ySpace3,
            ),
            ValueListenableBuilder<TextEditingValue>(
                valueListenable: _search,
                builder: (_, value, child) {
                  return Wrap(
                      children: value.text.isEmpty
                          ? _viewModel.unSelected
                              .map((e) => InterestFrame(interest: e))
                              .toList()
                          : _viewModel.unSelected
                              .where((e) => e.name
                                  .toLowerCase()
                                  .contains(_search.text.toLowerCase()))
                              .map((e) => InterestFrame(interest: e))
                              .toList());
                }),
            SizedBox(
              height: ySpace3,
            ),
            Text(
              'Selected',
              style: Theme.of(context).primaryTextTheme.headline4,
            ),
            SizedBox(
              height: ySpace1,
            ),
            Visibility(
              visible: _viewModel.selected.isEmpty,
              child: Center(
                child: Text(
                  'No interest selected',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4
                      ?.copyWith(color: Theme.of(context).disabledColor),
                ),
              ),
            ),
            Wrap(
                children: _viewModel.selected
                    .map((e) => InterestFrame(interest: e))
                    .toList()),
            SizedBox(
              height: ySpace3,
            ),
            CustomButton(
              actionText: 'Next',
              onTap: () {
                DialogWidgets.modalBottomSheetMenu(
                    context,
                    const CustomSuccessfulBottomSheet(
                      message:
                          'Success!\nYour interest was saved successfully.',
                      showRedirectMessage: true,
                    ));
                return _viewModel.reset();
              },
              disabled: _viewModel.selected.length > 7 ||
                  _viewModel.selected.length < 3,
            )
          ],
        ),
      )),
    ));
  }
}
