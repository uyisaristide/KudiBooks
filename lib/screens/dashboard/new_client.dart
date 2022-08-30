import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/client_models/client_model.dart';
import '../../models/utilities/network_info.dart';
import '../../providers/clients/providers/all_client_providers.dart';
import '../auth_screens/widgets/drop_down_widget.dart';
import '../auth_screens/widgets/login_button.dart';
import '../auth_screens/widgets/phone_input.dart';
import '../auth_screens/widgets/text_form_field.dart';
import 'classes/snack_bars.dart';
import 'widget/common_appBar.dart';

class NewClient extends ConsumerStatefulWidget {
  String? clientId;

  NewClient({Key? key, required this.clientId}) : super(key: key);

  @override
  ConsumerState<NewClient> createState() => _NewClientState();
}

class _NewClientState extends ConsumerState<NewClient> {
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
  List<String> clientStatus = ['Active', 'Inactive'];
  String? clientStatusOption;
  bool? currentStatus;
  populateClient() {

    var detailsClient = ref.watch(clientDetails);
    nameController.text = detailsClient.data?.clientName ?? '';
    tinNumberController.text=detailsClient.data?.clientTin??'fd';
    addressController.text=detailsClient.data?.physicalAddress??'';
    noteController.text=detailsClient.data?.note??'';
    currentStatus = detailsClient.data?.status;
    debugPrint("In populate: $currentStatus");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (int.parse(widget.clientId.toString()) != 0) {
        ref.read(clientDetails.notifier).clientDetails(int.parse(widget.clientId.toString()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var clientWatcher = ref.watch(createClientProvider);
    var clientDetailsWatcher = ref.watch(clientDetails);

    print("In build: $currentStatus");

    ref.listen(clientDetails, (previous, next) {
      if (int.parse(widget.clientId.toString()) != 0) {
        populateClient();
      }
    });
    return Scaffold(
        appBar: AppBarCommon.preferredSizeWidget(context,
            int.parse(widget.clientId.toString()) == 0
                ? "Save Client"
                : "Edit Client"),
        body: int.parse(widget.clientId.toString()) == 0
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
                                    return 'Enter client name';
                                  }
                                  return null;
                                },
                                hintText: 'Client name',
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
                                'Client Status',
                                style: TextStyle(color: Colors.grey),
                              ),
                              selectedValue: (value) {
                                clientStatusOption = value;
                              },
                              itemsToSelect: clientStatus,
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
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: LoginButton(
                            text: int.parse(widget.clientId.toString()) == 0
                                ? "Save Client"
                                : "Edit Client",
                            actionField: () async {
                              if (_formKey.currentState!.validate()) {
                                var clientResponse = await ref
                                    .read(createClientProvider.notifier)
                                    .registerClient(ClientModel(
                                    clientName: nameController.text,
                                    status:
                                    clientStatusOption == "Active" ? true : false,
                                    clientTin: tinNumberController.text,
                                    contactPersonFirstName: contactPersonName.text,
                                    contactPersonLastName: contactPersonLastName.text,
                                    email: emailController.text,
                                    phoneNumber:
                                    countryCode.toString() + phoneController.text,
                                    physicalAddress: addressController.text,
                                    note: noteController.text));
                                if (clientResponse.networkStatus == NetworkStatus.success) {
                                  ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(SnackBars.snackBars(
                                        'Client saved successfully',
                                        Colors.green.shade400));
                                  context.goNamed('clientList');
                                } else {
                                  ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(SnackBars.snackBars(
                                        clientWatcher.getErrorMessage,
                                        Colors.redAccent.shade400));
                                }
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
                                            return 'Enter client name';
                                          }
                                          return null;
                                        },
                                        hintText: 'Client name',
                                        fieldController: nameController,
                                        isShown: false),
                                    SelectInputType(defaultValue: currentStatus==true?'Active':'Inactive',
                                      dropDownHint: Text(
                                        currentStatus==true?'Active':'Inactive',
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                      selectedValue: (value) {
                                        print("some value: $value");
                                        setState(() {
                                          currentStatus=(value=='Active'?true:false);
                                        });
                                        debugPrint("some debug: $currentStatus");
                                      },
                                      itemsToSelect: clientStatus,
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
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                child: LoginButton(
                                    text: int.parse(widget.clientId.toString()) == 0
                                        ? "Save Client"
                                        : "Edit Client",
                                    actionField: () async {
                                      if (_formKey.currentState!.validate()) {
                                        if(int.parse(widget.clientId.toString())==0){
                                          var clientResponse = await ref
                                              .read(createClientProvider.notifier)
                                              .registerClient(ClientModel(
                                              clientName: nameController.text,
                                              status:
                                              clientStatusOption == "Active" ? true : false,
                                              clientTin: tinNumberController.text,
                                              contactPersonFirstName: contactPersonName.text,
                                              contactPersonLastName: contactPersonLastName.text,
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
                                        }else{
                                          debugPrint("before save: $currentStatus");
                                          var editResponse = await ref
                                              .read(editClientProvider.notifier)
                                              .editClient(client: ClientModel(
                                              clientName: nameController.text,
                                              status:currentStatus,
                                              clientTin: tinNumberController.text,
                                              physicalAddress: addressController.text,
                                              note: noteController.text), id: int.parse(widget.clientId.toString()));
                                          if (editResponse.networkStatus == NetworkStatus.success) {
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
