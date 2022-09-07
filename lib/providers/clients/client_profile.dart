import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
  void loadClientData(){
    ref.read(clientDetails.notifier).clientDetails(widget.client);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadClientData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentClient = ref.watch(clientDetails);
    return Scaffold(
      appBar: AppBarCommon.preferredSizeWidget(context, 'Profile', actions: [
        PopupMenuButton(itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: const Text("Edit"),
              onTap: () async {},
            ),
            PopupMenuItem(
              child: const Text("Delete"),
              onTap: () async {
                var deleteResponse = await ref
                    .read(removeClientProvider.notifier)
                    .removeClient(currentClient.data!.id);
                if (deleteResponse.networkStatus == NetworkStatus.success) {
                  context.pop();
                }
              },
            )
          ];
        })
      ]),
      body: currentClient.networkStatus == NetworkStatus.loading
          ? Center(
              child: CircularProgressIndicator(color: Colors.green.shade400),
            ):
          currentClient.networkStatus == NetworkStatus.success
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.all(30.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffC4C4C4)),
                              height: 85,
                              width: 85,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Positioned(
                                    child: Image.network(
                                      "https://www.pngitem.com/pimgs/m/22-223968_default-profile-picture-circle-hd-png-download.png",
                                      height: 100.0,
                                      width: 70,
                                    ),
                                  ),
                                  const Positioned(
                                      left: 60,
                                      top: 60,
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.green.shade900,
                                    )),
                                const Text('Email')
                              ]),
                              Column(children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.call,
                                      color: Colors.amber,
                                    )),
                                const Text(
                                  'Call',
                                  style:
                                  TextStyle(color: Colors.amber),
                                )
                              ]),
                              Column(children: [
                                IconButton(
                                  color: Colors.blueAccent,
                                  onPressed: () {},
                                  icon: const Icon(Icons.message),
                                ),
                                const Text(
                                  'Message',
                                  style: TextStyle(
                                      color: Colors.blueAccent),
                                )
                              ])
                            ],
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Text('Names: ',
                          style:
                          TextStyle(fontWeight: FontWeight.bold)),
                      trailing:
                      Text(currentClient.data?.clientName ?? ''),
                    ),
                    ListTile(
                      leading: const Text('TIN: ',
                          style:
                          TextStyle(fontWeight: FontWeight.bold)),
                      trailing:
                      Text(currentClient.data?.clientTin ?? ''),
                    ),
                    ListTile(
                      leading: const Text('Email: ',
                          style:
                          TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text(currentClient.data?.email ?? ''),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Text('Address: ',
                          style:
                          TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text(
                          "${currentClient.data?.physicalAddress}"),
                    ),
                    ListTile(
                      leading: const Text('Status: ',
                          style:
                          TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text(
                          currentClient.data?.status == true
                              ? 'Active'
                              : 'Inactive'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Text('Phone: ',
                          style:
                          TextStyle(fontWeight: FontWeight.bold)),
                      trailing:
                      Text(currentClient.data?.phoneNumber ?? ''),
                    ),
                    ListTile(
                      iconColor: Colors.red,
                      textColor: Colors.red,
                      onTap: () {},
                      leading: const Icon(
                        Icons.delete,
                      ),
                      trailing: const Text('Delete client'),
                    ),
                  ],
                ),
              ),
            ):currentClient.networkStatus == NetworkStatus.failed?
          Center(child: Text("${currentClient.networkStatus}"),):
          Center(child: InkWell(onTap: (){loadClientData();},child: Text(currentClient.getErrorMessage)),),
    );
  }
}
