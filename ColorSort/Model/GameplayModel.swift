//
//  GameplayModel.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import Foundation

class GameplayModel: ObservableObject {
    @Published var highlightedId: UUID?
    
    func isHighlighted(id: UUID) -> Bool {
            highlightedId == id
    }
}
