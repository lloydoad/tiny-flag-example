import Foundation

enum OnboardingBoolFeatureFlag: String {
    case isUsernameRequired
    case isPasswordRequired
    case isPhoneNumberRequired
    
    var defaultValue: Bool {
        switch self {
        case .isUsernameRequired, .isPhoneNumberRequired: return false
        case .isPasswordRequired:
            return true
        }
    }
}