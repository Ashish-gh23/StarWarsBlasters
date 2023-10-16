//
//  MatchModel.swift
//  StarWarsTournament
//
//  Created by Ashish Ranjan on 16/10/23.
//

import Foundation

struct MatchModel: Decodable {
    let match: Int
    let player1: Player
    let player2: Player
}

struct Player: Decodable {
    let id: Int
    let score: Int
}

struct PlayerPoints {
    let id: Int
    let points: Int
}
