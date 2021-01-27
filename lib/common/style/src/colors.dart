part of style;

const Color mColorNavigationBar = Colors.black;
final Color mColorBackground = HexColor.fromHex('#F6F6F6');
final Color mColorSplashBackground = HexColor.fromHex('#2a3753');
final Color mColorAccent = HexColor.fromHex('#33354E');
final Color mColorWhite = HexColor.fromHex('#FFFFFF');
final Color mColorBackGroundPage = HexColor.fromHex('#F6F6F6');
final Color mColorTextPrimary = HexColor.fromHex('#010934');
final Color mColorTextSecondary = HexColor.fromHex('#667DB0');
final Color mColorTextTertiary = HexColor.fromHex('#A0AECC');
final Color mColorTextError = HexColor.fromHex('#FF665E');
final Color mColorTextTitle = HexColor.fromHex('#000000');
final Color mColorTextWarning = HexColor.fromHex('#FF665E');
final Color mColorLightGray = HexColor.fromHex('#888888');
final Color mColorShadowSecond = HexColor.fromHex('#190134').withOpacity(0.16);
final Color mColorBorder = HexColor.fromHex('#A0AECC');
final Color mBackgroundButtonAccent = HexColor.fromHex('#466099');
final Color mColorTeamYellow = HexColor.fromHex('#ff9900');
final Color mColorTeamBlue = HexColor.fromHex('#3366cc');
final Color mColorTeamForestGreen = HexColor.fromHex('#109618');
final Color mColorTeamCrusta = HexColor.fromHex('#EE7D52');
final Color mColorTeamSpray = HexColor.fromHex('#88DEE1');
final Color mColorTeamCranberry = HexColor.fromHex('#DD4477');
final Color mColorTeamPirateGold = HexColor.fromHex('#B77322');
final Color mColorTeamDarkRed = HexColor.fromHex('#8b0707');
final Color mColorTeamPurpleHeart = HexColor.fromHex('#6633cc');
final Color mColorTeamCitrus = HexColor.fromHex('#aaaa11');
final Color mColorTextSuccess = HexColor.fromHex('#00B189');
final Color mColorOnBed = HexColor.fromHex('#2A3753');
final Color mColorBackgroundNeutral = HexColor.fromHex('#EAEAEA');
final Color mColorBrandPrimary = HexColor.fromHex('#5DC6CA');

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
