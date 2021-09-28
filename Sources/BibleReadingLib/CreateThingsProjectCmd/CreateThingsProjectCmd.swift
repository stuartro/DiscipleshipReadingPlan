import ArgumentParser
import Foundation

public struct CreateThingsProjectCmd: ParsableCommand {
   
   // MARK: PROPERTIES
   public static let configuration = CommandConfiguration(
      commandName: "createThingsProject",
      abstract: "Create a new Discipleship Reading Plan project in Things 3"
   )
   
   @Option(help: "Name of the project (in Things) to be created")
   public var projectName: String
   
   @Option(help: "The Accordance short-code (e.g. 'ESVS' for ESV with Strongs, etc.) in which you want to do your Bible reading")
   public var bibleNameCodeAccord: String = "ESVS"

   @Option(help: "The Logos short-code (e.g. 'ESV' for ESV) in which you want to do your Bible reading")
   public var bibleNameCodeLogos: String = "ESV"
   
   @Option(help: "One-based integer representing the month to start with (e.g. 1 = January, 2 = February, etc.)")
   public var startMonth: Int = 1
   
   @Option(help: "One-based integer representing the month to start with (e.g. 1 = January, 2 = February, etc.)")
   public var endMonth: Int = 12
   
   // MARK: - OBJECT LIFECYCLE
   public init() {}
   
   // MARK: - PUBLIC FUNCTIONS
   mutating public func validate() throws {
      guard startMonth >= 1 && startMonth <= 12 else { throw ValidationError("Please specify a 'startMonth' between 1 and 12 (inclusive).") }
      guard endMonth >= 1 && endMonth <= 12     else { throw ValidationError("Please specify a 'endMonth' between 1 and 12 (inclusive).")   }
      guard startMonth <= endMonth              else { throw ValidationError("'startMonth' must be less than or equal to 'endMonth'")   }
   }
   
   mutating public func run() throws {
      do {
         try CreateThingsProjectCmdImpl(args: self).createProjectInThings()
      } catch {
         print("ERROR: \(error)")
      }
   }
}



