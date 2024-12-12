import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'image_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    context.read<ImageListProvider>().getImageData();
    super.initState();
  }

  String selected = "ALL";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "HomeScreen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<ImageListProvider>(
        builder: (context, value, child) {
          return value.isLoading == true
              ? const Center(
                  child: const CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          hintText: "Search...",
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                selected = searchController.text;
                              });
                            },
                            child: const Icon(Icons.search),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: selected == "ALL"
                                    ? Colors.orange
                                    : Colors.grey,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = "ALL";
                                    });
                                  },
                                  child: Text(
                                    "ALL",
                                    style: TextStyle(
                                      color: selected == "ALL"
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.imageData?.photos?.length,
                                itemBuilder: (ctx, index) {
                                  return Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: selected ==
                                                  value
                                                      .imageData
                                                      ?.photos?[index]
                                                      .photographer
                                              ? Colors.orange
                                              : Colors.grey,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selected = value
                                                        .imageData
                                                        ?.photos?[index]
                                                        .photographer ??
                                                    "";
                                              });
                                            },
                                            child: Text(
                                              value.imageData?.photos?[index]
                                                      .photographer ??
                                                  "",
                                              style: TextStyle(
                                                color: selected ==
                                                        value
                                                            .imageData
                                                            ?.photos?[index]
                                                            .photographer
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.imageData?.photos?.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: selected ==
                                      value.imageData?.photos?[index]
                                          .photographer
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.imageData?.photos?[index]
                                                  .photographer ??
                                              "",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 200,
                                                child: Image.network(
                                                  value
                                                          .imageData
                                                          ?.photos?[index]
                                                          .src
                                                          ?.original ??
                                                      "",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : selected == "ALL"
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.imageData?.photos?[index]
                                                      .photographer ??
                                                  "",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 200,
                                                    child: Image.network(
                                                      value
                                                              .imageData
                                                              ?.photos?[index]
                                                              .src
                                                              ?.original ??
                                                          "",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Container(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
