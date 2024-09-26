import 'package:flutter/material.dart';
import 'package:parent_internet_lock/common/styles/spacing_styles.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

import '../../../../common/widgets/pinput_widget/pinput_widget_with_title.dart';
import '../../../../utils/constants/text_strings.dart';

class ConfirmPinScreen extends StatelessWidget {
  const ConfirmPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: PSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            /// Enter PIN Image
            Image(image: AssetImage(PImages.enterOtp)),
            SizedBox(height: 30.0),

            /// Enter PIN
            PPinputWidgetWithTitle(title: PTexts.enterNewPIN),
            SizedBox(height: 20.0),

            /// Confirm PIN
            PPinputWidgetWithTitle(title: PTexts.confirmPIN),
          ],
        ),
      ),
    );
  }
}
