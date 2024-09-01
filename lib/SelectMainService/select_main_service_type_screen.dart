import 'package:flutter/material.dart';
import 'package:weather_app_v1/SelectMainService/select_main_service_viewmodel.dart';

class SelectMainServiceTypeScreen extends StatefulWidget {
  const SelectMainServiceTypeScreen({super.key});

  @override
  State<SelectMainServiceTypeScreen> createState() =>
      _SelectMainServiceTypeScreen();
}

class _SelectMainServiceTypeScreen extends State<SelectMainServiceTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Image.asset(
                          'lib/assets/dashboard_screen/dashboard.location.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Salem",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "6-72, Veppamarathupatti, Salem - 636502",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'lib/assets/dashboard_screen/dashboard.notification.png',
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      "lib/assets/dashboard_screen/dashboard.search.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Container(
                                      width: 1,
                                      color: Colors.grey.withOpacity(0.4),
                                    ),
                                  ),
                                  Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: "Search The OkBOZ App",
                                        hintStyle: TextStyle(
                                            color: Colors.grey.withOpacity(0.7),
                                            fontSize: 14),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GridView.count(
                            physics: const ScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 20),
                            children: const [
                              MainServiceTypeTile(
                                title: "Delivery",
                                image: "delivery",
                              ),
                              MainServiceTypeTile(
                                title: "Transport",
                                image: "transport",
                              ),
                              MainServiceTypeTile(
                                title: "Handyman",
                                image: "handyman",
                              ),
                              MainServiceTypeTile(
                                title: "Video Call",
                                image: "videocall",
                              ),
                            ],
                          ),
                          // const Spacer()
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                      ),
                      width: double.infinity,
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Featured Services",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Image.asset(
                              "lib/assets/dashboard_screen/dashboard.cleaning.service.png",
                              height: 170,
                              width: 300,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Image.asset(
                              "lib/assets/dashboard_screen/dashboard.cleaning.service.png",
                              height: 170,
                              width: 300,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Image.asset(
                              "lib/assets/dashboard_screen/dashboard.cleaning.service.png",
                              height: 170,
                              width: 300,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                      ),
                      width: double.infinity,
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainServiceTypeTile extends StatelessWidget {
  final String title;
  final String image;
  const MainServiceTypeTile({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            child: Image.asset(
              "lib/assets/dashboard_screen/dashboard.$image.png",
              height: 150,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
