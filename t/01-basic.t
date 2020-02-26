use v6.c;
use Test;
use ValueType;

plan 2;

class Point does ValueType {
    has $.x = 0;
    has $.y = 0;
}

is-deeply Point.new.WHICH, ValueObjAt.new("Point|Int|0|Int|0"),
  'is the basic .WHICH ok';

my $bag = bag (^1000).map: {
    Point.new: x => (-10..10).roll, y => (-10..10).roll
}

ok $bag.elems < 1000, 'should be fewer than 1000 different points';

# vim: ft=perl6 expandtab sw=4
