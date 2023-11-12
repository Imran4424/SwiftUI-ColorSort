//
//  GameplayModel.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import SwiftUI

class GameplayModel: ObservableObject {
    @Published var highlightedId: Int?
    
    var frames: [Int: CGRect] = [:]
    
    var myColors = Array(MyColor.all.shuffled())
    var myColorContainers = MyColor.all.shuffled()
    
    // MARK: - Updates in the screen
    
    func resetForNextRound() {
        myColors = Array(MyColor.all.shuffled())
        
        withAnimation {
            myColorContainers = MyColor.all.shuffled()
        }
    }
    
    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }
    
    func confirmWhereToyWasDropped(dragPosition: CGPoint, currentID: Int?) -> Bool {
        guard let currentID = currentID else {
            print("currentID is nil")
            return false
        }
        
        guard let curColorContainter = frames[currentID] else {
            return false
        }
        
        if curColorContainter.contains(dragPosition) {
            highlightedId = nil
            return true
        }
        
        return false
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
