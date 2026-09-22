import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/book_providers.dart';
import '../../../../core/providers/profile_providers.dart';
import '../../../../core/theme/app_palette.dart';
import '../../data/p2p_providers.dart';
import '../../domain/models/p2p_listing.dart';

/// UI-shell only: seller is the demo current user (`profile-1`), new
/// listings go into the same in-memory `p2pListingsProvider` the P2P feed
/// reads.
class CreateListingPage extends ConsumerStatefulWidget {
  const CreateListingPage({super.key});

  @override
  ConsumerState<CreateListingPage> createState() => _CreateListingPageState();
}

class _CreateListingPageState extends ConsumerState<CreateListingPage> {
  final _formKey = GlobalKey<FormState>();
  final _priceController = TextEditingController();
  String? _bookId;
  P2pCondition _condition = P2pCondition.good;

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final listing = P2pListing(
      id: 'p2p-${DateTime.now().microsecondsSinceEpoch}',
      sellerId: currentProfileId,
      bookId: _bookId,
      condition: _condition,
      price: double.parse(_priceController.text),
      status: P2pStatus.available,
    );
    ref.read(p2pListingsProvider.notifier).add(listing);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final books = ref.watch(booksProvider);

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: const Text('New Listing')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: _bookId,
                  decoration: const InputDecoration(labelText: 'Book'),
                  items: [
                    for (final book in books)
                      DropdownMenuItem(value: book.id, child: Text(book.title)),
                  ],
                  onChanged: (value) => setState(() => _bookId = value),
                  validator: (value) => value == null ? 'Pick a book' : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _priceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(labelText: 'Price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Price is required';
                    }
                    return double.tryParse(value) == null
                        ? 'Enter a valid number'
                        : null;
                  },
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<P2pCondition>(
                  initialValue: _condition,
                  decoration: const InputDecoration(labelText: 'Condition'),
                  items: [
                    for (final condition in P2pCondition.values)
                      DropdownMenuItem(
                        value: condition,
                        child: Text(condition.name),
                      ),
                  ],
                  onChanged: (value) =>
                      setState(() => _condition = value ?? _condition),
                ),
                const SizedBox(height: 14),
                Container(
                  height: 96,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: palette.border),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Photo picker coming soon',
                    style: TextStyle(color: palette.textDim),
                  ),
                ),
                const SizedBox(height: 22),
                FilledButton(onPressed: _submit, child: const Text('List it')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
