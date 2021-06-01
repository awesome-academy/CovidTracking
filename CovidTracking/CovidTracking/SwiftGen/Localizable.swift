// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Change Language
  internal static let changeLanguage = L10n.tr("Localizable", "ChangeLanguage")
  /// You need restart app to apply change
  internal static let changeLanguageMess = L10n.tr("Localizable", "ChangeLanguageMess")
  /// Chart
  internal static let chart = L10n.tr("Localizable", "Chart")
  /// covid cases by day
  internal static let chartLabel = L10n.tr("Localizable", "ChartLabel")
  /// Country
  internal static let country = L10n.tr("Localizable", "Country")
  /// Decrease
  internal static let decrease = L10n.tr("Localizable", "Decrease")
  /// Details
  internal static let detailTitle = L10n.tr("Localizable", "DetailTitle")
  /// Emergency call
  internal static let emergencyCall = L10n.tr("Localizable", "EmergencyCall")
  /// English
  internal static let english = L10n.tr("Localizable", "English")
  /// Increase
  internal static let increase = L10n.tr("Localizable", "Increase")
  /// Language
  internal static let language = L10n.tr("Localizable", "Language")
  /// News
  internal static let newsTitle = L10n.tr("Localizable", "NewsTitle")
  /// No data
  internal static let nodata = L10n.tr("Localizable", "Nodata")
  /// Ranking
  internal static let rankingTitle = L10n.tr("Localizable", "RankingTitle")
  /// Saved news
  internal static let savedNews = L10n.tr("Localizable", "SavedNews")
  /// Tracking this country?
  internal static let trackingCountryAlert = L10n.tr("Localizable", "TrackingCountryAlert")
  /// Tracking
  internal static let trackingTitle = L10n.tr("Localizable", "TrackingTitle")
  /// Utilities
  internal static let utilitiesTitle = L10n.tr("Localizable", "UtilitiesTitle")
  /// Vietnamese
  internal static let vietnamese = L10n.tr("Localizable", "Vietnamese")
  /// Washing hand
  internal static let washingHand = L10n.tr("Localizable", "WashingHand")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
