//
//  GameplayModel.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import Foundation

class GameplayModel: ObservableObject {
    @Published var highlightedId: UUID?
    
    var myColors = Array(MyColor.all.shuffled().prefix(upTo: 3))
    var myColorContainers = MyColor.all.shuffled()
    
    func isHighlighted(id: UUID) -> Bool {
            highlightedId == id
    }
}
