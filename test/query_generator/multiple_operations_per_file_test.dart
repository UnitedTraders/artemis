import 'package:artemis/generator/data/data.dart';
import 'package:test/test.dart';

import '../helpers.dart';

void main() {
  group('On generation', () {
    test(
      'Allows multiple mutations per file',
      () async => testGenerator(
        query: query,
        schema: r'''
          schema {
            mutation: Mutation
            query: Query
          }

          type Mutation {
            mut(input: Input!): MutationResponse
          }

          type Query {
            que(intsNonNullable: [Int]!, stringNullable: String): QueryResponse
          }

          type QueryResponse {
            s: String
            i: Int
            list(intsNonNullable: [Int]!): [Int]!
          }

          type MutationResponse {
            s: String
          }

          input Input {
            s: String!
          }
        ''',
        libraryDefinition: libraryDefinition,
        generatedFile: generatedFile,
        generateHelpers: true,
      ),
    );
  });
}

const query = r'''
mutation MutData($input: Input!) {
  mut(input: $input) {
    s
  }
}

query QueData($intsNonNullable: [Int]!, $stringNullable: String) {
  que(intsNonNullable: $intsNonNullable, stringNullable: $stringNullable) {
    s
    i
    list(intsNonNullable: $intsNonNullable)
  }
}
''';

final LibraryDefinition libraryDefinition =
    LibraryDefinition(basename: r'query.graphql', queries: [
  QueryDefinition(
      name: QueryName(name: r'MutData$_Mutation'),
      operationName: r'MutData',
      classes: [
        ClassDefinition(
            name: ClassName(name: r'MutData$_Mutation$_MutationResponse'),
            properties: [
              ClassProperty(
                  type: DartTypeName(name: r'String'),
                  name: ClassPropertyName(name: r's'),
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: ClassPropertyName(name: r'__typename'),
            isInput: false),
        ClassDefinition(
            name: ClassName(name: r'MutData$_Mutation'),
            properties: [
              ClassProperty(
                  type: TypeName(name: r'MutData$_Mutation$_MutationResponse'),
                  name: ClassPropertyName(name: r'mut'),
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: ClassPropertyName(name: r'__typename'),
            isInput: false),
        ClassDefinition(
            name: ClassName(name: r'Input'),
            properties: [
              ClassProperty(
                  type: DartTypeName(name: r'String', isNonNull: true),
                  name: ClassPropertyName(name: r's'),
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: ClassPropertyName(name: r'__typename'),
            isInput: true)
      ],
      inputs: [
        QueryInput(
            type: TypeName(name: r'Input', isNonNull: true),
            name: QueryInputName(name: r'input'))
      ],
      generateHelpers: true,
      suffix: r'Mutation'),
  QueryDefinition(
      name: QueryName(name: r'QueData$_Query'),
      operationName: r'QueData',
      classes: [
        ClassDefinition(
            name: ClassName(name: r'QueData$_Query$_QueryResponse'),
            properties: [
              ClassProperty(
                  type: DartTypeName(name: r'String'),
                  name: ClassPropertyName(name: r's'),
                  isResolveType: false),
              ClassProperty(
                  type: DartTypeName(name: r'int'),
                  name: ClassPropertyName(name: r'i'),
                  isResolveType: false),
              ClassProperty(
                  type: ListOfTypeName(
                      typeName: DartTypeName(name: r'int'), isNonNull: true),
                  name: ClassPropertyName(name: r'list'),
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: ClassPropertyName(name: r'__typename'),
            isInput: false),
        ClassDefinition(
            name: ClassName(name: r'QueData$_Query'),
            properties: [
              ClassProperty(
                  type: TypeName(name: r'QueData$_Query$_QueryResponse'),
                  name: ClassPropertyName(name: r'que'),
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: ClassPropertyName(name: r'__typename'),
            isInput: false)
      ],
      inputs: [
        QueryInput(
            type: ListOfTypeName(
                typeName: DartTypeName(name: r'int'), isNonNull: true),
            name: QueryInputName(name: r'intsNonNullable')),
        QueryInput(
            type: DartTypeName(name: r'String'),
            name: QueryInputName(name: r'stringNullable'))
      ],
      generateHelpers: true,
      suffix: r'Query')
]);

const generatedFile = r'''// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class MutData$Mutation$MutationResponse extends JsonSerializable
    with EquatableMixin {
  MutData$Mutation$MutationResponse();

  factory MutData$Mutation$MutationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MutData$Mutation$MutationResponseFromJson(json);

  String? s;

  @override
  List<Object?> get props => [s];
  @override
  Map<String, dynamic> toJson() =>
      _$MutData$Mutation$MutationResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MutData$Mutation extends JsonSerializable with EquatableMixin {
  MutData$Mutation();

  factory MutData$Mutation.fromJson(Map<String, dynamic> json) =>
      _$MutData$MutationFromJson(json);

  MutData$Mutation$MutationResponse? mut;

  @override
  List<Object?> get props => [mut];
  @override
  Map<String, dynamic> toJson() => _$MutData$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Input extends JsonSerializable with EquatableMixin {
  Input({required this.s});

  factory Input.fromJson(Map<String, dynamic> json) => _$InputFromJson(json);

  late String s;

  @override
  List<Object?> get props => [s];
  @override
  Map<String, dynamic> toJson() => _$InputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QueData$Query$QueryResponse extends JsonSerializable with EquatableMixin {
  QueData$Query$QueryResponse();

  factory QueData$Query$QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$QueData$Query$QueryResponseFromJson(json);

  String? s;

  int? i;

  late List<int?> list;

  @override
  List<Object?> get props => [s, i, list];
  @override
  Map<String, dynamic> toJson() => _$QueData$Query$QueryResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QueData$Query extends JsonSerializable with EquatableMixin {
  QueData$Query();

  factory QueData$Query.fromJson(Map<String, dynamic> json) =>
      _$QueData$QueryFromJson(json);

  QueData$Query$QueryResponse? que;

  @override
  List<Object?> get props => [que];
  @override
  Map<String, dynamic> toJson() => _$QueData$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MutDataArguments extends JsonSerializable with EquatableMixin {
  MutDataArguments({required this.input});

  @override
  factory MutDataArguments.fromJson(Map<String, dynamic> json) =>
      _$MutDataArgumentsFromJson(json);

  late Input input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$MutDataArgumentsToJson(this);
}

final MUT_DATA_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'MutData'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'input')),
            type:
                NamedTypeNode(name: NameNode(value: 'Input'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'mut'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: VariableNode(name: NameNode(value: 'input')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 's'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class MutDataMutation extends GraphQLQuery<MutData$Mutation, MutDataArguments> {
  MutDataMutation({required this.variables});

  @override
  final DocumentNode document = MUT_DATA_MUTATION_DOCUMENT;

  @override
  final String operationName = 'MutData';

  @override
  final MutDataArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  MutData$Mutation parse(Map<String, dynamic> json) =>
      MutData$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class QueDataArguments extends JsonSerializable with EquatableMixin {
  QueDataArguments({required this.intsNonNullable, this.stringNullable});

  @override
  factory QueDataArguments.fromJson(Map<String, dynamic> json) =>
      _$QueDataArgumentsFromJson(json);

  late List<int?> intsNonNullable;

  final String? stringNullable;

  @override
  List<Object?> get props => [intsNonNullable, stringNullable];
  @override
  Map<String, dynamic> toJson() => _$QueDataArgumentsToJson(this);
}

final QUE_DATA_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'QueData'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'intsNonNullable')),
            type: ListTypeNode(
                type: NamedTypeNode(
                    name: NameNode(value: 'Int'), isNonNull: false),
                isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'stringNullable')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'que'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'intsNonNullable'),
                  value:
                      VariableNode(name: NameNode(value: 'intsNonNullable'))),
              ArgumentNode(
                  name: NameNode(value: 'stringNullable'),
                  value: VariableNode(name: NameNode(value: 'stringNullable')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 's'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'i'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'list'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'intsNonNullable'),
                        value: VariableNode(
                            name: NameNode(value: 'intsNonNullable')))
                  ],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class QueDataQuery extends GraphQLQuery<QueData$Query, QueDataArguments> {
  QueDataQuery({required this.variables});

  @override
  final DocumentNode document = QUE_DATA_QUERY_DOCUMENT;

  @override
  final String operationName = 'QueData';

  @override
  final QueDataArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  QueData$Query parse(Map<String, dynamic> json) =>
      QueData$Query.fromJson(json);
}
''';
