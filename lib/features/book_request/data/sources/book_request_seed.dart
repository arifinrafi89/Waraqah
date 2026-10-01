import '../models/book_request_model.dart';

/// Requests other readers already made: one for the reader's own Atomic
/// Habits, and demand for Calculus.
List<BookRequestModel> bookRequestSeed(DateTime now) => [
  BookRequestModel(
    id: 'rq-s1',
    title: 'Atomic Habits',
    bookId: 'bk-atomic',
    maxPriceBdt: 400,
    note: 'Any condition is fine.',
    createdAt: now.subtract(const Duration(hours: 6)),
    requesterId: 'p-rafi',
  ),
  BookRequestModel(
    id: 'rq-s2',
    title: 'Calculus: Early Transcendentals',
    author: 'James Stewart',
    bookId: 'bk-calculus',
    maxPriceBdt: 900,
    createdAt: now.subtract(const Duration(days: 1)),
    requesterId: 'p-mahi',
  ),
  BookRequestModel(
    id: 'rq-s3',
    title: 'Calculus: Early Transcendentals',
    bookId: 'bk-calculus',
    createdAt: now.subtract(const Duration(days: 2)),
    requesterId: 'p-sadia',
  ),
];
