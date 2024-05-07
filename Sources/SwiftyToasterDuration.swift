import Foundation

public enum SwiftyToasterDuration {
    case short
    case middle
    case long
    
    public var timeInterval: TimeInterval {
        switch self {
        case .short:
            return 1.5
        case .middle:
            return 2.5
        case .long:
            return 3.5
        }
    }
}
