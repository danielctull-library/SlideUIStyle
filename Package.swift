// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SlideUIStyle",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "SlideUIStyle", targets: ["SlideUIStyle"]),
    ],
    dependencies: [
        .package(url: "https://github.com/danielctull/SlideUI", branch: "main"),
    ],
    targets: [

        .target(
            name: "SlideUIStyle",
            dependencies: [
                .product(name: "SlideUI", package: "SlideUI"),
                .product(name: "XcodeCodeHighlighting", package: "SlideUI"),
            ]
        ),

        .executableTarget(
            name: "SlideUIStyle Demo",
            dependencies: [
                .product(name: "SlideUI", package: "SlideUI"),
                "SlideUIStyle",
            ]
        ),
    ]
)
