import ArgumentParser
import Foundation

public struct GenerateMarkdownCmd: ParsableCommand {

   // MARK: PROPERTIES
   public static let configuration = CommandConfiguration(
      commandName: "generateMarkdown",
      abstract: "Generate Discipleship Reading Plan in Markdown Format"
   )
   
      // MARK: - OBJECT LIFECYCLE
   public init() {}
   
   // MARK: - PUBLIC FUNCTIONS
   mutating public func run() throws {
      do {
         try GenerateMarkdownCmdImpl(args: self).test()
      } catch {
         print("ERROR: \(error)")
      }
   }
}



