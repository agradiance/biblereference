import 'package:biblereference/biblereference.dart';
import 'package:biblereference/src/extensions.dart';
import 'package:collection/collection.dart';
import 'package:test/test.dart';

import 'generators.dart';

void main() {
  test('Start Chapter > End Chapter', () {
    expect(() => ReferenceSegment.multipleChapters(2, 1), throwsArgumentError);
  });

  test('Start Verse > End Verse', () {
    expect(() => ReferenceSegment.multipleVerses(1, 2, 1), throwsArgumentError);
  });

  group('Start Verse == 0 ^ End Verse == 0', () {
    test('Start Verse == 0', () {
      expect(
        () => ReferenceSegment.multipleVerses(1, 0, 1),
        throwsArgumentError,
      );
    });

    test('End Verse == 0', () {
      expect(
        () => ReferenceSegment.multipleVerses(1, 1, 0),
        throwsArgumentError,
      );
    });
  });

  group('== operator', () {
    test('True', () {
      expect(
        ReferenceSegment.multipleChapters(1, 1) ==
            ReferenceSegment.multipleChapters(1, 1),
        isTrue,
      );
    });

    test('False', () {
      expect(
        ReferenceSegment.multipleChapters(1, 1) ==
            ReferenceSegment.multipleChapters(2, 2),
        isFalse,
      );
    });
  });

  group('!= operator', () {
    test('True', () {
      expect(
        ReferenceSegment.multipleChapters(1, 1) !=
            ReferenceSegment.multipleChapters(1, 2),
        isTrue,
      );
    });

    test('False', () {
      expect(
        ReferenceSegment.multipleChapters(1, 1) !=
            ReferenceSegment.multipleChapters(1, 1),
        isFalse,
      );
    });
  });

  test('Single Chapter ToString', () {
    expect(ReferenceSegment.singleChapter(1).toString() == '1', isTrue);
  });

  test('Multiple Chapters ToString', () {
    expect(ReferenceSegment.multipleChapters(1, 3).toString() == '1-3', isTrue);
  });

  test('Single Verse ToString', () {
    expect(ReferenceSegment.singleVerse(1, 1).toString() == '1:1', isTrue);
  });

  test('Multiple Verses ToString', () {
    expect(
      ReferenceSegment.multipleVerses(1, 1, 5).toString() == '1:1-5',
      isTrue,
    );
  });

  group('Is Inside', () {
    for (var value in isInsideValues) {
      test('${value.segment1} ${value.segment2} ${value.isInside}', () {
        expect(
          value.segment1.isInside(value.segment2) == value.isInside,
          isTrue,
        );
      });
    }
  });

  group('Has Intersection', () {
    for (var value in hasIntersectionValues) {
      test('${value.segment1} ${value.segment2} ${value.hasIntersection}', () {
        expect(
          value.segment1.hasIntersection(value.segment2) ==
              value.hasIntersection,
          isTrue,
        );
      });
    }
  });

  group('Is Continuous', () {
    for (var value in isContinuousValues) {
      test('${value.segment1} ${value.segment2} ${value.isContinuous}', () {
        expect(
          value.segment1.isContinuous(value.segment2) == value.isContinuous,
          isTrue,
        );
      });
    }
  });

  group('Simplify Segments', () {
    for (var value in referenceSegmentValues) {
      test('${value.segments} ${value.simplifiedSegments}', () {
        expect(
          ListEquality().equals(
            value.segments.simplify(),
            value.simplifiedSegments,
          ),
          isTrue,
        );
      });
    }
  });
}
