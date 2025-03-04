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
