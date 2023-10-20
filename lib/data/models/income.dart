import 'package:json_annotation/json_annotation.dart';

part 'income.g.dart';

@JsonSerializable()
class Income {
  const Income({
    required this.amount,
    required this.description,
    required this.source,
  });

  final int amount;
  final String description;
  final IncomeSource source;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);

  Map<String, dynamic> toJson() => _$IncomeToJson(this);
}

enum IncomeSource {
  @JsonValue('personalEncome')
  personalIncome('assets/income_source/personal_income.png', 'Personal income'),
  @JsonValue('realEstate')
  realEstate('assets/income_source/real_estate.png', 'Real estate'),
  @JsonValue('dividents')
  dividents('assets/income_source/dividents.png', 'Dividents');

  const IncomeSource(this.iconPath, this.title);

  final String iconPath;
  final String title;
}
