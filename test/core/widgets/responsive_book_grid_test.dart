import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/core/widgets/responsive_book_grid.dart';

int _crossAxisCountOf(WidgetTester tester) {
  final gridView = tester.widget<GridView>(find.byType(GridView));
  final delegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
  return delegate.crossAxisCount;
}

Widget _buildGrid(double width) {
  return MaterialApp(
    home: Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: width,
        height: 600,
        child: ResponsiveBookGrid(
          itemCount: 6,
          itemBuilder: (context, index) => Text('item $index'),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('narrow width shows 2 columns', (tester) async {
    await tester.pumpWidget(_buildGrid(300));
    expect(_crossAxisCountOf(tester), 2);
  });

  testWidgets('wide width shows 4 columns', (tester) async {
    await tester.pumpWidget(_buildGrid(900));
    expect(_crossAxisCountOf(tester), 4);
  });
}
