public struct Day {
   public let num: String
   public let refs: [String]
}

public struct Month {
   public let name: String
   public let days: [Day]
   
   public var shortName: String {
      name.substring(to: 3)
   }
}
