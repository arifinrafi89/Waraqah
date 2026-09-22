import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_client.dart';

/// The app's single Dio instance, injected into every remote data source.
final dioProvider = Provider<Dio>((ref) => DioClient.create());
