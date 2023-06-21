import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class UserRequestsView extends StatelessWidget {
  const UserRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(
        context,
        hasElevation: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: Column(
            children: [
              const PageHeader(title: 'My Requests', hasSearch: false),
              SizedBox(height: height(context) * 0.02),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return const RequestCard(
                      isUser: true,
                    );
                  })
            ],
          ),
        )),
      ),
    );
  }
}
