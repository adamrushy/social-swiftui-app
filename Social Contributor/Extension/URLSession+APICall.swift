//
//  URLSession+APICall.swift
//  Social Contributor
//
//  Created by Yash Shah on 04/05/2022.
//

import Foundation

// Useful for Mocking and testing
protocol DataProvider {
	func request<T: Codable>(url: URL?, type: T.Type) async throws -> T
}

enum NetworkError: Error {
	case badURL
	case badResponse
	case invalidData
}

extension URLSession: DataProvider {
	// Generic Method to retrieve any form of data
	func request<T: Codable>(url: URL?, type: T.Type) async throws -> T {
		guard let url = url else {
			throw NetworkError.badURL
		}

		let (data, response) = try await data(for: URLRequest(url: url))

		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			throw NetworkError.badResponse
		}

		do {
			return try JSONDecoder().decode(type, from: data)
		} catch {
			throw NetworkError.invalidData
		}
	}
}


// More info at www.hackingwithswift.com
// https://tinyurl.com/3e35jzmr
extension URLSession {
    func decode<T: Decodable>(
        _ type: T.Type = T.self,
        from url: URL,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .deferredToData,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
    ) async throws  -> T {
        let (data, _) = try await data(from: url)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dataDecodingStrategy = dataDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStrategy

        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}
