import ArgumentParser
import Foundation

public struct GenerateMarkdownCmd: ParsableCommand {

   // MARK: PROPERTIES
   public static let configuration = CommandConfiguration(
      commandName: "generateMarkdown",
      abstract: "Generate Discipleship Reading Plan in Markdown Format"
   )
   
   @Option(help: "Title to insert into the generated Markdown file")
   public var title: String = "Discipleship Bible Reading Plan"
   
   @Option(help: "The short-code (e.g. 'ESVS' for ESV with Strongs, etc.) in which you want to do your Bible reading")
   public var bibleNameCode: String = "ESVS"
   
   @Option(help: "One-based integer representing the month to start with (e.g. 1 = January, 2 = February, etc.)")
   public var startMonth: Int = 1
   
   @Option(help: "One-based integer representing the month to start with (e.g. 1 = January, 2 = February, etc.)")
   public var endMonth: Int = 12
   
      // MARK: - OBJECT LIFECYCLE
   public init() {}
   
   // MARK: - PUBLIC FUNCTIONS
   mutating public func run() throws {
      do {
         try GenerateMarkdownCmdImpl(args: self).generateMarkdownFile()
      } catch {
         print("ERROR: \(error)")
      }
   }
}



