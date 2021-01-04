// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
   name: "ThingsBible",
   
   platforms: [
      .macOS(.v10_15)
   ],
   
   products: [
      .library(
         name: "ThingsBibleLib",
         targets: ["ThingsBibleLib"]),
      
      .executable(
         name: "thingsBible",
         targets: ["thingsBible"]),
   ],
   
   dependencies: [
      .package(url: "https://github.com/apple/swift-argument-parser", from: "0.1.0"),
   ],
   
   targets: [
      .target(
         name: "ThingsBibleLib",
         dependencies: []),
      
      .target(name: "thingsBible",
              dependencies: ["ArgumentParser", "ThingsBibleLib"]),
   ]
)
