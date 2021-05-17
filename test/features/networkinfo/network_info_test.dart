import 'package:bloc_test/bloc_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weathercast/features/networkinfo/network_info_cubit.dart';

void main() {
  mainCubit();
}

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker{}

void mainCubit() {
  group('no internet connection', () {
    late MockInternetConnectionChecker mockInternetConnectionChecker;

    setUp((){
      mockInternetConnectionChecker = MockInternetConnectionChecker();
      when(() => mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => false);
    });

    test("return false when no intrnet connection", () async {
      final cubit = NetworkInfoCubit(mockInternetConnectionChecker);
      final res = await cubit.isConnected();

      verify(() => mockInternetConnectionChecker.hasConnection).called(1);
      expect(res, false);
    });

    blocTest<NetworkInfoCubit, NetworkInfoStateAbstract>(
      'emits NetworkInfoNoConnection when no intenet connection',
      build: () {
        return NetworkInfoCubit(mockInternetConnectionChecker);
      },
      act: (cubit) => cubit.isConnected(),
      expect: () => [isA<NetworkInfoNoConnection>(),],
    );
  });

  group('internet connection exist', () {
    late MockInternetConnectionChecker mockInternetConnectionChecker;

    setUp((){
      mockInternetConnectionChecker = MockInternetConnectionChecker();
      when(() => mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);
    });

    test("return false when no intrnet connection", () async {
      final cubit = NetworkInfoCubit(mockInternetConnectionChecker);
      final res = await cubit.isConnected();

      verify(() => mockInternetConnectionChecker.hasConnection).called(1);
      expect(res, true);
    });
  });
}