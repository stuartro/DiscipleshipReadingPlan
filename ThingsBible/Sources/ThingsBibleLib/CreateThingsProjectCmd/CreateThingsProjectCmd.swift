import ArgumentParser
import Foundation

public struct CreateThingsProjectCmd: ParsableCommand {

   // MARK: PROPERTIES
   public static let configuration = CommandConfiguration(
      commandName: "createThingsProject",
      abstract: "Create a new Discipleship Reading Plan project in Things 3"
   )
   
   
   // MARK: - OBJECT LIFECYCLE
   public init() {}
   
   
   // MARK: - PUBLIC FUNCTIONS
   mutating public func run() throws {
      do {
         try CreateThingsProjectCmdImpl(args: self).test()
      } catch {
         print("ERROR: \(error)")
      }
   }
}



