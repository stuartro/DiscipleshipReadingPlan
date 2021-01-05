import XCTest
import class Foundation.Bundle
import Regex

final class ThingsDiscipleshipTests: XCTestCase {
   func testExample() throws {
      let regex = try! Regex(pattern: "[^0-9]*([0-9][0-9]*)$")
      let fullRef = "Psa 10"
      let match = regex.findFirst(in: fullRef)!
      let chapterNum = match.group(at: 1)
      XCTAssertEqual(chapterNum, "10")
   }
}
