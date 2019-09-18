enum CustomError: Error {
    case somethingWrong
    
    var message: String {
        switch self {
        case .somethingWrong:
            return L10n.somethingWentWrongPleaseTryLater
        }
    }
}
