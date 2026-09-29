/// Base contract every use case implements: one async operation, one input.
abstract class UseCase<Result, Params> {
  Future<Result> call(Params params);
}

/// Marker params for a use case that needs no input.
final class NoParams {
  const NoParams();
}
