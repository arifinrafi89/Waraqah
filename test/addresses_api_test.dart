import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/fake_api_routes.dart';

const _new = {
  'label': 'Office',
  'recipient': 'Nadia',
  'phone': '+8801712345678',
  'line': 'Level 4, Gulshan Avenue',
  'upazila': 'Dhaka North City',
  'district': 'Dhaka',
  'division': 'Dhaka',
};

List<String> _ids(Response<dynamic> r) => [
  for (final a in r.data as List) (a as Map)['id'] as String,
];

void main() {
  late Dio dio;

  setUp(() => dio = Dio()..interceptors.add(FakeApiRoutes.interceptor()));

  test('save adds an address with a server id and a 01… phone', () async {
    final saved = await dio.post<List<dynamic>>('/addresses/save', data: _new);
    expect(_ids(saved), ['addr-home', 'addr-family', 'addr-1']);
    expect((saved.data!.last as Map)['phone'], '01712345678');
    final listed = await dio.get<List<dynamic>>('/addresses');
    expect(_ids(listed), contains('addr-1'));
  });

  test('a broken address or unknown id is refused', () async {
    final blank = await dio.post<List<dynamic>>(
      '/addresses/save',
      data: {..._new, 'upazila': ''},
    );
    expect(blank.data, isNull);
    final unknown = await dio.post<List<dynamic>>(
      '/addresses/delete',
      data: {'id': 'addr-x'},
    );
    expect(unknown.data, isNull);
  });

  test('the default comes first; deleting it moves the default', () async {
    final moved = await dio.post<List<dynamic>>(
      '/addresses/default',
      data: {'id': 'addr-family'},
    );
    expect(_ids(moved), ['addr-family', 'addr-home']);
    final deleted = await dio.post<List<dynamic>>(
      '/addresses/delete',
      data: {'id': 'addr-family'},
    );
    expect(_ids(deleted), ['addr-home']);
    expect((deleted.data!.single as Map)['isDefault'], isTrue);
  });

  test('/orders/place delivers to a new address; unknown is refused', () async {
    await dio.post<void>(
      '/cart/add',
      data: {'kind': 'edition', 'id': 'bk-atomic-pb-en'},
    );
    final unknown = await dio.post<Map<String, dynamic>>(
      '/orders/place',
      data: {'addressId': 'addr-1', 'payment': 'cashOnDelivery'},
    );
    expect(unknown.data, isNull);

    await dio.post<void>('/addresses/save', data: _new);
    final placed = await dio.post<Map<String, dynamic>>(
      '/orders/place',
      data: {'addressId': 'addr-1', 'payment': 'cashOnDelivery'},
    );
    expect(placed.data!['insideDhaka'], isTrue);
  });
}
