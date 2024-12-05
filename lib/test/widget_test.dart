import 'package:flutter/material.dart';


class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu Example'),
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (String value) {
                // Обработка выбранного элемента
                print('Выбран: $value');
              },
              itemBuilder: (BuildContext context) {
                return <String>['Элемент 1', 'Элемент 2', 'Элемент 3']
                    .map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Center(
          child: Text('Содержимое приложения'),
        ),
      ),
    );
  }
}