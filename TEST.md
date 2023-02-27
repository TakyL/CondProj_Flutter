# flutter_calendrier

A new Flutter project.
## TESTS 

Tous les tests sont situés dans le dossier test (en dehors du dossier couramment utilisé le dossier lib).

Ce dossier contient trois autres dossiers : Units/Acceptances/Integrations
Ces trois dossiers font références aux 3 types de tests que l'on va appliquer sur le projet.

Au sein de chacun de ces dossiers, l'on retrouve des dossiers qui font juste référence au path dans le lib, histoire de s'y retrouver au niveau des fichiers et des classes.Ces classes doivent contenir un void main().<br>
Pour la dénomination de fichiers/classes de tests dans le dossier Units+Acceptances, je conseille de reprendre le nom du fichier à l'identique.
Pour les intégrations, étant donné qu'ils vont représenter une partie du workflow de l'app, le nom du fichier pourra faire référence à la partie du workflow testé.

## TESTS Unitaires 

C'est juste un main à lancer, pour l'execution de tests, le procédé reste similaire à JUNIT mais il y a de toute de même quelques subtilités à connaitre.
Il faut séparer deux cas: si la classe de tests est une classe métier ou si la classe est un widget.
Dans le premier cas, rien de particulier car c'est similaire à JUNIT.<br>
### Cas classes non widget
Ex: <br>
 ```
 group('positivetest', () {
    test('test int', () {
      int a = 1;
      expect(a, isA<int>());
    });
    test('test value', () {
      int a = 1;
      expect(a, equals(1));
    });

});
 ```

<br>
Explication :
Il est possible de grouper de tests. <br> 
Idées de catégories de groupes: <br>

* Positive tests: These are tests that verify that the code behaves correctly when given valid input or conditions. Positive tests are used to ensure that the code meets its basic requirements and performs as expected.

* Negative tests: These are tests that verify that the code behaves correctly when given invalid input or conditions. Negative tests are used to ensure that the code handles errors and edge cases appropriately, and does not crash or produce unexpected results.

* Boundary tests: These are tests that verify that the code behaves correctly at the boundaries of its input or output range. For example, if a function takes an integer input, boundary tests might check what happens when the input is 0 or the maximum or minimum value for the data type.

* Error handling tests: These are tests that verify that the code handles errors and exceptions correctly, by simulating various error conditions and verifying that the code responds appropriately.

**Ce code effectue un test groupé qui contient deux tests. Le premier test vérifie si ma variable est bien de type int et la seconde vérifie sa valeur.Oublier pas de rajouter l'attribut key dans vos widgets.**

### Cas widget

Etant donné que c'est l'une des particularités du flutter, il y a bien évident des outils pour faire des tests unitaires sur des widgets. 
```
 testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: Counter()));

    // Verify that our counter starts at 0.
    expect(find.text('Count: 0'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Count: 1'), findsOneWidget);
  });
```

Lorsque l'on fait des tests sur des widgets, le mot clé à utiliser partout c'est tester. Avec ce mot là, on peut faire tout ce qu'on a besoin : Recherche des widgets au sein du widget et récupérer leur valeur, gérer les erreurs, gérer/simuler des saisies de l'utilsateurs, ou encore de l'async. 
<br>
Tout comme avant on peut grouper les tests, la syntaxe reste identique. L'exemple que j'ai fourni vérifie la présence de tous les widgets et de leur valeur dans le sample de flutter de base.

## TESTS Acceptation 

Vu que c'est que des widgets, on va juste abuser de tester.
Comme précisé plus haut, penser dans la mesurer du possible d'ajouter l'attribut Key dans vos classes widgets car elles permettront d'identifier les widgets dans les tests.
