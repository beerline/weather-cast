import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weathercast/errors/failures.dart';
import 'package:weathercast/features/location/domain/repositories/location_repository_abstract.dart';
import 'package:weathercast/features/location/domain/usecases/current_location_cubit.dart';

class MockLocationRepository extends Mock
    implements LocationRepositoryAbstract {}

void main() {
  group('repository fail', () {
    late MockLocationRepository mockRepository;
    late CurrentLocationCubit cubit;

    setUpAll(() {
      mockRepository = MockLocationRepository();
      when(() => mockRepository.getCurrentLocation())
          .thenAnswer((_) async => Left(LocationServiceNotEnabledFailure()));
      cubit = CurrentLocationCubit(mockRepository);
    });

    test('return Left<Failure, LocationData> if repository fail', () async {
      final res = await cubit.get();
      verify(() => mockRepository.getCurrentLocation()).called(1);

      final isSameClassInstance = res is Left<Failure, LocationData>;
      expect(isSameClassInstance, true);
    });

    blocTest<CurrentLocationCubit, CurrentLocationStateAbstract>(
      'emits CurrentLocationErrorState if repository fail',
      build: () {
        return cubit;
      },
      act: (cubit) => cubit.get(),
      expect: () => [
        isA<CurrentLocationErrorState>(),
      ],
    );
  });

  test('return Right<Failure, LocationData> if repository success', () async {
    final mockRepository = MockLocationRepository();
    when(() => mockRepository.getCurrentLocation())
        .thenAnswer((_) async => Right(LocationData.fromMap({})));
    final cubit = CurrentLocationCubit(mockRepository);

    final res = await cubit.get();

    verify(() => mockRepository.getCurrentLocation()).called(1);
    final isSameClassInstance = res is Right<Failure, LocationData>;
    expect(isSameClassInstance, true);
  });
}
