// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let india = ImageAsset(name: "india")
  internal static let phone = ImageAsset(name: "phone")
  internal static let phone1 = ImageAsset(name: "phone1")
  internal static let save = ImageAsset(name: "save")
  internal static let unsave = ImageAsset(name: "unsave")
  internal static let us = ImageAsset(name: "us")
  internal static let vietnam = ImageAsset(name: "vietnam")
  internal static let washingHands = ImageAsset(name: "washing-hands")
  internal static let tappedCovid = ImageAsset(name: "tappedCovid")
  internal static let tappedNews = ImageAsset(name: "tappedNews")
  internal static let tappedRank = ImageAsset(name: "tappedRank")
  internal static let tappedUtilities = ImageAsset(name: "tappedUtilities")
  internal static let untappedCovid = ImageAsset(name: "untappedCovid")
  internal static let untappedNews = ImageAsset(name: "untappedNews")
  internal static let untappedRank = ImageAsset(name: "untappedRank")
  internal static let untappedUtilities = ImageAsset(name: "untappedUtilities")
  internal static let buoc0 = ImageAsset(name: "buoc 0")
  internal static let buoc1 = ImageAsset(name: "buoc1")
  internal static let buoc2 = ImageAsset(name: "buoc2")
  internal static let buoc3 = ImageAsset(name: "buoc3")
  internal static let buoc4 = ImageAsset(name: "buoc4")
  internal static let buoc5 = ImageAsset(name: "buoc5")
  internal static let buoc6 = ImageAsset(name: "buoc6")
  internal static let ruatay0 = ImageAsset(name: "ruatay0")
  internal static let ruatay1 = ImageAsset(name: "ruatay1")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
