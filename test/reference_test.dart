import 'package:biblebooks/biblebooks.dart';
import 'package:biblereference/biblereference.dart';
import 'package:test/test.dart';

import 'generators.dart';

void main() {
  group('Single Chapter ToString', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1' ==
              Reference(
                value.book,
                segments: [ReferenceSegment.singleChapter(1)],
              ).toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Multiple Chapters ToString', () {
    for (var value in bibleBookAppLocaleValues) {
      final maxChapter = BibleBooksHelper().getMaxChapter(value.book);
      if (maxChapter != null && maxChapter > 1) {
        test('${value.book.name} ${value.locale.name}', () {
          final name = BibleBooksHelper().getName(
            value.book,
            locale: value.locale,
          );
          expect(
            '$name 1-2' ==
                Reference(
                  value.book,
                  segments: [ReferenceSegment.multipleChapters(1, 2)],
                ).toLocalizedString(locale: value.locale),
            isTrue,
          );
        });
      }
    }
  });

  group('Single Verse ToString', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1:1' ==
              Reference(
                value.book,
                segments: [ReferenceSegment.singleVerse(1, 1)],
              ).toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Continuous Verses ToString', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1:1-5' ==
              Reference(
                value.book,
                segments: [ReferenceSegment.multipleVerses(1, 1, 5)],
              ).toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Discontinuous Verses ToString', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1:1,5' ==
              Reference(
                value.book,
                segments: [
                  ReferenceSegment.singleVerse(1, 1),
                  ReferenceSegment.singleVerse(1, 5),
                ],
              ).toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Mixed ToString', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1:1,5,7-9,11,13' ==
              Reference(
                value.book,
                segments: [
                  ReferenceSegment.singleVerse(1, 1),
                  ReferenceSegment.singleVerse(1, 5),
                  ReferenceSegment.multipleVerses(1, 7, 9),
                  ReferenceSegment.singleVerse(1, 11),
                  ReferenceSegment.singleVerse(1, 13),
                ],
              ).toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  test('== operator', () {
    expect(
      Reference(
            BibleBook.genesis,
            segments: [
              ReferenceSegment.multipleVerses(1, 1, 5),
              ReferenceSegment.multipleVerses(2, 1, 3),
            ],
          ) ==
          BibleReferenceParser().parse("Genesis 1:1-5;2:1-3"),
      isTrue,
    );
  });

  test('!= operator', () {
    expect(
      Reference(
            BibleBook.genesis,
            segments: [
              ReferenceSegment.multipleVerses(1, 1, 5),
              ReferenceSegment.multipleVerses(2, 1, 3),
            ],
          ) !=
          BibleReferenceParser().parse("Genesis 1:1,5;2:1,3"),
      isTrue,
    );
  });
}
