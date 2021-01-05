import ArgumentParser
import Foundation

public struct BibleReadingCmd: ParsableCommand {
   
   // MARK: PROPERTIES
   public static let configuration = CommandConfiguration(
      commandName: "bibleReading",
      abstract: "Utility to generate Discipleship Reading Plan in various formats",
      subcommands: [
         CreateThingsProjectCmd.self,
         GenerateMarkdownCmd.self,
      ])
   
   // MARK: - OBJECT LIFECYCLE
   public init() {}
}
