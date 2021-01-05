import Foundation
import Cocoa
import Regex

public class CreateThingsProjectCmdImpl {
   private let args: CreateThingsProjectCmd
   
   public init(args: CreateThingsProjectCmd) {
      self.args = args
   }
   
   public func createProjectInThings() throws {
      var projectItems: [TJSProject.Item] = []
      
      for i in args.startMonth-1...args.endMonth-1 {
         let month = months[i]
         print("\(month.name)...")
         projectItems.append(.heading(TJSHeading(title: month.name)))
         for day in month.days {
            var checklistItems = [TJSChecklistItem]()
            //      1. [Luk 20:27-40, Heb 1:1-9, Prov 18, Isa 1-2](accord://read/ESVS?Luk_20:27-40,Heb_1:1-9,Prov_18,Isa_1-2)
            //      1. [Luk 20:27-40](accord://read/ESVS?Luk_20:27-40)
            //      2. [Heb 1:1-9](accord://read/ESVS?Heb_1:1-9)
            //      3. [Prov 18](accord://read/ESVS?Prov_18)
            //      4. [Isa 1-2](accord://read/ESVS?Isa_1-2)
            var notes = "∙ \(label(for: day.refs))\n   \(accordanceURL(for: day.refs))\n"
            for ref in day.refs {
               checklistItems.append(TJSChecklistItem(title: ref))
               notes += "\n∙ \(label(for: [ref]))\n   \(accordanceURL(for: [ref]))"
            }
            
            projectItems.append(.todo(TJSTodo(title: "\(month.shortName) ∙ \(day.num)",
                                       notes: notes,
                                       checklistItems: checklistItems)))
         }
      }
      
      let project = TJSProject(title: args.projectName, items: projectItems)
      
      let container = TJSContainer(items: [.project(project)])
      
      do {
         let encoder = JSONEncoder()
         encoder.dateEncodingStrategy = ThingsJSONDateEncodingStrategy()
         let data = try encoder.encode(container)
         let json = String(data: data, encoding: .utf8)!
         var components = URLComponents(string: "things:///add-json")!
         let queryItem = URLQueryItem(name: "data", value: json)
         components.queryItems = [queryItem]
         let url = components.url!
         print("Sending new project to Things...")
         NSWorkspace.shared.open(url)
         print("Done")
      }
      catch {
         print("ERROR: \(error.localizedDescription)")
      }
   }
   
   // MARK: - PRIVATE FUNCTIONS
   private func accordanceURL(for refs: [String]) -> String {
      var references = ""
      for (idx, ref) in refs.enumerated() {
         var fullRef = ref
         if !fullRef.contains(":") && !fullRef.contains("-"){
            let regex = try! Regex(pattern: ".*([0-9]+)$")
            if let match = regex.findFirst(in: fullRef) {
               let chapterNum = match.group(at: 1)
               fullRef += "-\(chapterNum!)"
            } else {
               fullRef += ":1-999"
            }
         }
         references += fullRef.replacingOccurrences(of: " ", with: "_")
         if idx < refs.count - 1 {
            references += ","
         }
      }
      return "accord://read/\(args.bibleNameCode)?" + references
   }
   
   private func label(for refs: [String]) -> String {
      var label = ""
      for (idx, ref) in refs.enumerated() {
         label += ref
         if idx < refs.count - 1 {
            label += ", "
         }
      }
      return label
   }
}


