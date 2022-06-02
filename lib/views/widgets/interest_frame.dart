import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intrests/models/interests_model.dart';
import 'package:intrests/providers/provider.dart';
import 'package:intrests/utils/const.dart';

class InterestFrame extends ConsumerWidget {
  const InterestFrame({Key? key, required this.interest}) : super(key: key);
  final Interest interest;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModel);
    return InkWell(
      onTap: () => _viewModel.handleSelected(interest),
      child: Container(
        child: Text(
          interest.name,
          style: Theme.of(context).primaryTextTheme.headline4?.copyWith(
              color: _viewModel.selected.any((e) => e.id == interest.id)
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).canvasColor),
        ),
        padding: EdgeInsets.all(ySpaceMid),
        margin: EdgeInsets.all(ySpaceMin),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: _viewModel.selected.any((e) => e.id == interest.id)
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
          ),
        ),
      ),
    );
  }
}
