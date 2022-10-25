import 'package:cat_api/provider/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CatImageProvider>(context, listen: false).getAllCats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cat Images'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<CatImageProvider>(context, listen: false)
                    .getAllCats();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Consumer<CatImageProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final cat = value.getCat;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Center(
                      child: Image.network(
                        cat.url,
                        // height: cat.height * 1.0,
                        // width: cat.width * 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Image ID : ${cat.id}',
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Image height : ${cat.height}',
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Image width : ${cat.width}',
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
