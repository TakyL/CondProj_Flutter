import 'package:flutter_calendrier/metiers/user_class.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {

  group('User', () {


    test('returns a new User with updated values when copyWith is called', () {
      final user = User(id: 1, nom: 'Smith', mel: 'smith@example.com', pseudo: 'smithy');
      final updatedUser = user.copyWith(nom: 'Doe');

      expect(user.id, equals(updatedUser.id));
      expect(updatedUser.nom, equals('Doe'));
      expect(user.mel, equals(updatedUser.mel));
      expect(user.pseudo, equals(updatedUser.pseudo));
    });
  });
}
