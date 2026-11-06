import 'package:biblereference/biblereference.dart';
import 'package:collection/collection.dart';

extension ReferenceExtensions on Reference {
  Reference simplify() {
    final simplifiedSegments = segments.simplify();
    return Reference(book, segments: simplifiedSegments);
  }
}

extension ReferenceSegmentExtensions on ReferenceSegment {
  ReferencePoint get computedStart =>
      start.verse == 0 ? ReferencePoint(start.chapter, 1) : start;

  ReferencePoint get computedEnd =>
      end.verse == 0 ? ReferencePoint(end.chapter, 0x7FFFFFFF) : end;

  bool get isSingleVerse => computedStart == computedEnd;

  bool hasIntersection(ReferenceSegment other) {
    return (computedStart <= other.computedStart &&
            other.computedStart <= computedEnd) ||
        (other.computedStart <= computedStart &&
            computedStart <= other.computedEnd);
  }

  bool isInside(ReferenceSegment other) {
    return other.computedStart <= computedStart &&
        other.computedEnd >= computedEnd;
  }

  bool isContinuous(ReferenceSegment segment2) {
    final (first, second) =
        this < segment2 ? (this, segment2) : (segment2, this);

    if (first.end.chapter == second.start.chapter &&
        first.end.verse != 0 &&
        second.start.verse != 0 &&
        second.start.verse - first.end.verse == 1) {
      return true;
    } else if (first.end.chapter != second.start.chapter &&
        first.end.verse == 0 &&
        second.start.verse == 0 &&
        second.start.chapter - first.end.chapter == 1) {
      return true;
    } else if (first.end.chapter != second.start.chapter &&
        first.end.verse == 0 &&
        second.start.verse == 1) {
      return true;
    } else {
      return false;
    }
  }

  List<ReferenceSegment> union(ReferenceSegment other) {
    // Case 1: segment2 is inside segment1
    if (other.isInside(this)) {
      return [this];
    }
    // Case 2: segment1 is inside segment2
    else if (isInside(other)) {
      return [other];
    }
    // Case 3: segment1 and segment2  intersect or continuous
    else if (hasIntersection(other) || isContinuous(other)) {
      var newStart = computedStart < other.computedStart ? start : other.start;
      final newEnd = computedEnd > other.computedEnd ? end : other.end;

      if (newStart.verse == 0 && newEnd.verse != 0) {
        newStart = ReferencePoint(newStart.chapter, 1);
      }

      return [ReferenceSegment(newStart, newEnd)];
    }
    // Case 4: segment1 and segment2 do not intersect and are not continuous
    else {
      return [this, other];
    }
  }
}

extension ReferenceSegmentListExtensions on List<ReferenceSegment> {
  String stringify() {
    final buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      if (i == 0) {
        buffer.write(this[i].toString());
      } else {
        if (this[i - 1].start.chapter == this[i - 1].end.chapter &&
            this[i].start.chapter == this[i].end.chapter &&
            this[i - 1].start.chapter == this[i].start.chapter &&
            this[i - 1].start.verse != 0 &&
            this[i].start.verse != 0) {
          if (this[i].start.verse == this[i].end.verse) {
            buffer.write(",${this[i].start.verse}");
          } else {
            buffer.write(",${this[i].start.verse}-${this[i].end.verse}");
          }
        } else {
          buffer.write(";${this[i]}");
        }
      }
    }
    return buffer.toString();
  }

  List<ReferenceSegment> simplify() {
    var unionSegments = toSet().sorted();
    do {
      for (var i = 0; i < unionSegments.length; i++) {
        var i1 = unionSegments[i];
        var i2 = unionSegments
            .where((i) => i != i1)
            .firstWhereOrNull(
              (i) => i1.hasIntersection(i) || i1.isContinuous(i),
            );
        if (i2 != null) {
          var union = i1.union(i2);
          unionSegments = [
            ...union,
            ...unionSegments.where((i) => i != i1 && i != i2),
          ];
          break;
        }
      }
    } while (unionSegments.any(
      (i) => unionSegments
          .where((j) => i != j)
          .any((j) => i.hasIntersection(j) || i.isContinuous(j)),
    ));

    return [...unionSegments.sorted()];
  }
}
