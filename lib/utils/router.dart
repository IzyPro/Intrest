import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intrests/styles/app_colors.dart';
import 'package:intrests/utils/const.dart';
import 'package:intrests/views/home.dart';
import 'package:intrests/views/widgets/button.dart';

abstract class Routes {
  static const home = "/home";
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  var args = settings.arguments;
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute<dynamic>(
          builder: (context) => Home(), settings: settings);

    default:
      return unknownRoutePage(settings.name!);
  }
}

PageRoute unknownRoutePage(String routeName) => MaterialPageRoute(
      builder: (ctx) => Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: generalHorizontalPadding, vertical: ySpace2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.hourglass_empty),
              const SizedBox(height: ySpace2 - 4),
              Text('Oops,\n\nLooks like this page is in development',
                  textAlign: TextAlign.center,
                  style: Theme.of(ctx)
                      .primaryTextTheme
                      .headline3
                      ?.copyWith(color: AppColors.black)),
              const SizedBox(height: ySpace3 + ySpace1 - 5),
              if (kDebugMode)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Text(
                    routeName == "/"
                        ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                        : 'Route name $routeName is not found!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              CustomButton(
                  actionText: 'Go back', onTap: () => Navigator.of(ctx).pop())
            ],
          ),
        ),
      ),
    );
