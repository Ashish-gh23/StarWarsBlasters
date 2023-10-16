//
//  APImanager.swift
//  StarWarsTournament
//
//  Created by Ashish Ranjan on 16/10/23.
//

import Foundation

enum APIError {
    case invalidUrl
    case invalidData
}

class APIManager {
    static let shared = APIManager()
    
    private init() { }
    
    func fetchMatchData(completion: @escaping (Result<[MatchModel], Error> ) -> ()) {
        guard let url = URL(string: AppConstants.url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let matches = try JSONDecoder().decode([MatchModel].self, from: data)
                completion(.success(matches))
            } catch {
                
            }
            
        }
        
        
    }
}
