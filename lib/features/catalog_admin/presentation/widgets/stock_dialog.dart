import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../l10n/app_localizations.dart';

/// Asks for an Edition's new stock, starting at [stock]. Closes with the
/// number, or `null` when cancelled.
Future<int?> showStockDialog(BuildContext context, int stock) =>
    showDialog<int>(context: context, builder: (_) => _StockDialog(stock));

class _StockDialog extends StatefulWidget {
  const _StockDialog(this.stock);

  final int stock;

  @override
  State<_StockDialog> createState() => _StockDialogState();
}

class _StockDialogState extends State<_StockDialog> {
  late final _controller = TextEditingController(text: '${widget.stock}');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _done() => Navigator.pop(context, int.tryParse(_controller.text));

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return AlertDialog(
      title: Text(l10n.adminCatalogSetStock),
      content: TextField(
        controller: _controller,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(labelText: l10n.adminCatalogFieldStock),
        onSubmitted: (_) => _done(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.adminCatalogCancel),
        ),
        TextButton(onPressed: _done, child: Text(l10n.adminCatalogSave)),
      ],
    );
  }
}
