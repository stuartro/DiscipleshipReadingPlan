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


