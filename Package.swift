// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
   name: "BibleReading",
   
   platforms: [
      .macOS(.v10_15)
   ],
   
   products: [
      .library(
         name: "BibleReadingLib",
         targets: ["BibleReadingLib"]),
      
      .executable(
         name: "bibleReading",
         targets: ["bibleReading"]),
   ],
   
   dependencies: [
      .package(url: "https://github.com/apple/swift-argument-parser", from: "0.1.0"),
      .package(url: "https://github.com/crossroadlabs/Regex.git", from: "1.2.0"),
   ],
   
   targets: [
      .target(
         name: "BibleReadingLib",
         dependencies: ["ArgumentParser", "Regex"]),
      
      .target(name: "bibleReading",
              dependencies: ["ArgumentParser", "BibleReadingLib"]),
      
      .testTarget(
         name: "BibleReadingLibTests",
         dependencies: ["Regex", "BibleReadingLib"]),
   ]
)
