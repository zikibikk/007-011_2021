//
//  NetworkService.swift
//  007-011_2021
//
//  Created by Alina Bikkinina on 19.12.2021.
//

import Foundation
import UIKit
class NetworkService {
    
    let configuration = URLSessionConfiguration.default
    let decoder = JSONDecoder()
    
    func findWord(word: String, completion: @escaping (Result<[Word], Error>) -> Void) -> Void {
        
        let session = URLSession(configuration: configuration)
        guard let wordURL = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)") else {
            return
        }
        
        var request = URLRequest(url: wordURL)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.httpMethod = "GET"
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            var result: Result<[Word], Error> = .success([])
            
            if let error = error {
                result = .failure(error)
            } else if let data = data {
                do {
                    let words = try self.decoder.decode([Word].self, from: data)
                    result = .success(words)
                } catch {
                    result = .failure(error)
                }
            }
            completion(result)
        }
        dataTask.resume()
    }
    
}
