import Foundation
import Cocoa

func accordanceURL(for refs: [String]) -> String {
   var references = ""
   for (idx, ref) in refs.enumerated() {
      references += ref.replacingOccurrences(of: " ", with: "_")
      if idx < refs.count - 1 {
         references += ","
      }
   }
   return "accord://read/ESVS?" + references
}

func label(for refs: [String]) -> String {
   var label = ""
   for (idx, ref) in refs.enumerated() {
      label += ref
      if idx < refs.count - 1 {
         label += ", "
      }
   }
   return label
}

var todos: [TJSProject.Item] = []

for month in months {
   todos.append(.heading(TJSHeading(title: month.name)))
   for day in month.days {
      print(day.num)
      print(day.refs)
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
            
      let shortMonthName = month.name.substring(to: 3)
      
      todos.append(.todo(TJSTodo(title: "\(shortMonthName) ∙ \(day.num)",
                                 notes: notes,
                                 checklistItems: checklistItems)))
   }
}

let project = TJSProject(title: "Discipleship Reading Plan",
                         items: todos)

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
   NSWorkspace.shared.open(url)
}
catch {
   // Handle error
}

