grammar SlickQuery;

@header {
package com.slickqa.query.generated;
}

query: and | or | not | propertyComparison;

and: 'and(' query ',' query (',' query)* ')';
or: 'or(' query ',' query (',' query)* ')';
not: 'not(' query ')';

propertyComparison: equalsComparison | notEqualsComparison | lessThanComparison | lessThanOrEqualToComparison |
                    greaterThanComparison | greaterThanOrEqualToComparison | existsExpression | stringComparison |
                    dateLaterThanComparison | dateEarlierThanComparison | listComparison;

equalsComparison: equalsStringComparison | equalsFloatComparison | equalsIntegerComparison | equalsBooleanComparison;
equalsFloatComparison: 'eq' FLOATSIGNATURE;
equalsIntegerComparison: 'eq' INTEGERSIGNATURE;
equalsStringComparison:'eq' QUOTEDSTRINGSIGNATURE;
equalsBooleanComparison: 'eq' BOOLEANSIGNATURE;

notEqualsComparison: notEqualsStringComparison | notEqualsFloatComparison | notEqualsIntegerComparison | notEqualsBooleanComparison;
notEqualsFloatComparison: 'ne' FLOATSIGNATURE;
notEqualsIntegerComparison: 'ne' INTEGERSIGNATURE;
notEqualsStringComparison: 'ne' QUOTEDSTRINGSIGNATURE;
notEqualsBooleanComparison: 'ne' BOOLEANSIGNATURE;

lessThanComparison: lessThanFloatComparison | lessThanIntegerComparison;
lessThanFloatComparison: 'lt' FLOATSIGNATURE;
lessThanIntegerComparison: 'lt' INTEGERSIGNATURE;

lessThanOrEqualToComparison: lessThanOrEqualToFloatComparison | lessThanOrEqualToIntegerComparison;
lessThanOrEqualToFloatComparison: 'lte' FLOATSIGNATURE;
lessThanOrEqualToIntegerComparison: 'lte' INTEGERSIGNATURE;

greaterThanComparison: greaterThanFloatComparison | greaterThanIntegerComparison;
greaterThanFloatComparison: 'gt' FLOATSIGNATURE;
greaterThanIntegerComparison: 'gt' INTEGERSIGNATURE;

greaterThanOrEqualToComparison: greaterThanOrEqualToFloatComparison | greaterThanOrEqualToIntegerComparison;
greaterThanOrEqualToFloatComparison: 'gte' FLOATSIGNATURE;
greaterThanOrEqualToIntegerComparison: 'gte' INTEGERSIGNATURE;

existsExpression: 'exists(' PROPERTYNAME ')';

// String comparison methods: 'exact','iexact','contains','icontains','startswith','istartswith','endswith','iendswith'
stringComparison: exactStringComparison | ignoreCaseExactStringComparison | containsStringComparison |
                  ignoreCaseContainsStringComparison | startsWithStringComparison | ignoreCaseStartsWithStringComparison |
                  endsWithStringComparison | ignoreCaseEndsWithStringComparison;

exactStringComparison: 'exact' QUOTEDSTRINGSIGNATURE;
ignoreCaseExactStringComparison: 'iexact' QUOTEDSTRINGSIGNATURE;
containsStringComparison: 'contains' QUOTEDSTRINGSIGNATURE;
ignoreCaseContainsStringComparison: 'icontains' QUOTEDSTRINGSIGNATURE;
startsWithStringComparison: 'startswith' QUOTEDSTRINGSIGNATURE;
ignoreCaseStartsWithStringComparison: 'istartswith' QUOTEDSTRINGSIGNATURE;
endsWithStringComparison: 'endswith(' QUOTEDSTRINGSIGNATURE;
ignoreCaseEndsWithStringComparison: 'iendswith' QUOTEDSTRINGSIGNATURE;

dateLaterThanComparison: 'laterthan' INTEGERSIGNATURE;
dateEarlierThanComparison: 'earlierthan' INTEGERSIGNATURE;

listComparison: inComparison | ninComparison | allComparison;
inComparison: 'in' LISTSIGNATURE;
ninComparison: 'nin' LISTSIGNATURE;
allComparison: 'all' LISTSIGNATURE;

QUOTEDSTRINGSIGNATURE: '(' PROPERTYNAME COMMA QUOTEDSTRING ')';
INTEGERSIGNATURE: '(' PROPERTYNAME COMMA INTEGER ')';
FLOATSIGNATURE: '(' PROPERTYNAME COMMA FLOAT ')';
BOOLEANSIGNATURE: '(' PROPERTYNAME COMMA BOOLEAN ')';
LISTSIGNATURE: '(' PROPERTYNAME COMMA LISTVALUE ')';

fragment COMMA: ',' | ', ';

PROPERTYNAME: LETTER ((LETTER | DIGIT)* | (LETTER | DIGIT)* '.' LETTER (LETTER | DIGIT)*)*;

FLOAT: ('0' | '1'..'9' DIGIT*) '.' DIGIT DIGIT*;

INTEGER: ('0' | '1'..'9' DIGIT*);

BOOLEAN: 'true' | 'True' | 'false' | 'False';

QUOTEDSTRING: '"' ( '\\"' | ~('\n'|'\r') )*? '"';

LISTVALUE: '(' (QUOTEDSTRING COMMA QUOTEDSTRING (COMMA QUOTEDSTRING)*) ')';

fragment LETTER: 'a' .. 'z' | 'A' .. 'Z' | '_';
fragment DIGIT: '0' .. '9';
