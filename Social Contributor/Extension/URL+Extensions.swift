import Foundation

// See more details @ https://www.swiftbysundell.com/articles/constructing-urls-in-swift/#static-urls
extension URL {
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }

        self = url
    }
}
