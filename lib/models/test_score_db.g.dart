// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_score_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTestResultCollection on Isar {
  IsarCollection<TestResult> get testResults => this.collection();
}

const TestResultSchema = CollectionSchema(
  name: r'TestResult',
  id: -8094768535068101560,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'score': PropertySchema(
      id: 1,
      name: r'score',
      type: IsarType.long,
    ),
    r'testName': PropertySchema(
      id: 2,
      name: r'testName',
      type: IsarType.string,
    )
  },
  estimateSize: _testResultEstimateSize,
  serialize: _testResultSerialize,
  deserialize: _testResultDeserialize,
  deserializeProp: _testResultDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'questions': LinkSchema(
      id: 8024713538556389288,
      name: r'questions',
      target: r'TestQuestion',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _testResultGetId,
  getLinks: _testResultGetLinks,
  attach: _testResultAttach,
  version: '3.1.0+1',
);

int _testResultEstimateSize(
  TestResult object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.testName.length * 3;
  return bytesCount;
}

void _testResultSerialize(
  TestResult object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeLong(offsets[1], object.score);
  writer.writeString(offsets[2], object.testName);
}

TestResult _testResultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TestResult();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  object.score = reader.readLong(offsets[1]);
  object.testName = reader.readString(offsets[2]);
  return object;
}

P _testResultDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _testResultGetId(TestResult object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _testResultGetLinks(TestResult object) {
  return [object.questions];
}

void _testResultAttach(IsarCollection<dynamic> col, Id id, TestResult object) {
  object.id = id;
  object.questions
      .attach(col, col.isar.collection<TestQuestion>(), r'questions', id);
}

extension TestResultQueryWhereSort
    on QueryBuilder<TestResult, TestResult, QWhere> {
  QueryBuilder<TestResult, TestResult, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TestResultQueryWhere
    on QueryBuilder<TestResult, TestResult, QWhereClause> {
  QueryBuilder<TestResult, TestResult, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TestResultQueryFilter
    on QueryBuilder<TestResult, TestResult, QFilterCondition> {
  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> scoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> scoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> scoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> scoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> testNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'testName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition>
      testNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'testName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> testNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'testName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> testNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'testName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition>
      testNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'testName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> testNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'testName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> testNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'testName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> testNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'testName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition>
      testNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'testName',
        value: '',
      ));
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition>
      testNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'testName',
        value: '',
      ));
    });
  }
}

extension TestResultQueryObject
    on QueryBuilder<TestResult, TestResult, QFilterCondition> {}

extension TestResultQueryLinks
    on QueryBuilder<TestResult, TestResult, QFilterCondition> {
  QueryBuilder<TestResult, TestResult, QAfterFilterCondition> questions(
      FilterQuery<TestQuestion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'questions');
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition>
      questionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'questions', length, true, length, true);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition>
      questionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'questions', 0, true, 0, true);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition>
      questionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'questions', 0, false, 999999, true);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition>
      questionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'questions', 0, true, length, include);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition>
      questionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'questions', length, include, 999999, true);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterFilterCondition>
      questionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'questions', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TestResultQuerySortBy
    on QueryBuilder<TestResult, TestResult, QSortBy> {
  QueryBuilder<TestResult, TestResult, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> sortByTestName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testName', Sort.asc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> sortByTestNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testName', Sort.desc);
    });
  }
}

extension TestResultQuerySortThenBy
    on QueryBuilder<TestResult, TestResult, QSortThenBy> {
  QueryBuilder<TestResult, TestResult, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> thenByTestName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testName', Sort.asc);
    });
  }

  QueryBuilder<TestResult, TestResult, QAfterSortBy> thenByTestNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testName', Sort.desc);
    });
  }
}

extension TestResultQueryWhereDistinct
    on QueryBuilder<TestResult, TestResult, QDistinct> {
  QueryBuilder<TestResult, TestResult, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<TestResult, TestResult, QDistinct> distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<TestResult, TestResult, QDistinct> distinctByTestName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'testName', caseSensitive: caseSensitive);
    });
  }
}

extension TestResultQueryProperty
    on QueryBuilder<TestResult, TestResult, QQueryProperty> {
  QueryBuilder<TestResult, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TestResult, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<TestResult, int, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<TestResult, String, QQueryOperations> testNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'testName');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTestQuestionCollection on Isar {
  IsarCollection<TestQuestion> get testQuestions => this.collection();
}

const TestQuestionSchema = CollectionSchema(
  name: r'TestQuestion',
  id: -1047621603454215926,
  properties: {
    r'correctAnswer': PropertySchema(
      id: 0,
      name: r'correctAnswer',
      type: IsarType.string,
    ),
    r'questionText': PropertySchema(
      id: 1,
      name: r'questionText',
      type: IsarType.string,
    ),
    r'userAnswer': PropertySchema(
      id: 2,
      name: r'userAnswer',
      type: IsarType.string,
    )
  },
  estimateSize: _testQuestionEstimateSize,
  serialize: _testQuestionSerialize,
  deserialize: _testQuestionDeserialize,
  deserializeProp: _testQuestionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'testResult': LinkSchema(
      id: 1862900205464119034,
      name: r'testResult',
      target: r'TestResult',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _testQuestionGetId,
  getLinks: _testQuestionGetLinks,
  attach: _testQuestionAttach,
  version: '3.1.0+1',
);

int _testQuestionEstimateSize(
  TestQuestion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.correctAnswer.length * 3;
  bytesCount += 3 + object.questionText.length * 3;
  bytesCount += 3 + object.userAnswer.length * 3;
  return bytesCount;
}

void _testQuestionSerialize(
  TestQuestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.correctAnswer);
  writer.writeString(offsets[1], object.questionText);
  writer.writeString(offsets[2], object.userAnswer);
}

TestQuestion _testQuestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TestQuestion();
  object.correctAnswer = reader.readString(offsets[0]);
  object.id = id;
  object.questionText = reader.readString(offsets[1]);
  object.userAnswer = reader.readString(offsets[2]);
  return object;
}

P _testQuestionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _testQuestionGetId(TestQuestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _testQuestionGetLinks(TestQuestion object) {
  return [object.testResult];
}

void _testQuestionAttach(
    IsarCollection<dynamic> col, Id id, TestQuestion object) {
  object.id = id;
  object.testResult
      .attach(col, col.isar.collection<TestResult>(), r'testResult', id);
}

extension TestQuestionQueryWhereSort
    on QueryBuilder<TestQuestion, TestQuestion, QWhere> {
  QueryBuilder<TestQuestion, TestQuestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TestQuestionQueryWhere
    on QueryBuilder<TestQuestion, TestQuestion, QWhereClause> {
  QueryBuilder<TestQuestion, TestQuestion, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TestQuestionQueryFilter
    on QueryBuilder<TestQuestion, TestQuestion, QFilterCondition> {
  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      correctAnswerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      correctAnswerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      correctAnswerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      correctAnswerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      correctAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      correctAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      correctAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      correctAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      correctAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      correctAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      questionTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      questionTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      questionTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      questionTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      questionTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      questionTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      questionTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      questionTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      questionTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: '',
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      questionTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionText',
        value: '',
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      userAnswerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      userAnswerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      userAnswerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      userAnswerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      userAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      userAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      userAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      userAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      userAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      userAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userAnswer',
        value: '',
      ));
    });
  }
}

extension TestQuestionQueryObject
    on QueryBuilder<TestQuestion, TestQuestion, QFilterCondition> {}

extension TestQuestionQueryLinks
    on QueryBuilder<TestQuestion, TestQuestion, QFilterCondition> {
  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition> testResult(
      FilterQuery<TestResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'testResult');
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterFilterCondition>
      testResultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'testResult', 0, true, 0, true);
    });
  }
}

extension TestQuestionQuerySortBy
    on QueryBuilder<TestQuestion, TestQuestion, QSortBy> {
  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy> sortByCorrectAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.asc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy>
      sortByCorrectAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.desc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy> sortByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy>
      sortByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy> sortByUserAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAnswer', Sort.asc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy>
      sortByUserAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAnswer', Sort.desc);
    });
  }
}

extension TestQuestionQuerySortThenBy
    on QueryBuilder<TestQuestion, TestQuestion, QSortThenBy> {
  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy> thenByCorrectAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.asc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy>
      thenByCorrectAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.desc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy> thenByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy>
      thenByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy> thenByUserAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAnswer', Sort.asc);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QAfterSortBy>
      thenByUserAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAnswer', Sort.desc);
    });
  }
}

extension TestQuestionQueryWhereDistinct
    on QueryBuilder<TestQuestion, TestQuestion, QDistinct> {
  QueryBuilder<TestQuestion, TestQuestion, QDistinct> distinctByCorrectAnswer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAnswer',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QDistinct> distinctByQuestionText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TestQuestion, TestQuestion, QDistinct> distinctByUserAnswer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userAnswer', caseSensitive: caseSensitive);
    });
  }
}

extension TestQuestionQueryProperty
    on QueryBuilder<TestQuestion, TestQuestion, QQueryProperty> {
  QueryBuilder<TestQuestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TestQuestion, String, QQueryOperations> correctAnswerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAnswer');
    });
  }

  QueryBuilder<TestQuestion, String, QQueryOperations> questionTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionText');
    });
  }

  QueryBuilder<TestQuestion, String, QQueryOperations> userAnswerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userAnswer');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionsEnglishCollection on Isar {
  IsarCollection<QuestionsEnglish> get questionsEnglishs => this.collection();
}

const QuestionsEnglishSchema = CollectionSchema(
  name: r'QuestionsEnglish',
  id: -2930979224652070020,
  properties: {
    r'answrs': PropertySchema(
      id: 0,
      name: r'answrs',
      type: IsarType.stringList,
    ),
    r'correctAnswers': PropertySchema(
      id: 1,
      name: r'correctAnswers',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 2,
      name: r'order',
      type: IsarType.long,
    ),
    r'questionText': PropertySchema(
      id: 3,
      name: r'questionText',
      type: IsarType.string,
    )
  },
  estimateSize: _questionsEnglishEstimateSize,
  serialize: _questionsEnglishSerialize,
  deserialize: _questionsEnglishDeserialize,
  deserializeProp: _questionsEnglishDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _questionsEnglishGetId,
  getLinks: _questionsEnglishGetLinks,
  attach: _questionsEnglishAttach,
  version: '3.1.0+1',
);

int _questionsEnglishEstimateSize(
  QuestionsEnglish object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.answrs.length * 3;
  {
    for (var i = 0; i < object.answrs.length; i++) {
      final value = object.answrs[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.correctAnswers.length * 3;
  bytesCount += 3 + object.questionText.length * 3;
  return bytesCount;
}

void _questionsEnglishSerialize(
  QuestionsEnglish object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.answrs);
  writer.writeString(offsets[1], object.correctAnswers);
  writer.writeLong(offsets[2], object.order);
  writer.writeString(offsets[3], object.questionText);
}

QuestionsEnglish _questionsEnglishDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionsEnglish();
  object.answrs = reader.readStringList(offsets[0]) ?? [];
  object.correctAnswers = reader.readString(offsets[1]);
  object.id = id;
  object.order = reader.readLong(offsets[2]);
  object.questionText = reader.readString(offsets[3]);
  return object;
}

P _questionsEnglishDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionsEnglishGetId(QuestionsEnglish object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionsEnglishGetLinks(QuestionsEnglish object) {
  return [];
}

void _questionsEnglishAttach(
    IsarCollection<dynamic> col, Id id, QuestionsEnglish object) {
  object.id = id;
}

extension QuestionsEnglishQueryWhereSort
    on QueryBuilder<QuestionsEnglish, QuestionsEnglish, QWhere> {
  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionsEnglishQueryWhere
    on QueryBuilder<QuestionsEnglish, QuestionsEnglish, QWhereClause> {
  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuestionsEnglishQueryFilter
    on QueryBuilder<QuestionsEnglish, QuestionsEnglish, QFilterCondition> {
  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answrs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answrs',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answrs',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answrs',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      answrsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      correctAnswersEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      correctAnswersGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      correctAnswersLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      correctAnswersBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      correctAnswersStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      correctAnswersEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      correctAnswersContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      correctAnswersMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctAnswers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      correctAnswersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswers',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      correctAnswersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctAnswers',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      orderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      orderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      orderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      orderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      questionTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      questionTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      questionTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      questionTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      questionTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      questionTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      questionTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      questionTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      questionTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterFilterCondition>
      questionTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionText',
        value: '',
      ));
    });
  }
}

extension QuestionsEnglishQueryObject
    on QueryBuilder<QuestionsEnglish, QuestionsEnglish, QFilterCondition> {}

extension QuestionsEnglishQueryLinks
    on QueryBuilder<QuestionsEnglish, QuestionsEnglish, QFilterCondition> {}

extension QuestionsEnglishQuerySortBy
    on QueryBuilder<QuestionsEnglish, QuestionsEnglish, QSortBy> {
  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      sortByCorrectAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.asc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      sortByCorrectAnswersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.desc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      sortByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      sortByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }
}

extension QuestionsEnglishQuerySortThenBy
    on QueryBuilder<QuestionsEnglish, QuestionsEnglish, QSortThenBy> {
  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      thenByCorrectAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.asc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      thenByCorrectAnswersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.desc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      thenByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QAfterSortBy>
      thenByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }
}

extension QuestionsEnglishQueryWhereDistinct
    on QueryBuilder<QuestionsEnglish, QuestionsEnglish, QDistinct> {
  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QDistinct>
      distinctByAnswrs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answrs');
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QDistinct>
      distinctByCorrectAnswers({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAnswers',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QDistinct>
      distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<QuestionsEnglish, QuestionsEnglish, QDistinct>
      distinctByQuestionText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionText', caseSensitive: caseSensitive);
    });
  }
}

extension QuestionsEnglishQueryProperty
    on QueryBuilder<QuestionsEnglish, QuestionsEnglish, QQueryProperty> {
  QueryBuilder<QuestionsEnglish, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionsEnglish, List<String>, QQueryOperations>
      answrsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answrs');
    });
  }

  QueryBuilder<QuestionsEnglish, String, QQueryOperations>
      correctAnswersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAnswers');
    });
  }

  QueryBuilder<QuestionsEnglish, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<QuestionsEnglish, String, QQueryOperations>
      questionTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionText');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionsFrenchCollection on Isar {
  IsarCollection<QuestionsFrench> get questionsFrenchs => this.collection();
}

const QuestionsFrenchSchema = CollectionSchema(
  name: r'QuestionsFrench',
  id: 915960723473655678,
  properties: {
    r'answrs': PropertySchema(
      id: 0,
      name: r'answrs',
      type: IsarType.stringList,
    ),
    r'correctAnswers': PropertySchema(
      id: 1,
      name: r'correctAnswers',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 2,
      name: r'order',
      type: IsarType.long,
    ),
    r'questionText': PropertySchema(
      id: 3,
      name: r'questionText',
      type: IsarType.string,
    )
  },
  estimateSize: _questionsFrenchEstimateSize,
  serialize: _questionsFrenchSerialize,
  deserialize: _questionsFrenchDeserialize,
  deserializeProp: _questionsFrenchDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _questionsFrenchGetId,
  getLinks: _questionsFrenchGetLinks,
  attach: _questionsFrenchAttach,
  version: '3.1.0+1',
);

int _questionsFrenchEstimateSize(
  QuestionsFrench object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.answrs.length * 3;
  {
    for (var i = 0; i < object.answrs.length; i++) {
      final value = object.answrs[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.correctAnswers.length * 3;
  bytesCount += 3 + object.questionText.length * 3;
  return bytesCount;
}

void _questionsFrenchSerialize(
  QuestionsFrench object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.answrs);
  writer.writeString(offsets[1], object.correctAnswers);
  writer.writeLong(offsets[2], object.order);
  writer.writeString(offsets[3], object.questionText);
}

QuestionsFrench _questionsFrenchDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionsFrench();
  object.answrs = reader.readStringList(offsets[0]) ?? [];
  object.correctAnswers = reader.readString(offsets[1]);
  object.id = id;
  object.order = reader.readLong(offsets[2]);
  object.questionText = reader.readString(offsets[3]);
  return object;
}

P _questionsFrenchDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionsFrenchGetId(QuestionsFrench object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionsFrenchGetLinks(QuestionsFrench object) {
  return [];
}

void _questionsFrenchAttach(
    IsarCollection<dynamic> col, Id id, QuestionsFrench object) {
  object.id = id;
}

extension QuestionsFrenchQueryWhereSort
    on QueryBuilder<QuestionsFrench, QuestionsFrench, QWhere> {
  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionsFrenchQueryWhere
    on QueryBuilder<QuestionsFrench, QuestionsFrench, QWhereClause> {
  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuestionsFrenchQueryFilter
    on QueryBuilder<QuestionsFrench, QuestionsFrench, QFilterCondition> {
  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answrs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answrs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answrs',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answrs',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answrs',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      answrsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answrs',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      correctAnswersEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      correctAnswersGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      correctAnswersLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      correctAnswersBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      correctAnswersStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      correctAnswersEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      correctAnswersContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      correctAnswersMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctAnswers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      correctAnswersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswers',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      correctAnswersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctAnswers',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      orderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      orderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      orderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      orderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      questionTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      questionTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      questionTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      questionTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      questionTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      questionTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      questionTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      questionTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      questionTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterFilterCondition>
      questionTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionText',
        value: '',
      ));
    });
  }
}

extension QuestionsFrenchQueryObject
    on QueryBuilder<QuestionsFrench, QuestionsFrench, QFilterCondition> {}

extension QuestionsFrenchQueryLinks
    on QueryBuilder<QuestionsFrench, QuestionsFrench, QFilterCondition> {}

extension QuestionsFrenchQuerySortBy
    on QueryBuilder<QuestionsFrench, QuestionsFrench, QSortBy> {
  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy>
      sortByCorrectAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.asc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy>
      sortByCorrectAnswersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.desc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy>
      sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy>
      sortByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy>
      sortByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }
}

extension QuestionsFrenchQuerySortThenBy
    on QueryBuilder<QuestionsFrench, QuestionsFrench, QSortThenBy> {
  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy>
      thenByCorrectAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.asc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy>
      thenByCorrectAnswersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.desc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy>
      thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy>
      thenByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QAfterSortBy>
      thenByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }
}

extension QuestionsFrenchQueryWhereDistinct
    on QueryBuilder<QuestionsFrench, QuestionsFrench, QDistinct> {
  QueryBuilder<QuestionsFrench, QuestionsFrench, QDistinct> distinctByAnswrs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answrs');
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QDistinct>
      distinctByCorrectAnswers({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAnswers',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<QuestionsFrench, QuestionsFrench, QDistinct>
      distinctByQuestionText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionText', caseSensitive: caseSensitive);
    });
  }
}

extension QuestionsFrenchQueryProperty
    on QueryBuilder<QuestionsFrench, QuestionsFrench, QQueryProperty> {
  QueryBuilder<QuestionsFrench, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionsFrench, List<String>, QQueryOperations>
      answrsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answrs');
    });
  }

  QueryBuilder<QuestionsFrench, String, QQueryOperations>
      correctAnswersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAnswers');
    });
  }

  QueryBuilder<QuestionsFrench, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<QuestionsFrench, String, QQueryOperations>
      questionTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionText');
    });
  }
}
