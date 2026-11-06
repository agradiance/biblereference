import 'package:biblereference/src/reference.dart';
import 'package:test/test.dart';

void main() {
  group('Chapter <= 0', () {
    test('Chapter == 0', () {
      expect(() => ReferencePoint(0, 1), throwsArgumentError);
    });

    test('Chapter < 0', () {
      expect(() => ReferencePoint(-1, 1), throwsArgumentError);
    });
  });

  group('Verse < 0', () {
    test('Verse < 0', () {
      expect(() => ReferencePoint(1, -1), throwsArgumentError);
    });
  });

  group('== operator', () {
    test('True', () {
      expect(ReferencePoint(1, 1) == ReferencePoint(1, 1), isTrue);
    });

    test('False', () {
      expect(ReferencePoint(1, 1) == ReferencePoint(2, 2), isFalse);
    });
  });

  group('!= operator', () {
    test('True', () {
      expect(ReferencePoint(1, 1) != ReferencePoint(2, 2), isTrue);
    });

    test('False', () {
      expect(ReferencePoint(1, 1) != ReferencePoint(1, 1), isFalse);
    });
  });

  group('> operator', () {
    test('True', () {
      expect(ReferencePoint(1, 2) > ReferencePoint(1, 1), isTrue);
      expect(ReferencePoint(2, 1) > ReferencePoint(1, 2), isTrue);
    });

    test('False', () {
      expect(ReferencePoint(1, 1) > ReferencePoint(1, 1), isFalse);
      expect(ReferencePoint(1, 1) > ReferencePoint(1, 2), isFalse);
      expect(ReferencePoint(1, 2) > ReferencePoint(2, 1), isFalse);
    });
  });

  group('>= operator', () {
    test('True', () {
      expect(ReferencePoint(1, 2) >= ReferencePoint(1, 1), isTrue);
      expect(ReferencePoint(2, 1) >= ReferencePoint(1, 2), isTrue);
      expect(ReferencePoint(1, 1) >= ReferencePoint(1, 1), isTrue);
    });

    test('False', () {
      expect(ReferencePoint(1, 1) >= ReferencePoint(1, 2), isFalse);
      expect(ReferencePoint(1, 2) >= ReferencePoint(2, 1), isFalse);
    });
  });

  group('< operator', () {
    test('True', () {
      expect(ReferencePoint(1, 1) < ReferencePoint(1, 2), isTrue);
      expect(ReferencePoint(1, 2) < ReferencePoint(2, 1), isTrue);
    });

    test('False', () {
      expect(ReferencePoint(1, 1) < ReferencePoint(1, 1), isFalse);
      expect(ReferencePoint(1, 2) < ReferencePoint(1, 1), isFalse);
      expect(ReferencePoint(2, 1) < ReferencePoint(1, 2), isFalse);
    });
  });

  group('<= operator', () {
    test('True', () {
      expect(ReferencePoint(1, 1) <= ReferencePoint(1, 2), isTrue);
      expect(ReferencePoint(1, 2) <= ReferencePoint(2, 1), isTrue);
      expect(ReferencePoint(1, 1) <= ReferencePoint(1, 1), isTrue);
    });

    test('False', () {
      expect(ReferencePoint(1, 2) <= ReferencePoint(1, 1), isFalse);
      expect(ReferencePoint(2, 1) <= ReferencePoint(1, 2), isFalse);
    });
  });

  group('Whole Chapter ToString', () {
    test('Whole Chapter', () {
      expect(ReferencePoint(1, 0).toString() == '1', isTrue);
    });
  });

  group('Specific Verse ToString', () {
    test('Specific Verse', () {
      expect(ReferencePoint(1, 1).toString() == '1:1', isTrue);
    });
  });
}
