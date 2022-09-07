import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/product/unit_measure.dart';
import '../../../models/utilities/network_info.dart';
import '../../../providers/product/providers.dart';
import '../../auth_screens/widgets/login_button.dart';
import '../../auth_screens/widgets/text_form_field.dart';
import '../classes/snack_bars.dart';
import '../new_inventory.dart';
import '../widget/search_input.dart';

class NewMeasure extends ConsumerStatefulWidget {
  Function(UnitsOfMeasureModel unitsOfMeasureModel)? selectMeasureUnit;
  NewMeasure({this.selectMeasureUnit ,Key? key}) : super(key: key);

  @override
  ConsumerState<NewMeasure> createState() => _NewMeasureState();
}

class _NewMeasureState extends ConsumerState<NewMeasure> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  final unitMeasureController = TextEditingController();

  List<UnitsOfMeasureModel> listMeasures = [];

  void loadAllMeasures() {
    ref.read(unitMeasureProvider.notifier).allMeasure();
  }

  populateData() {
    var listOfMeasuresWatcher = ref.watch(unitMeasureProvider);
    listMeasures = listOfMeasuresWatcher.data ?? [];
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAllMeasures();
    });
  }

  @override
  Widget build(BuildContext context) {
    var allMeasuresViewer = ref.watch(unitMeasureProvider);

    ref.listen<NetworkInfo<List<UnitsOfMeasureModel>>>(unitMeasureProvider,
        (previous, next) {
      if (next.networkStatus == NetworkStatus.success) {
        populateData();
      }
    });

    return Container(
        margin: const EdgeInsets.all(10.0),
        child: allMeasuresViewer.networkStatus == NetworkStatus.loading
            ? Center(
                child: CircularProgressIndicator(color: Colors.green.shade400),
              )
            : allMeasuresViewer.networkStatus == NetworkStatus.success
                ? Column(children: [
                    SearchTextField(
                      searchContent: searchController,
                      hintTexts: 'Search units',
                      fieldIcon: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => DialogBox.dialogBox(
                            Container(
                                margin: const EdgeInsets.all(10.0),
                                child: Form(
                                  key: _formKey,
                                  child: ListView(
                                    children: [
                                      CustomFormField(
                                          validators: (value) {
                                            if (unitMeasureController.text ==
                                                '') {
                                              return "Enter measure name";
                                            }
                                            return null;
                                          },
                                          hintText: 'Name',
                                          fieldController:
                                              unitMeasureController,
                                          isShown: false),
                                      LoginButton(
                                          text: 'Create Measure',
                                          actionField: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              var createMeasureResponse = await ref.read(createUnitMeasureProvider.notifier).createMeasure(
                                                      UnitsOfMeasureModel(name: unitMeasureController.text));
                                              if (createMeasureResponse .networkStatus == NetworkStatus.success) {
                                                loadAllMeasures();
                                              }
                                              Navigator.pop(context);
                                            }
                                          })
                                    ],
                                  ),
                                )),
                            context,
                            0.18),
                        color: Colors.grey,
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: listMeasures.map((e) => ListTile(
                                onLongPress: () async{
                                  var removeMeasure = await ref.read(removeMeasureProvider.notifier).removeMeasure(int.parse(e.id.toString()));
                                  if(removeMeasure.networkStatus == NetworkStatus.success){
                                    loadAllMeasures();
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars('Can not remove', Colors.redAccent));
                                  }
                                },
                                onTap: (){
                                  widget.selectMeasureUnit!(e);
                                  Navigator.pop(context);
                                },
                                title: Text("${e.name}"),
                                leading: const Icon(
                                    Icons.account_balance_wallet_outlined),
                              )).toList().reversed.toList(),
                    )
                  ])
                : allMeasuresViewer.networkStatus == NetworkStatus.failed
                    ? Center(
                        child: Text(allMeasuresViewer.getErrorMessage),
                      )
                    : Center(
                        child: Text("${allMeasuresViewer.errorMessage}"),
                      ));
  }
}
