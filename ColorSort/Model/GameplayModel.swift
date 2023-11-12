//
//  GameplayModel.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import Foundation

class GameplayModel: ObservableObject {
    @Published var highlightedId: Int?
    
    var frames: [Int: CGRect] = [:]
    
    var myColors = Array(MyColor.all.shuffled().prefix(upTo: 3))
    var myColorContainers = MyColor.all.shuffled()
    
    // MARK: - Updates in the screen
    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }
    
    func update(dragPosition: CGPoint) {
        for (id, frame) in frames where frame.contains(dragPosition) {
            highlightedId = id
            return
        }
        
        highlightedId = nil
    }
    
    func isHighlighted(id: Int) -> Bool {
            return highlightedId == id
    }
}
