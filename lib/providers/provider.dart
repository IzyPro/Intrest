import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intrests/viewmodels/home_vm.dart';

final homeViewModel = ChangeNotifierProvider.autoDispose<HomeViewModel>(
    (ref) => HomeViewModel(ref.read));
