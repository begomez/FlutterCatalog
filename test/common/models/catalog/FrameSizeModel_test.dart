import 'package:flutter_catalog/common/models/catalog/FrameSizeModel.dart';
import 'package:test/test.dart';


void main() {
  test("When min then has 15.0 value", () {
    final FrameSizeModel frame = FrameSizeModel.min();

    expect(frame.size, FrameSizeModel.MIN_FRAME_SIZE);
  });


  test("When max then has 21.0 value", () {
    final FrameSizeModel frame = FrameSizeModel.max();

    expect(frame.size, FrameSizeModel.MAX_FRAME_SIZE);
  });

  test("When size out of range then invalid", () {
    final FrameSizeModel frame = FrameSizeModel(size: 2);

    expect(frame.validate(), false);
  });

  test("When size in range then valid", () {
    final FrameSizeModel frame = FrameSizeModel(size: 21);

    expect(frame.validate(), true);
  });


  test("When having same size and diff unit then not equal", () {
    FrameSizeModel frame1 = FrameSizeModel(size: 16, unit: FrameSizeModel.DEFAULT_UNIT);
    FrameSizeModel frame2 = FrameSizeModel(size: 16, unit: "inch");

    expect(frame1 == frame2, false);
  });

  test("When having same size and unit then equal", () {
    FrameSizeModel frame1 = FrameSizeModel(size: 16, unit: FrameSizeModel.DEFAULT_UNIT);
    FrameSizeModel frame2 = FrameSizeModel(size: 16, unit: FrameSizeModel.DEFAULT_UNIT);

    expect(frame1 == frame2, true);
  });

  test("When having same size and unit then same hash", () {
    FrameSizeModel frame1 = FrameSizeModel(size: 16, unit: FrameSizeModel.DEFAULT_UNIT);
    FrameSizeModel frame2 = FrameSizeModel(size: 16, unit: FrameSizeModel.DEFAULT_UNIT);

    expect(frame1.hashCode == frame2.hashCode, true);
  });

}