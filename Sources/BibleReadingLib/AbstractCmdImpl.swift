import Foundation
import Cocoa
import Regex

public class AbstractCmdImpl {
   // MARK: - PRIVATE FUNCTIONS
   let regex = try! Regex(pattern: "[^0-9]*([0-9][0-9]*)$")
   
   public func accordanceURL(for refs: [String], withBible bibleCode: String, singleRef: Bool = false) -> String {
      var references = ""
      for (idx, ref) in refs.enumerated() {
         var fullRef = ref
         if singleRef && !fullRef.contains(":") && !fullRef.contains("-"){
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
      return "accord://read/\(bibleCode)?" + references
   }
   
   /// logosres:esv;ref=BibleESV.Ps8.9
   public func logosURL(for refs: [String], withBible bibleCode: String, singleRef: Bool = false) -> String {
      var references = ""
      for (idx, ref) in refs.enumerated() {
         var fullRef = ref
         if singleRef && !fullRef.contains(":") && !fullRef.contains("-"){
            if let match = regex.findFirst(in: fullRef) {
               let chapterNum = match.group(at: 1)
               //fullRef += "-\(chapterNum!)"
            } else {
               //fullRef += ":1-999"
            }
         }
         references += fullRef.replacingOccurrences(of: " ", with: ".").replacingOccurrences(of: ":", with: ".")
         if idx < refs.count - 1 {
            references += ","
         }
      }
//      return "logosres:\(bibleCode.lowercased());ref=Bible\(bibleCode.uppercased())." + references
      return "https://ref.ly/logosres/\(bibleCode.lowercased())?ref=Bible\(bibleCode.uppercased())." + references
   }
   
   public func label(for refs: [String]) -> String {
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


