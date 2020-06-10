import Foundation
import Library
import Optimizely

extension OptimizelyClient: OptimizelyClientType {

  public func track(eventName: String) {
    let userAttributes = optimizelyUserAttributes()
    let userId = deviceIdentifier(uuid: UUID())

    try? track(eventKey: eventName,
               userId: userId,
               attributes: userAttributes,
               eventTags: nil)
  }
}

extension OptimizelyResult: OptimizelyResultType {
  public var hasError: Error? {
    switch self {
    case .success:
      return nil
    case let .failure(error):
      return error
    }
  }
}

extension OptimizelyLogLevelType {
  public var logLevel: OptimizelyLogLevel {
    switch self {
    case .error:
      return OptimizelyLogLevel.error
    case .debug:
      return OptimizelyLogLevel.debug
    }
  }
}
