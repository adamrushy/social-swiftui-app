//
//  Bundle+Decodable.swift
//  Social Contributor
//
//  Created by Danijela Vrzan on 2022-05-22.
//

import Foundation

extension Bundle {
    func decode<T:Decodable>(_ file: String) -> T {
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle.")
    }

    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle.")
    }

    let decoder = JSONDecoder()

    guard let loadedObject = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) from bundle.")
    }

    return loadedObject
  }
}
