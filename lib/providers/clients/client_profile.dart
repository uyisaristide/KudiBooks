import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/utilities/network_info.dart';
import '../../screens/dashboard/widget/common_appBar.dart';
import 'providers/all_client_providers.dart';

class ClientProfile extends ConsumerStatefulWidget {
  int client;
  ClientProfile({Key? key, required this.client}) : super(key: key);

  @override
  ConsumerState<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends ConsumerState<ClientProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(clientDetails.notifier).clientDetails(widget.client);
    });
  }
  @override
  Widget build(BuildContext context) {
    var currentClient = ref.watch(clientDetails);
    debugPrint("This is id: ${currentClient.data?.email}");
    return Scaffold(
      appBar: AppBarCommon.preferredSizeWidget(context, 'Profile'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: currentClient.networkStatus == NetworkStatus.loading?
          Center(child: CircularProgressIndicator(color: Colors.green.shade400),) :
          currentClient.networkStatus == NetworkStatus.success?
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(30.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffC4C4C4)),
                        height: 85,
                        width: 85,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            const Positioned(
                                left: 60,
                                top: 60,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.grey,
                                )),
                            Positioned(
                              child: Image.asset(
                                "assets/images/categories/restaurentIcon.png",
                                height: 54.0,
                                width: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          IconButton(onPressed: () {}, icon: const Icon(Icons.message),),
                          const Text('Message')
                        ]),
                        Column(children: [
                          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
                          const Text('Call')
                        ]),
                        Column(children: [
                          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
                          const Text('Message')
                        ])
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: (){},
                leading: const Text('Names: ', style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Text("Full Names"),
              ),
              ListTile(
                onTap: (){},
                leading: const Text('TIN: ', style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Text("TIN NUMBER"),
              ),
              ListTile(
                onTap: (){},
                leading: const Text('Email: ', style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Text("email"),
              ),
              ListTile(
                onTap: (){},
                leading: const Text('Address: ', style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Text("Address"),
              ),
              ListTile(
                onTap: (){},
                leading: const Text('Status: ', style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Text("Status"),
              ),
              ListTile(
                onTap: (){},
                leading: const Text('Phone: ', style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Text("Phone Number"),
              ),

            ],
          ):
          currentClient.networkStatus == NetworkStatus.failed?
          Center(child: Text(currentClient.getErrorMessage),):
          Center(child: Text("${currentClient.errorMessage}"),),
        ),
      ),
    );
  }
}
