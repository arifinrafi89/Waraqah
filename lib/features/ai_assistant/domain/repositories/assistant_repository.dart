import '../entities/chat_message.dart';

/// The AI block's contract.
///
/// The Gemini key never reaches the app — the Go backend proxies the call and
/// injects the Waraqah catalog into the prompt, so recommendations stay inside
/// our own listings.
abstract interface class AssistantRepository {
  /// The greeting shown when the chat opens.
  Future<List<ChatMessage>> openConversation();

  /// Sends one user turn and returns the assistant's reply.
  Future<ChatMessage> ask(String prompt);
}
