import 'package:biblebooks/biblebooks.dart';
import 'package:biblereference/biblereference.dart';

final bibleBookAppLocaleValues = [
  for (var book in BibleBook.values) ...[
    for (var locale in AppLocale.values) ...[(book: book, locale: locale)],
  ],
];

typedef BookRomanNumeralValue =
    ({AppLocale locale, BibleBook book, String bookTest});

final List<BookRomanNumeralValue> bookRomanNumeralValues = [
  (locale: AppLocale.en, book: BibleBook.john1, bookTest: 'I John'),
  (locale: AppLocale.en, book: BibleBook.john2, bookTest: 'II John'),
  (locale: AppLocale.en, book: BibleBook.john3, bookTest: 'III John'),
  (locale: AppLocale.en, book: BibleBook.john1, bookTest: 'First John'),
  (locale: AppLocale.en, book: BibleBook.john2, bookTest: 'Second John'),
  (locale: AppLocale.en, book: BibleBook.john3, bookTest: 'Third John'),
  (locale: AppLocale.tgl, book: BibleBook.john1, bookTest: 'I Juan'),
  (locale: AppLocale.tgl, book: BibleBook.john2, bookTest: 'II Juan'),
  (locale: AppLocale.tgl, book: BibleBook.john3, bookTest: 'III Juan'),
];

typedef HasIntersectionValue =
    ({
      ReferenceSegment segment1,
      ReferenceSegment segment2,
      bool hasIntersection,
    });

final List<HasIntersectionValue> hasIntersectionValues = [
  (
    segment1: ReferenceSegment.singleChapter(1),
    segment2: ReferenceSegment.singleChapter(1),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment.singleVerse(1, 1),
    segment2: ReferenceSegment.singleVerse(1, 1),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment.multipleVerses(1, 1, 4),
    segment2: ReferenceSegment.multipleVerses(1, 1, 4),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment.singleVerse(1, 2),
    segment2: ReferenceSegment.multipleVerses(1, 1, 3),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment.singleVerse(1, 1),
    segment2: ReferenceSegment.singleChapter(1),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment.multipleVerses(1, 1, 3),
    segment2: ReferenceSegment.singleChapter(1),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment.singleChapter(1),
    segment2: ReferenceSegment.singleVerse(1, 1),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment.multipleVerses(1, 1, 3),
    segment2: ReferenceSegment.singleVerse(1, 1),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(2, 4)),
    segment2: ReferenceSegment(ReferencePoint(1, 8), ReferencePoint(1, 15)),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment(ReferencePoint(1, 8), ReferencePoint(1, 15)),
    segment2: ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(2, 4)),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(1, 15)),
    segment2: ReferenceSegment(ReferencePoint(1, 8), ReferencePoint(2, 4)),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment(ReferencePoint(1, 8), ReferencePoint(2, 4)),
    segment2: ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(1, 15)),
    hasIntersection: true,
  ),
  (
    segment1: ReferenceSegment.singleVerse(1, 1),
    segment2: ReferenceSegment.singleVerse(1, 3),
    hasIntersection: false,
  ),
];

final List<String> invalidTextValues = [
  // Leading and Trailing -, ;, and ,
  "Genesis 1:;1",
  "Genesis 1:,1",
  "Genesis 1:-1",
  "Genesis 1:1;",
  "Genesis 1:1,",
  "Genesis 1:1-",

  // Empty citations, segments, or ranges
  "Genesis 1:1;;2:1",
  "Genesis 1:1,,3",
  "Genesis 1:1--2",

  // Negative and zero values
  "Genesis -1",
  "Genesis 0",
  "Genesis 1:0",
  "Genesis 0:1",

  // Invalid Book names
  "ABC 1",

  // Invalid types
  "1 1:1",
  "Genesis a:1",
  "Genesis 1:a",
];

typedef IsContinuousValue =
    ({ReferenceSegment segment1, ReferenceSegment segment2, bool isContinuous});

final List<IsContinuousValue> isContinuousValues = [
  (
    segment1: ReferenceSegment.singleVerse(1, 1),
    segment2: ReferenceSegment.singleVerse(1, 2),
    isContinuous: true,
  ),
  (
    segment1: ReferenceSegment.singleVerse(1, 1),
    segment2: ReferenceSegment.multipleVerses(1, 2, 4),
    isContinuous: true,
  ),
  (
    segment1: ReferenceSegment.multipleVerses(1, 1, 3),
    segment2: ReferenceSegment.singleVerse(1, 4),
    isContinuous: true,
  ),
  (
    segment1: ReferenceSegment.singleChapter(1),
    segment2: ReferenceSegment.singleVerse(2, 1),
    isContinuous: true,
  ),
  (
    segment1: ReferenceSegment.singleChapter(1),
    segment2: ReferenceSegment.singleChapter(2),
    isContinuous: true,
  ),
  (
    segment1: ReferenceSegment.multipleVerses(1, 1, 2),
    segment2: ReferenceSegment.singleVerse(1, 5),
    isContinuous: false,
  ),
];

typedef IsInsideValue =
    ({ReferenceSegment segment1, ReferenceSegment segment2, bool isInside});

final List<IsInsideValue> isInsideValues = [
  (
    segment1: ReferenceSegment.singleChapter(1),
    segment2: ReferenceSegment.singleChapter(1),
    isInside: true,
  ),
  (
    segment1: ReferenceSegment.singleVerse(1, 1),
    segment2: ReferenceSegment.singleVerse(1, 1),
    isInside: true,
  ),
  (
    segment1: ReferenceSegment.multipleVerses(1, 1, 4),
    segment2: ReferenceSegment.multipleVerses(1, 1, 4),
    isInside: true,
  ),
  (
    segment1: ReferenceSegment.singleVerse(1, 2),
    segment2: ReferenceSegment.multipleVerses(1, 1, 3),
    isInside: true,
  ),
  (
    segment1: ReferenceSegment.singleVerse(1, 1),
    segment2: ReferenceSegment.singleChapter(1),
    isInside: true,
  ),
  (
    segment1: ReferenceSegment.multipleVerses(1, 1, 3),
    segment2: ReferenceSegment.singleChapter(1),
    isInside: true,
  ),
];

typedef PointValue =
    ({
      String text,
      int? maxChapter,
      int? chapterOverride,
      ReferencePoint? point,
      bool expected,
    });

final List<PointValue> pointValues = [
  (
    text: "1:1",
    maxChapter: null,
    chapterOverride: null,
    point: ReferencePoint(1, 1),
    expected: true,
  ),
  (
    text: "1:1",
    maxChapter: 1,
    chapterOverride: null,
    point: ReferencePoint(1, 1),
    expected: true,
  ),
  (
    text: "1:1",
    maxChapter: null,
    chapterOverride: 2,
    point: ReferencePoint(1, 1),
    expected: true,
  ),
  (
    text: "2",
    maxChapter: null,
    chapterOverride: null,
    point: ReferencePoint.wholeChapter(2),
    expected: true,
  ),
  (
    text: "2",
    maxChapter: 1,
    chapterOverride: null,
    point: ReferencePoint(1, 2),
    expected: true,
  ),
  (
    text: "3",
    maxChapter: 2,
    chapterOverride: null,
    point: null,
    expected: false,
  ),
  (
    text: "2",
    maxChapter: null,
    chapterOverride: 1,
    point: ReferencePoint(1, 2),
    expected: true,
  ),
];

typedef SegmentValue =
    ({
      String text,
      int? maxChapter,
      List<ReferenceSegment> segments,
      bool expected,
    });

final List<SegmentValue> segmentValues = [
  (
    text: "1:1",
    maxChapter: null,
    segments: [ReferenceSegment.singleVerse(1, 1)],
    expected: true,
  ),
  (
    text: "1:1",
    maxChapter: 1,
    segments: [ReferenceSegment.singleVerse(1, 1)],
    expected: true,
  ),
  (
    text: "2:1",
    maxChapter: 1,
    segments: [ReferenceSegment.singleVerse(1, 1)],
    expected: false,
  ),
  (
    text: "1:1,3",
    maxChapter: null,
    segments: [
      ReferenceSegment.singleVerse(1, 1),
      ReferenceSegment.singleVerse(1, 3),
    ],
    expected: true,
  ),
  (
    text: "1:1,3",
    maxChapter: 1,
    segments: [
      ReferenceSegment.singleVerse(1, 1),
      ReferenceSegment.singleVerse(1, 3),
    ],
    expected: true,
  ),
  (
    text: "2:1,3",
    maxChapter: 1,
    segments: [
      ReferenceSegment.singleVerse(1, 1),
      ReferenceSegment.singleVerse(1, 3),
    ],
    expected: false,
  ),
  (
    text: "1:1-3",
    maxChapter: null,
    segments: [ReferenceSegment.multipleVerses(1, 1, 3)],
    expected: true,
  ),
  (
    text: "1:1-3",
    maxChapter: 1,
    segments: [ReferenceSegment.multipleVerses(1, 1, 3)],
    expected: true,
  ),
  (
    text: "2:1-3",
    maxChapter: 1,
    segments: [ReferenceSegment.multipleVerses(1, 1, 3)],
    expected: false,
  ),
  (
    text: "1:1,3-5",
    maxChapter: null,
    segments: [
      ReferenceSegment.singleVerse(1, 1),
      ReferenceSegment.multipleVerses(1, 3, 5),
    ],
    expected: true,
  ),
  (
    text: "1:1,3-5",
    maxChapter: 1,
    segments: [
      ReferenceSegment.singleVerse(1, 1),
      ReferenceSegment.multipleVerses(1, 3, 5),
    ],
    expected: true,
  ),
  (
    text: "2:1,3-5",
    maxChapter: 1,
    segments: [
      ReferenceSegment.singleVerse(1, 1),
      ReferenceSegment.multipleVerses(1, 3, 5),
    ],
    expected: false,
  ),
  (
    text: "1:1-3,5-7",
    maxChapter: null,
    segments: [
      ReferenceSegment.multipleVerses(1, 1, 3),
      ReferenceSegment.multipleVerses(1, 5, 7),
    ],
    expected: true,
  ),
  (
    text: "1:1-3,5-7",
    maxChapter: 1,
    segments: [
      ReferenceSegment.multipleVerses(1, 1, 3),
      ReferenceSegment.multipleVerses(1, 5, 7),
    ],
    expected: true,
  ),
  (
    text: "2:1-3,5-7",
    maxChapter: 1,
    segments: [
      ReferenceSegment.multipleVerses(1, 1, 3),
      ReferenceSegment.multipleVerses(1, 5, 7),
    ],
    expected: false,
  ),
];

typedef ReferenceSegmentValue =
    ({
      List<ReferenceSegment> segments,
      List<ReferenceSegment> simplifiedSegments,
    });

final List<ReferenceSegmentValue> referenceSegmentValues = [
  (
    segments: [
      ReferenceSegment.singleChapter(1),
      ReferenceSegment.singleChapter(1),
    ],
    simplifiedSegments: [ReferenceSegment.singleChapter(1)],
  ),
  (
    segments: [
      ReferenceSegment.singleVerse(1, 1),
      ReferenceSegment.singleVerse(1, 1),
    ],
    simplifiedSegments: [ReferenceSegment.singleVerse(1, 1)],
  ),
  (
    segments: [
      ReferenceSegment.multipleVerses(1, 1, 3),
      ReferenceSegment.multipleVerses(1, 1, 3),
    ],
    simplifiedSegments: [ReferenceSegment.multipleVerses(1, 1, 3)],
  ),
  (
    segments: [
      ReferenceSegment.singleChapter(1),
      ReferenceSegment.singleVerse(1, 1),
    ],
    simplifiedSegments: [ReferenceSegment.singleChapter(1)],
  ),
  (
    segments: [
      ReferenceSegment.multipleVerses(1, 1, 3),
      ReferenceSegment.singleVerse(1, 1),
    ],
    simplifiedSegments: [ReferenceSegment.multipleVerses(1, 1, 3)],
  ),
  (
    segments: [
      ReferenceSegment.singleVerse(1, 1),
      ReferenceSegment.singleVerse(1, 2),
      ReferenceSegment.singleVerse(1, 3),
    ],
    simplifiedSegments: [ReferenceSegment.multipleVerses(1, 1, 3)],
  ),
  (
    segments: [
      ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(2, 4)),
      ReferenceSegment(ReferencePoint(1, 8), ReferencePoint(1, 15)),
    ],
    simplifiedSegments: [
      ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(2, 4)),
    ],
  ),
  (
    segments: [
      ReferenceSegment(ReferencePoint(1, 8), ReferencePoint(1, 15)),
      ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(2, 4)),
    ],
    simplifiedSegments: [
      ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(2, 4)),
    ],
  ),
  (
    segments: [
      ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(1, 15)),
      ReferenceSegment(ReferencePoint(1, 8), ReferencePoint(2, 4)),
    ],
    simplifiedSegments: [
      ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(2, 4)),
    ],
  ),
  (
    segments: [
      ReferenceSegment(ReferencePoint(1, 8), ReferencePoint(2, 4)),
      ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(1, 15)),
    ],
    simplifiedSegments: [
      ReferenceSegment(ReferencePoint(1, 5), ReferencePoint(2, 4)),
    ],
  ),
  (
    segments: [
      ReferenceSegment.singleVerse(1, 1),
      ReferenceSegment.singleVerse(1, 3),
    ],
    simplifiedSegments: [
      ReferenceSegment.singleVerse(1, 1),
      ReferenceSegment.singleVerse(1, 3),
    ],
  ),
  (
    segments: [
      ReferenceSegment(ReferencePoint(1, 2), ReferencePoint(2, 4)),
      ReferenceSegment.singleVerse(1, 2),
      ReferenceSegment.multipleVerses(2, 1, 5),
    ],
    simplifiedSegments: [
      ReferenceSegment(ReferencePoint(1, 2), ReferencePoint(2, 5)),
    ],
  ),
  (
    segments: [
      ReferenceSegment.singleChapter(1),
      ReferenceSegment.singleChapter(2),
    ],
    simplifiedSegments: [ReferenceSegment.multipleChapters(1, 2)],
  ),
  (
    segments: [
      ReferenceSegment.singleChapter(1),
      ReferenceSegment.singleVerse(2, 1),
    ],
    simplifiedSegments: [
      ReferenceSegment(ReferencePoint(1, 1), ReferencePoint(2, 1)),
    ],
  ),
];
