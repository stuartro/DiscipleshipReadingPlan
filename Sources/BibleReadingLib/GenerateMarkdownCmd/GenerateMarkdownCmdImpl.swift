import Foundation

public class GenerateMarkdownCmdImpl: AbstractCmdImpl {
   private let args: GenerateMarkdownCmd
   
   public init(args: GenerateMarkdownCmd) {
      self.args = args
   }
   
   public func generateMarkdownFile() throws {
      print("# \(args.title)")
      print()
      
      for i in args.startMonth-1...args.endMonth-1 {
         let month = months[i]
         print("## \(month.name)")
         
         for day in month.days {
            print("### \(month.shortName) ∙ Day \(day.num)")
            print("- [\(label(for: day.refs))](\(accordanceURL(for: day.refs, withBible: args.bibleNameCode)))")
            for ref in day.refs {
               print("    - [\(label(for: [ref]))](\(accordanceURL(for: [ref], withBible: args.bibleNameCode, singleRef: true)))")
               print()
            }
            print()
         }
      }
   }
}


