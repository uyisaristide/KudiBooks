import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/client_models/client_model.dart';
import '../../../models/utilities/network_info.dart';
import '../../../providers/clients/providers/all_client_providers.dart';
import '../../auth_screens/widgets/drop_down_widget.dart';
import '../../auth_screens/widgets/login_button.dart';
import '../../auth_screens/widgets/phone_input.dart';
import '../../auth_screens/widgets/text_form_field.dart';
import '../classes/snack_bars.dart';
import '../widget/common_appBar.dart';
import '../../../providers/vendor/vendor_providers.dart';

class NewVendor extends ConsumerStatefulWidget {
  String? vendorId;

  NewVendor({Key? key, required this.vendorId}) : super(key: key);

  @override
  ConsumerState<NewVendor> createState() => _NewVendorState();
}

class _NewVendorState extends ConsumerState<NewVendor> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final tinNumberController = TextEditingController();
  final contactPersonName = TextEditingController();
  final contactPersonLastName = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final noteController = TextEditingController();
  String countryCode = '250';
  List<String> vendorStatus = ['Active', 'Inactive'];
  String? vendorStatusOption;
  bool? currentStatus;

  populateVendor() {

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (int.parse(widget.vendorId.toString()) != 0) {
        ref.read(vendorDetailsProvider.notifier).vendorDetails(int.parse(widget.vendorId.toString()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var clientWatcher = ref.watch(createClientProvider);
    var clientDetailsWatcher = ref.watch(clientDetails);

    print("In build: $currentStatus");

    ref.listen(clientDetails, (previous, next) {
      if (int.parse(widget.vendorId.toString()) != 0) {
        populateVendor();
      }
    });
    return Scaffold(
        appBar: AppBarCommon.preferredSizeWidget(
            context,
            int.parse(widget.vendorId.toString()) == 0
                ? "Save Vendor"
                : "Edit Vendor"),
        body: int.parse(widget.vendorId.toString()) == 0
            ? SingleChildScrollView(
          child: Container(
            margin:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                          validators: (value) {
                            if (nameController.text.isEmpty) {
                              return 'Enter vendor name';
                            }
                            return null;
                          },
                          hintText: 'Vendor name',
                          fieldController: nameController,
                          isShown: false),
                      SelectInputType(
                        validation: (value) {
                          if (value == null) {
                            return "Select status";
                          }
                          return null;
                        },
                        dropDownHint: const Text(
                          'Vendor Status',
                          style: TextStyle(color: Colors.grey)
                        ),
                        selectedValue: (value) {

                        },
                        itemsToSelect: vendorStatus,
                      ),
                      CustomFormField(
                        validators: (value) {},
                        hintText: 'Tin Number',
                        fieldController: tinNumberController,
                        isShown: false,
                      ),
                      CustomFormField(
                          validators: (value) {},
                          hintText: 'Contact person’s First Name',
                          fieldController: contactPersonName,
                          isShown: false,
                          inputType: TextInputType.name),
                      CustomFormField(
                          validators: (value) {},
                          hintText: 'Contact person’s Last Name',
                          fieldController: contactPersonLastName,
                          isShown: false,
                          inputType: TextInputType.name),
                      CustomFormField(
                          validators: (value) {},
                          // validators: (value) {
                          //   final RegExp regex = RegExp(
                          //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          //   if (!regex.hasMatch(value)) {
                          //     return 'Invalid Phone number';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          hintText: 'Email',
                          fieldController: emailController,
                          isShown: false,
                          inputType: TextInputType.emailAddress),
                      PhoneField(
                          validators: (values) {
                            return null;
                          },
                          phoneNumber: phoneController,
                          fieldIcon: const Icon(Icons.phone),
                          countryCodes: (phoneCode) {
                            setState(() {
                              countryCode = phoneCode.dialCode;
                            });
                          }),
                      CustomFormField(
                          validators: (value) {},
                          hintText: 'Address',
                          fieldController: addressController,
                          isShown: false,
                          inputType: TextInputType.streetAddress),
                      CustomFormField(
                          validators: (value) {},
                          hintText: 'Note',
                          maxLining: 5,
                          fieldController: noteController,
                          isShown: false,
                          inputType: TextInputType.streetAddress),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  child: LoginButton(
                      text: int.parse(widget.vendorId.toString()) == 0
                          ? "Save Vendor"
                          : "Edit Vendor",
                      actionField: () async {
                        if (_formKey.currentState!.validate()) {

                        }
                      }),
                )
              ],
            ),
          ),
        )
            : clientDetailsWatcher.networkStatus == NetworkStatus.loading
            ? Center(
          child:
          CircularProgressIndicator(color: Colors.green.shade400),
        )
            : clientDetailsWatcher.networkStatus == NetworkStatus.success
            ? SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
                vertical: 15, horizontal: 15),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                          validators: (value) {
                            if (nameController.text.isEmpty) {
                              return 'Enter vendor name';
                            }
                            return null;
                          },
                          hintText: 'Vendor name',
                          fieldController: nameController,
                          isShown: false),
                      SelectInputType(
                        dropDownHint: Text(
                          currentStatus == true ? 'Active' : 'Inactive',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        selectedValue: (value) {
                          print("some value: $value");
                          setState(() {
                            currentStatus = (value == 'Active' ? true : false);
                          });
                          debugPrint("some debug: $currentStatus");
                        },
                        itemsToSelect: vendorStatus,
                      ),
                      CustomFormField(
                        validators: (value) {},
                        hintText: 'Tin Number',
                        fieldController: tinNumberController,
                        isShown: false,
                      ),
                      CustomFormField(
                          validators: (value) {},
                          hintText: 'Address',
                          fieldController: addressController,
                          isShown: false,
                          inputType: TextInputType.streetAddress),
                      CustomFormField(
                          validators: (value) {},
                          hintText: 'Note',
                          maxLining: 5,
                          fieldController: noteController,
                          isShown: false,
                          inputType: TextInputType.streetAddress),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  child: LoginButton(
                      text: int.parse(widget.vendorId.toString()) == 0
                          ? "Save Client"
                          : "Edit Client",
                      actionField: () async {
                        if (_formKey.currentState!.validate()) {
                          if (int.parse(widget.vendorId.toString()) == 0) {
                            var clientResponse = await ref
                                .read(createClientProvider.notifier)
                                .registerClient(ClientModel(
                                clientName: nameController.text,
                                status:
                                vendorStatusOption == "Active" ? true : false,
                                clientTin: tinNumberController.text,
                                contactPersonFirstName: contactPersonName.text,
                                contactPersonLastName: contactPersonLastName
                                    .text,
                                email: emailController.text,
                                phoneNumber:
                                countryCode.toString() + phoneController.text,
                                physicalAddress: addressController.text,
                                note: noteController.text));
                            if (clientResponse.networkStatus ==
                                NetworkStatus.success) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBars.snackBars(
                                    'Client saved successfully',
                                    Colors.green.shade400));
                              context.pushNamed('clientList');
                            } else {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBars.snackBars(
                                    clientResponse.getErrorMessage,
                                    Colors.redAccent.shade400));
                            }
                          } else {
                            debugPrint("before save: $currentStatus");
                            var editResponse = await ref
                                .read(editClientProvider.notifier)
                                .editClient(client: ClientModel(
                                clientName: nameController.text,
                                status: currentStatus,
                                clientTin: tinNumberController.text,
                                physicalAddress: addressController.text,
                                note: noteController.text),
                                id: int.parse(widget.vendorId.toString()));
                            if (editResponse.networkStatus ==
                                NetworkStatus.success) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBars.snackBars(
                                    '${editResponse.errorMessage}',
                                    Colors.green.shade400));
                              context.pop();
                            } else {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBars.snackBars(
                                    editResponse.getErrorMessage,
                                    Colors.redAccent.shade400));
                            }
                          }
                        }
                      }),
                )
              ],
            ),
          ),
        )
            : clientDetailsWatcher.networkStatus == NetworkStatus.failed
            ? Container(
          child: Text(clientDetailsWatcher.getErrorMessage),
        )
            : Container(
          child: Text("${clientDetailsWatcher.errorMessage}"),
        ));
  }
}
