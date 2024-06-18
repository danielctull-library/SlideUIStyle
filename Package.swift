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
        .package(url: "https://github.com/danielctull-playground/SlideUI", branch: "main"),
    ],
    targets: [

        .executableTarget(
            name: "StyleDemo",
            dependencies: [
                .product(name: "SlideUI", package: "SlideUI"),
                "SlideUIStyle",
            ]
        ),

        .target(
            name: "SlideUIStyle",
            dependencies: [
                .product(name: "SlideUI", package: "SlideUI"),
                .product(name: "XcodeCodeHighlighting", package: "SlideUI"),
            ]
        ),
    ]
)
