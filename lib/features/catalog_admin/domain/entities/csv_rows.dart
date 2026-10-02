/// The rows of [text] as CSV fields. Commas split fields; double quotes
/// wrap a field holding commas, quotes or line breaks, and `""` inside
/// quotes is one quote. Blank lines are left out.
List<List<String>> csvRows(String text) {
  final rows = <List<String>>[];
  var row = <String>[];
  final field = StringBuffer();
  var quoted = false;
  void endField() {
    row.add(field.toString());
    field.clear();
  }

  void endRow() {
    endField();
    if (row.any((f) => f.trim().isNotEmpty)) rows.add(row);
    row = [];
  }

  for (var i = 0; i < text.length; i++) {
    final c = text[i];
    if (quoted) {
      if (c != '"') {
        field.write(c);
      } else if (i + 1 < text.length && text[i + 1] == '"') {
        field.write('"');
        i++;
      } else {
        quoted = false;
      }
    } else if (c == '"') {
      quoted = true;
    } else if (c == ',') {
      endField();
    } else if (c == '\n') {
      endRow();
    } else if (c != '\r') {
      field.write(c);
    }
  }
  endRow();
  return rows;
}
