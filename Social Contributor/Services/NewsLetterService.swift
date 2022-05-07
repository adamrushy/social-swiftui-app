//
//  NewsLetterService.swift
//  Social Contributor
//
//  Created by Mohammad Azam on 5/7/22.
//

import Foundation

class NewsLetterService {
    
    func load(_ fileName: String) -> [NewsLetter] {
        
        guard let path = Bundle.main.path(forResource: "newsletters", ofType: "json") else {
            fatalError("newsletters file is not found!")
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let newsletters = try JSONDecoder().decode([NewsLetter].self, from: data)
            return newsletters
        } catch {
            return []
        }
        
    }
    
}
