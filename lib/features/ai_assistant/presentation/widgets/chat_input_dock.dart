import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// Rounded composer pinned to the bottom of the chat, with a send button that
/// disables itself while the assistant is replying.
class ChatInputDock extends StatefulWidget {
  const ChatInputDock({
    super.key,
    required this.hint,
    required this.onSend,
    required this.isBusy,
  });

  final String hint;
  final ValueChanged<String> onSend;
  final bool isBusy;

  @override
  State<ChatInputDock> createState() => _ChatInputDockState();
}

class _ChatInputDockState extends State<ChatInputDock> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (widget.isBusy) return;
    widget.onSend(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, Insets.sm, 14, Insets.screen),
      child: Row(
        spacing: Insets.sm,
        children: [
          Expanded(
            child: Container(
              height: Sizes.fieldHeight,
              padding: const EdgeInsets.only(left: Insets.lg, right: 6),
              decoration: BoxDecoration(
                color: palette.surface,
                border: Border.all(color: palette.border),
                borderRadius: BorderRadius.circular(23),
              ),
              child: TextField(
                controller: _controller,
                onSubmitted: (_) => _submit(),
                textInputAction: TextInputAction.send,
                style: AppFonts.ui(size: 13, color: palette.text),
                cursorColor: palette.accent,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: AppFonts.ui(size: 13, color: palette.textFaint),
                ),
              ),
            ),
          ),
          _sendButton(palette),
        ],
      ),
    );
  }

  Widget _sendButton(AppPalette palette) => Material(
    color: widget.isBusy
        ? palette.accent.withValues(alpha: 0.5)
        : palette.accent,
    shape: const CircleBorder(),
    child: InkWell(
      onTap: _submit,
      customBorder: const CircleBorder(),
      child: SizedBox(
        width: Sizes.iconButton,
        height: Sizes.iconButton,
        child: Icon(
          Icons.arrow_upward_rounded,
          size: 19,
          color: palette.accentInk,
        ),
      ),
    ),
  );
}
