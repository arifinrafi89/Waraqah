/// Formats an amount as Taka, e.g. `taka(450)` -> `'৳450'`.
String taka(double amount) => '৳${amount.toStringAsFixed(0)}';
