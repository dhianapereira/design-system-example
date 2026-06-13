import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return 599 when token is compactMax', () {
    expect(DSBreakpoints.compactMax, 599);
  });

  test('should return 600 when token is mediumMin', () {
    expect(DSBreakpoints.mediumMin, 600);
  });

  test('should return 839 when token is mediumMax', () {
    expect(DSBreakpoints.mediumMax, 839);
  });

  test('should return 840 when token is expandedMin', () {
    expect(DSBreakpoints.expandedMin, 840);
  });

  test('should return 1199 when token is expandedMax', () {
    expect(DSBreakpoints.expandedMax, 1199);
  });

  test('should return 1200 when token is largeMin', () {
    expect(DSBreakpoints.largeMin, 1200);
  });

  test('should return 1599 when token is largeMax', () {
    expect(DSBreakpoints.largeMax, 1599);
  });

  test('should return 1600 when token is extraLargeMin', () {
    expect(DSBreakpoints.extraLargeMin, 1600);
  });

  test('should return compact when width is zero', () {
    expect(DSBreakpoints.fromWidth(0), DSBreakpoint.compact);
  });

  test('should return compact when width is compactMax', () {
    expect(
      DSBreakpoints.fromWidth(DSBreakpoints.compactMax),
      DSBreakpoint.compact,
    );
  });

  test('should return medium when width is mediumMin', () {
    expect(
      DSBreakpoints.fromWidth(DSBreakpoints.mediumMin),
      DSBreakpoint.medium,
    );
  });

  test('should return medium when width is mediumMax', () {
    expect(
      DSBreakpoints.fromWidth(DSBreakpoints.mediumMax),
      DSBreakpoint.medium,
    );
  });

  test('should return expanded when width is expandedMin', () {
    expect(
      DSBreakpoints.fromWidth(DSBreakpoints.expandedMin),
      DSBreakpoint.expanded,
    );
  });

  test('should return expanded when width is expandedMax', () {
    expect(
      DSBreakpoints.fromWidth(DSBreakpoints.expandedMax),
      DSBreakpoint.expanded,
    );
  });

  test('should return large when width is largeMin', () {
    expect(
      DSBreakpoints.fromWidth(DSBreakpoints.largeMin),
      DSBreakpoint.large,
    );
  });

  test('should return large when width is largeMax', () {
    expect(
      DSBreakpoints.fromWidth(DSBreakpoints.largeMax),
      DSBreakpoint.large,
    );
  });

  test('should return extraLarge when width is extraLargeMin', () {
    expect(
      DSBreakpoints.fromWidth(DSBreakpoints.extraLargeMin),
      DSBreakpoint.extraLarge,
    );
  });
}
