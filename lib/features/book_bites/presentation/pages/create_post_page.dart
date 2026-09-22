import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/book_providers.dart';
import '../../../../core/providers/profile_providers.dart';
import '../../../../core/theme/app_palette.dart';
import '../../data/book_bites_providers.dart';
import '../../domain/models/post.dart';

/// UI-shell only: author is the demo current user (`profile-1`), new posts
/// go into the same in-memory `postsProvider` the Book-Bites feed reads.
class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({super.key});

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();
  final _contentController = TextEditingController();
  String? _taggedBookId;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final post = Post(
      id: 'post-${DateTime.now().microsecondsSinceEpoch}',
      authorId: currentProfileId,
      content: _contentController.text,
      createdAt: DateTime.now(),
      taggedBookIds: _taggedBookId == null ? const [] : [_taggedBookId!],
    );
    ref.read(postsProvider.notifier).add(post);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final books = ref.watch(booksProvider);

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: const Text('New Book-Bite')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _contentController,
                  maxLines: 5,
                  decoration: const InputDecoration(labelText: 'What are you reading?'),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Content is required' : null,
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<String>(
                  initialValue: _taggedBookId,
                  decoration: const InputDecoration(labelText: 'Tag a book (optional)'),
                  items: [
                    for (final book in books)
                      DropdownMenuItem(value: book.id, child: Text(book.title)),
                  ],
                  onChanged: (value) => setState(() => _taggedBookId = value),
                ),
                const SizedBox(height: 22),
                FilledButton(onPressed: _submit, child: const Text('Post')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
