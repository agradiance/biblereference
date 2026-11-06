import 'package:biblebooks/biblebooks.dart';
import 'package:biblereference/biblereference.dart';
import 'package:biblereference/src/extensions.dart';
import 'package:collection/collection.dart';
import 'package:test/test.dart';

import 'generators.dart';

void main() {
  group('Book', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          name ==
              BibleReferenceParser()
                  .parse(name ?? '', locale: value.locale)
                  .toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Book Roman Numerals', () {
    for (var value in bookRomanNumeralValues) {
      test('${value.locale.name} ${value.book.name} ${value.bookTest}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          name ==
              BibleReferenceParser()
                  .parse(value.bookTest, locale: value.locale)
                  .toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Book Chapter', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1' ==
              BibleReferenceParser()
                  .parse('$name 1', locale: value.locale)
                  .toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Book Chapter-Chapter', () {
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
                BibleReferenceParser()
                    .parse('$name 1-2', locale: value.locale)
                    .toLocalizedString(locale: value.locale),
            isTrue,
          );
        });
      }
    }
  });

  group('Book Chapter:Verse', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1:1' ==
              BibleReferenceParser()
                  .parse('$name 1:1', locale: value.locale)
                  .toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Book Chapter:Verse-Verse', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1:1-5' ==
              BibleReferenceParser()
                  .parse('$name 1:1-5', locale: value.locale)
                  .toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Book Chapter:Verse,Verse', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1:1,5' ==
              BibleReferenceParser()
                  .parse('$name 1:1,5', locale: value.locale)
                  .toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Book Chapter:Verse,Verse-Verse', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1:1,5-7' ==
              BibleReferenceParser()
                  .parse('$name 1:1,5-7', locale: value.locale)
                  .toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Book Chapter:Verse-Verse,Verse', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1:1-3,8' ==
              BibleReferenceParser()
                  .parse('$name 1:1-3,8', locale: value.locale)
                  .toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Book Chapter:Verse-Verse,Verse-Verse', () {
    for (var value in bibleBookAppLocaleValues) {
      test('${value.book.name} ${value.locale.name}', () {
        final name = BibleBooksHelper().getName(
          value.book,
          locale: value.locale,
        );
        expect(
          '$name 1:1-5,8-10' ==
              BibleReferenceParser()
                  .parse('$name 1:1-5,8-10', locale: value.locale)
                  .toLocalizedString(locale: value.locale),
          isTrue,
        );
      });
    }
  });

  group('Book Chapter:Verse-Verse;Chapter:Verse-Verse', () {
    for (var value in bibleBookAppLocaleValues) {
      final maxChapter = BibleBooksHelper().getMaxChapter(value.book);
      if (maxChapter != null && maxChapter > 1) {
        test('${value.book.name} ${value.locale.name}', () {
          final name = BibleBooksHelper().getName(
            value.book,
            locale: value.locale,
          );
          expect(
            '$name 1:1-5;2:1-3' ==
                BibleReferenceParser()
                    .parse('$name 1:1-5;2:1-3', locale: value.locale)
                    .toLocalizedString(locale: value.locale),
            isTrue,
          );
        });
      }
    }
  });

  group('Book Chapter:Verse-Chapter:Verse', () {
    for (var value in bibleBookAppLocaleValues) {
      final maxChapter = BibleBooksHelper().getMaxChapter(value.book);
      if (maxChapter != null && maxChapter > 1) {
        test('${value.book.name} ${value.locale.name}', () {
          final name = BibleBooksHelper().getName(
            value.book,
            locale: value.locale,
          );
          expect(
            '$name 1:5-2:3' ==
                BibleReferenceParser()
                    .parse('$name 1:5-2:3', locale: value.locale)
                    .toLocalizedString(locale: value.locale),
            isTrue,
          );
        });
      }
    }
  });

  group('Book Verse (for single-chapter books)', () {
    for (var value in bibleBookAppLocaleValues) {
      final maxChapter = BibleBooksHelper().getMaxChapter(value.book);
      if (maxChapter != null && maxChapter == 1) {
        test('${value.book.name} ${value.locale.name}', () {
          final name = BibleBooksHelper().getName(
            value.book,
            locale: value.locale,
          );
          expect(
            '$name 1:2' ==
                BibleReferenceParser()
                    .parse('$name 2', locale: value.locale)
                    .toLocalizedString(locale: value.locale),
            isTrue,
          );
        });
      }
    }
  });

  group('Book Verse-Verse (for single-chapter books)', () {
    for (var value in bibleBookAppLocaleValues) {
      final maxChapter = BibleBooksHelper().getMaxChapter(value.book);
      if (maxChapter != null && maxChapter == 1) {
        test('${value.book.name} ${value.locale.name}', () {
          final name = BibleBooksHelper().getName(
            value.book,
            locale: value.locale,
          );
          expect(
            '$name 1:1-2' ==
                BibleReferenceParser()
                    .parse('$name 1-2', locale: value.locale)
                    .toLocalizedString(locale: value.locale),
            isTrue,
          );
        });
      }
    }
  });

  group('Book Verse,Verse (for single-chapter books)', () {
    for (var value in bibleBookAppLocaleValues) {
      final maxChapter = BibleBooksHelper().getMaxChapter(value.book);
      if (maxChapter != null && maxChapter == 1) {
        test('${value.book.name} ${value.locale.name}', () {
          final name = BibleBooksHelper().getName(
            value.book,
            locale: value.locale,
          );
          expect(
            '$name 1:1,2' ==
                BibleReferenceParser()
                    .parse('$name 1,2', locale: value.locale)
                    .toLocalizedString(locale: value.locale),
            isTrue,
          );
        });
      }
    }
  });

  group('Book Verse-Verse,Verse (for single-chapter books)', () {
    for (var value in bibleBookAppLocaleValues) {
      final maxChapter = BibleBooksHelper().getMaxChapter(value.book);
      if (maxChapter != null && maxChapter == 1) {
        test('${value.book.name} ${value.locale.name}', () {
          final name = BibleBooksHelper().getName(
            value.book,
            locale: value.locale,
          );
          expect(
            '$name 1:1-3,5' ==
                BibleReferenceParser()
                    .parse('$name 1-3,5', locale: value.locale)
                    .toLocalizedString(locale: value.locale),
            isTrue,
          );
        });
      }
    }
  });

  group('Book Verse,Verse-Verse (for single-chapter books)', () {
    for (var value in bibleBookAppLocaleValues) {
      final maxChapter = BibleBooksHelper().getMaxChapter(value.book);
      if (maxChapter != null && maxChapter == 1) {
        test('${value.book.name} ${value.locale.name}', () {
          final name = BibleBooksHelper().getName(
            value.book,
            locale: value.locale,
          );
          expect(
            '$name 1:1,3-5' ==
                BibleReferenceParser()
                    .parse('$name 1,3-5', locale: value.locale)
                    .toLocalizedString(locale: value.locale),
            isTrue,
          );
        });
      }
    }
  });

  group('Invalid Text for Parsing', () {
    for (var value in invalidTextValues) {
      test(value, () {
        expect(() => BibleReferenceParser().parse(value), throwsException);
      });
    }
  });

  group('Segment Only Parsing', () {
    for (var value in segmentValues) {
      test(
        '${value.text} ${value.segments.stringify()} ${value.maxChapter} ${value.expected}',
        () {
          final result =
              value.maxChapter != null
                  ? BibleReferenceParser().tryParseSegments(
                    value.text,
                    maxChapter: value.maxChapter,
                  )
                  : BibleReferenceParser().tryParseSegments(value.text);
          if (value.expected) {
            expect(ListEquality().equals(result, value.segments), isTrue);
          } else {
            expect(result == null, isTrue);
          }
          expect((result != null) == value.expected, isTrue);
        },
      );
    }
  });

  group('Point Only Parsing', () {
    for (var value in pointValues) {
      test(
        '${value.text} ${value.point} ${value.maxChapter} ${value.chapterOverride} ${value.expected}',
        () {
          final result = BibleReferenceParser().tryParsePoint(
            value.text,
            maxChapter: value.maxChapter,
            chapterOverride: value.chapterOverride,
          );
          if (value.expected) {
            expect(result == value.point, isTrue);
          } else {
            expect(result, isNull);
          }
          expect((result != null) == value.expected, isTrue);
        },
      );
    }
  });
}
