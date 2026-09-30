import '../../../../core/usecase/usecase.dart';
import '../entities/look_inside.dart';
import '../repositories/book_extras_repository.dart';

/// A book's Look Inside, or `null` when it has neither contents nor pages.
class GetLookInside extends UseCase<LookInside?, String> {
  GetLookInside(this._repository);

  final BookExtrasRepository _repository;

  @override
  Future<LookInside?> call(String params) async {
    final look = await _repository.lookInside(params);
    if (look == null || (look.contents.isEmpty && look.samplePages.isEmpty)) {
      return null;
    }
    return look;
  }
}
