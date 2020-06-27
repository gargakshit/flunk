import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_viewmodel.dart';
import '../../constants/colors.dart';
import '../../widgets/parallelogram_button.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (model) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Fl",
                    style: TextStyle(
                      color: gradient1Left,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "unk",
                    style: TextStyle(
                      color: gradient1Right,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              ParallelogramButton(
                onTap:
                    model.isLoading ? null : () => model.authenticate(context),
                width: 280,
                child: model.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SIGNIN ",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15.0,
                              letterSpacing: 2,
                            ),
                          ),
                          Text(
                            "WITH GITHUB",
                            style: TextStyle(
                              fontSize: 15.0,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
