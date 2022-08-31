import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth_screens/widgets/login_button.dart';
import '../../auth_screens/widgets/text_form_field.dart';
import '../new_inventory.dart';
import '../widget/search_input.dart';

class NewMeasure extends ConsumerStatefulWidget {
  const NewMeasure({Key? key}) : super(key: key);

  @override
  ConsumerState<NewMeasure> createState() => _NewMeasureState();
}

class _NewMeasureState extends ConsumerState<NewMeasure> {
  final searchController = TextEditingController();
  final unitMeasureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(children: [
          SearchTextField(
            searchContent: searchController,
            hintTexts: 'Search unit',
            fieldIcon: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => DialogBox.dialogBox(
                  Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CustomFormField(
                              validators: (value) {},
                              hintText: 'Name',
                              fieldController: unitMeasureController,
                              isShown: false),
                          LoginButton(text: 'Create Measure', actionField: (){Navigator.pop(context);})
                        ],
                      )),
                  context,
                  0.15),
              color: Colors.grey,
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
          )
        ]));
  }
}
