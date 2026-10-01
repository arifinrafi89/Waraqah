// ponytail: id slugs for the fake backend; the Go backend makes real ids.
/// `<prefix>-<slug of text>`, with `-2`, `-3`… when [taken] has it.
String uniqueId(String prefix, String text, Iterable<String> taken) {
  final slug = text
      .toLowerCase()
      .replaceAll(RegExp('[^a-z0-9]+'), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');
  final base = '$prefix-${slug.isEmpty ? 'new' : slug}';
  final used = taken.toSet();
  var id = base;
  for (var n = 2; used.contains(id); n++) {
    id = '$base-$n';
  }
  return id;
}
