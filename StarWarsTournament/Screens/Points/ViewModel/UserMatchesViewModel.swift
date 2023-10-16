//
//  UserMatchesViewModel.swift
//  StarWarsTournament
//
//  Created by Ashish Ranjan on 16/10/23.
//

import Foundation
import UIKit

final class UserMatchesViewModel {
    var responseBlock: ((APIState) -> ())? = nil
    var matches = [MatchModel]()
    
    var playersPoints: [Int: Int] = [:]
    
    var playerMatches: [Int: [MatchModel]] = [:]
    
    func fetchMatchesData() {
        APIManager.shared.fetchMatchData { [weak self] response in
            switch response {
            case .success(let matches):
                self?.matches = matches
                self?.setPlayersPoints()
                self?.setPlayersMatches()
                self?.responseBlock?(.dataLoaded)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setPlayersMatches() {
        for match in matches {
            var player1 = match.player1
            var player2 = match.player2
            if var player = playerMatches[player1.id] {
                player.append(match)
            } else {
                playerMatches[player1.id] = [match]
            }
            
            if var player = playerMatches[player2.id] {
                player.append(match)
            } else {
                playerMatches[player2.id] = [match]
            }
        }
    }
    
    func setPlayersPoints() {
        for match in matches {
            var player1 = match.player1
            var player2 = match.player2
            
            if player1.score > player2.score {
                if var user = playersPoints[player1.id] {
                    user += 3
                } else {
                    playersPoints[player1.id] = 0
                }
            } else if player2.score > player1.score {
                if var opponent = playersPoints[player1.id] {
                    opponent += 3
                } else {
                    playersPoints[player2.id] = 0
                }
            } else {
                if var user = playersPoints[player1.id] {
                    user += 1
                } else {
                    playersPoints[player1.id] = 1
                }
                if var opponent = playersPoints[player1.id] {
                    opponent += 1
                } else {
                    playersPoints[player2.id] = 1
                }
            }
        }
    }
}

enum APIState {
    case showLoading
    case stopLoading
    case dataLoaded
    case error(Error?)
}
