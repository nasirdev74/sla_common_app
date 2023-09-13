import 'package:sla_common/utils/utils.dart';

extension AppStringUtils on String {
  /// Discover if the String is a valid number
  bool get isNum => AppUtils.isNum(this);

  /// Discover if the String is numeric only
  bool get isNumericOnly => AppUtils.isNumericOnly(this);

  String numericOnly({bool firstWordOnly = false}) =>
      AppUtils.numericOnly(this, firstWordOnly: firstWordOnly);

  /// Discover if the String is alphanumeric only
  bool get isAlphabetOnly => AppUtils.isAlphabetOnly(this);

  /// Discover if the String is a boolean
  bool get isBool => AppUtils.isBool(this);

  /// Discover if the String is a vector
  bool get isVectorFileName => AppUtils.isVector(this);

  /// Discover if the String is a ImageFileName
  bool get isImageFileName => AppUtils.isImage(this);

  /// Discover if the String is a AudioFileName
  bool get isAudioFileName => AppUtils.isAudio(this);

  /// Discover if the String is a VideoFileName
  bool get isVideoFileName => AppUtils.isVideo(this);

  /// Discover if the String is a TxtFileName
  bool get isTxtFileName => AppUtils.isTxt(this);

  /// Discover if the String is a Document Word
  bool get isDocumentFileName => AppUtils.isWord(this);

  /// Discover if the String is a Document Excel
  bool get isExcelFileName => AppUtils.isExcel(this);

  /// Discover if the String is a Document Powerpoint
  bool get isPPTFileName => AppUtils.isPPT(this);

  /// Discover if the String is a APK File
  bool get isAPKFileName => AppUtils.isAPK(this);

  /// Discover if the String is a PDF file
  bool get isPDFFileName => AppUtils.isPDF(this);

  /// Discover if the String is a HTML file
  bool get isHTMLFileName => AppUtils.isHTML(this);

  /// Discover if the String is a URL file
  bool get isURL => AppUtils.isURL(this);

  /// Discover if the String is a Email
  bool get isEmail => AppUtils.isEmail(this);

  /// Discover if the String is a Phone Number
  bool get isPhoneNumber => AppUtils.isPhoneNumber(this);

  /// Discover if the String is a DateTime
  bool get isDateTime => AppUtils.isDateTime(this);

  /// Discover if the String is a MD5 Hash
  bool get isMD5 => AppUtils.isMD5(this);

  /// Discover if the String is a SHA1 Hash
  bool get isSHA1 => AppUtils.isSHA1(this);

  /// Discover if the String is a SHA256 Hash
  bool get isSHA256 => AppUtils.isSHA256(this);

  /// Discover if the String is a bynary value
  bool get isBinary => AppUtils.isBinary(this);

  /// Discover if the String is a ipv4
  bool get isIPv4 => AppUtils.isIPv4(this);

  bool get isIPv6 => AppUtils.isIPv6(this);

  /// Discover if the String is a Hexadecimal
  bool get isHexadecimal => AppUtils.isHexadecimal(this);

  /// Discover if the String is a palindrom
  bool get isPalindrom => AppUtils.isPalindrom(this);

  /// Discover if the String is a passport number
  bool get isPassport => AppUtils.isPassport(this);

  /// Discover if the String is a currency
  bool get isCurrency => AppUtils.isCurrency(this);

  /// Discover if the String is a CPF number
  bool get isCpf => AppUtils.isCpf(this);

  /// Discover if the String is a CNPJ number
  bool get isCnpj => AppUtils.isCnpj(this);

  /// Discover if the String is a case insensitive
  bool isCaseInsensitiveContains(String b) =>
      AppUtils.isCaseInsensitiveContains(this, b);

  /// Discover if the String is a case sensitive and contains any value
  bool isCaseInsensitiveContainsAny(String b) =>
      AppUtils.isCaseInsensitiveContainsAny(this, b);

  /// capitalize the String
  String? get capitalize => AppUtils.capitalize(this);

  /// Capitalize the first letter of the String
  String? get capitalizeFirst => AppUtils.capitalizeFirst(this);

  /// remove all whitespace from the String
  String get removeAllWhitespace => AppUtils.removeAllWhitespace(this);

  /// converter the String
  String? get camelCase => AppUtils.camelCase(this);

  /// Discover if the String is a valid URL
  String? get paramCase => AppUtils.paramCase(this);

  /// add segments to the String
  String createPath([Iterable? segments]) {
    final path = startsWith('/') ? this : '/$this';
    return AppUtils.createPath(path, segments);
  }

  /// capitalize only first letter in String words to upper case
  String capitalizeAllWordsFirstLetter() =>
      AppUtils.capitalizeAllWordsFirstLetter(this);
}
