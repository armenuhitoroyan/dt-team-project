import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final TextEditingController _ingredientController = TextEditingController();
  final TextEditingController _piecesController = TextEditingController();
  List<String> _ingredients = ['Flour', 'Sugar', 'Eggs'];
  int _pieces = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingredients:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _ingredients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_ingredients[index]),
                );
              },
            ),
            TextField(
              controller: _ingredientController,
              decoration: const InputDecoration(
                labelText: 'Add Ingredient',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _ingredients.add(_ingredientController.text);
                  _ingredientController.clear();
                });
              },
              child: const Text('Add Ingredient'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Count:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _piecesController,
              decoration: const InputDecoration(
                labelText: 'Number of Pieces',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _pieces = int.parse(_piecesController.text);
                });
              },
              child: const Text('Set Pieces'),
            ),
            const SizedBox(height: 20),
            Text(
              'Total Pieces: $_pieces',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
