import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/utilities/network_info.dart';
import '../../../models/vendor_model.dart';
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
    var detailsVendor = ref.watch(vendorDetailsProvider);
    nameController.text = detailsVendor.data?.vendorName ?? '';
    tinNumberController.text=detailsVendor.data?.vendorTIN??'';
    contactPersonLastName.text=detailsVendor.data?.contactPersonLastName??'';
    contactPersonName.text=detailsVendor.data?.contactPersonFirstName??'';
    emailController.text=detailsVendor.data?.email??'';
    phoneController.text=detailsVendor.data?.phoneNumber?.replaceRange(0, 4, '')??'';
    // phoneController.text=detailsVendor.data?.phoneNumber??'';
    addressController.text=detailsVendor.data?.physicalAddress??'';
    noteController.text=detailsVendor.data?.note??'';
    currentStatus = detailsVendor.data?.status;
    String? phone=detailsVendor.data?.phoneNumber?.replaceRange(0, 4, '');
    debugPrint("In populate: ${phone}");
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
    var vendorWatcher = ref.watch(vendorDetailsProvider);
    var registerVendor = ref.watch(allVendorsProvider);

    ref.listen(vendorDetailsProvider, (previous, next) {
      if (int.parse(widget.vendorId.toString()) != 0) {
        populateVendor();
      }
    });

    return Scaffold(
        appBar: AppBarCommon.preferredSizeWidget(context,int.parse(widget.vendorId.toString()) == 0? "Save Vendor": "Edit Vendor"),
        body: int.parse(widget.vendorId.toString()) == 0
            ? SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                              dropDownHint: const Text('Vendor Status',
                                  style: TextStyle(color: Colors.grey)),
                              selectedValue: (value) {},
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
                        margin: const EdgeInsets.symmetric( vertical: 10, horizontal: 10),
                        child: LoginButton(
                            text: int.parse(widget.vendorId.toString()) == 0 ? "Save Vendor" : "Edit Vendor",
                            actionField: () async {
                              if (_formKey.currentState!.validate()) {
                                var vendorResponse = await ref.read(allVendorsProvider.notifier).registerVendor(VendorModel(
                                        vendorName: nameController.text,
                                        status: vendorStatusOption == "Active" ? true: false,
                                        email: emailController.text,
                                        phoneNumber: "+${countryCode.toString()}${phoneController.text}",
                                        physicalAddress: addressController.text,
                                        contactPersonLastName: contactPersonName.text,
                                        contactPersonFirstName: contactPersonLastName.text,
                                        vendorTIN: tinNumberController.text,
                                        note: noteController.text));
                                if (vendorResponse.networkStatus == NetworkStatus.success) {
                                  ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBars.snackBars( 'Vendor saved successfully',Colors.green.shade400));
                                  context.pop();
                                } else {
                                  ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBars.snackBars(vendorResponse.getErrorMessage,Colors.redAccent.shade400));
                                }
                              }
                            }),
                      )
                    ],
                  ),
                ),
              )
            : vendorWatcher.networkStatus == NetworkStatus.loading
                ? Center(
                    child:
                        CircularProgressIndicator(color: Colors.green.shade400),
                  )
                : vendorWatcher.networkStatus == NetworkStatus.success
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
                                        validators: (value) {},
                                        hintText: 'Vendor names',
                                        fieldController: nameController,
                                        isShown: false),
                                    SelectInputType(
                                      defaultValue: currentStatus==true?'Active':'Inactive',
                                      validation: (value) {
                                        if (value == null) {
                                          return "Select status";
                                        }
                                        return null;
                                      },
                                      dropDownHint: Text(currentStatus==true?'active':'Inactive',
                                          style: const TextStyle(color: Colors.grey)),
                                      selectedValue: (value) {
                                        currentStatus=(value=='Active'?true:false);
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
                                    text:
                                        int.parse(widget.vendorId.toString()) ==
                                                0
                                            ? "Save Vendor"
                                            : "Edit Vendors",
                                    actionField: () async {
                                      if (_formKey.currentState!.validate()) {
                                        if (int.parse(widget.vendorId.toString()) ==0) {
                                          var createResponse= await ref.read(allVendorsProvider.notifier).registerVendor(VendorModel(
                                                vendorName: nameController.text,
                                                status: currentStatus,note: noteController.text,
                                                vendorTIN: tinNumberController.text,
                                                contactPersonFirstName: contactPersonName.text,
                                                contactPersonLastName: contactPersonLastName.text,
                                                phoneNumber: "+$countryCode${phoneController.text}",
                                                physicalAddress: addressController.text,
                                                email: emailController.text,
                                              ));
                                          if (createResponse.networkStatus == NetworkStatus.success) {
                                            ScaffoldMessenger.of(context)
                                              ..removeCurrentSnackBar()
                                              ..showSnackBar(SnackBars.snackBars(
                                                  'Vendor created successfully',
                                                  Colors.green.shade400));
                                            Navigator.pop(context);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                              ..removeCurrentSnackBar()
                                              ..showSnackBar(
                                                  SnackBars.snackBars(createResponse.getErrorMessage, Colors.redAccent.shade400));
                                          }
                                        } else {
                                          debugPrint("before save: $currentStatus");
                                          var editVendorResponse= await ref.read(allVendorsProvider.notifier).editVendor(vendorModel: VendorModel(
                                            vendorName: nameController.text,
                                            status: currentStatus,note: noteController.text,
                                            vendorTIN: tinNumberController.text,
                                            contactPersonFirstName: contactPersonName.text,
                                            contactPersonLastName: contactPersonLastName.text,
                                            phoneNumber: "+$countryCode${phoneController.text}",
                                            physicalAddress: addressController.text,
                                            email: emailController.text,
                                          ), id: int.parse(widget.vendorId.toString()));
                                          if (editVendorResponse.networkStatus == NetworkStatus.success) {
                                            ScaffoldMessenger.of(context)
                                              ..removeCurrentSnackBar()
                                              ..showSnackBar(SnackBars.snackBars(
                                                  'Vendor details edited',
                                                  Colors.green.shade400));
                                            Navigator.pop(context);
                                          }else{
                                            ScaffoldMessenger.of(context)
                                              ..removeCurrentSnackBar()
                                              ..showSnackBar(SnackBars.snackBars(
                                                  '${editVendorResponse.getErrorMessage}',
                                                  Colors.green.shade400));
                                            context.goNamed('vendors');
                                          }
                                        }
                                      }
                                    }),
                              )
                            ],
                          ),
                        ),
                      )
                    : registerVendor.networkStatus == NetworkStatus.failed
                        ? Container(
                            child: Text(registerVendor.getErrorMessage),
                          )
                        : Container(
                            child: Text("${registerVendor.errorMessage}"),
                          ));
  }
}
