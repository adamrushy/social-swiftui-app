import SwiftUI

@MainActor final class ContributorsProvider: ObservableObject {
    @Published var contributors: String = ""

    func fetchContributors() async {

        do {
            let url = Constants.URLPath.gitHubContributors
            let response = try await URLSession.shared.decode(
                [Contributor].self,
                from: url,
                keyDecodingStrategy: .convertFromSnakeCase
            )
            let names: [String] = response.map { $0.login }
            contributors = names.joined(separator: ", ")
        } catch {
            // Add error handling 🤔
            print("ERROR: \(error)")
        }
    }
}
