import Foundation

// Github Contributors for this app
// https://api.github.com/repos/adamrushy/social-swiftui-app/contributors
struct Contributor: Codable {
    let id: Int
    let login: String
    let avatarUrl: URL
    let htmlUrl: URL
}
