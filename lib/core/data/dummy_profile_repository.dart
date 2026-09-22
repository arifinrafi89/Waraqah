import '../models/profile.dart';
import '../repositories/profile_repository.dart';

class DummyProfileRepository implements ProfileRepository {
  static const List<Profile> _seed = [
    Profile(
      id: 'profile-1',
      fullName: 'Rahinur Bin Naushad',
      university: 'Islamic University of Technology',
      studentId: '200041101',
      avatarUrl: 'https://placehold.co/120x120?text=RB',
    ),
    Profile(
      id: 'profile-2',
      fullName: 'Farhan Shahriyar Hossain',
      university: 'Islamic University of Technology',
      studentId: '200041102',
      avatarUrl: 'https://placehold.co/120x120?text=FS',
    ),
    Profile(
      id: 'profile-3',
      fullName: 'Al Mukit Muktafin',
      university: 'Islamic University of Technology',
      studentId: '200041103',
      avatarUrl: 'https://placehold.co/120x120?text=AM',
    ),
    Profile(
      id: 'profile-4',
      fullName: 'Arifin Rafi',
      university: 'Islamic University of Technology',
      studentId: '200041104',
      avatarUrl: 'https://placehold.co/120x120?text=AR',
    ),
    Profile(
      id: 'profile-5',
      fullName: 'Nusrat Jahan',
      university: 'Islamic University of Technology',
      studentId: '200041105',
      avatarUrl: 'https://placehold.co/120x120?text=NJ',
    ),
  ];

  final List<Profile> _profiles = [..._seed];

  @override
  Future<List<Profile>> getProfiles() async => List.unmodifiable(_profiles);
}
