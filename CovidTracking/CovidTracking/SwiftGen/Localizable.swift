// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
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
  /// Increase
  internal static let increase = L10n.tr("Localizable", "Increase")
  /// News
  internal static let newsTitle = L10n.tr("Localizable", "NewsTitle")
  /// Ranking
  internal static let rankingTitle = L10n.tr("Localizable", "RankingTitle")
  /// Tracking this country?
  internal static let trackingCountryAlert = L10n.tr("Localizable", "TrackingCountryAlert")
  /// Tracking
  internal static let trackingTitle = L10n.tr("Localizable", "TrackingTitle")
  /// Utilities
  internal static let utilitiesTitle = L10n.tr("Localizable", "UtilitiesTitle")
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
