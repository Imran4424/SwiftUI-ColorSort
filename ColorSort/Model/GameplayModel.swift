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
    
    func confirmWhereToyWasDropped(dragPosition: CGPoint, currentID: Int?) -> Bool {
        guard let currentID = currentID else {
            print("currentID is nil")
            return false
        }
        
        guard let curColorContainter = frames[currentID] else {
            return false
        }
        
        if curColorContainter.contains(dragPosition) {
            return true
        }
            
        
        return false
    }
    
    func update(dragPosition: CGPoint, currentID: Int?) {
        guard let currentID = currentID else {
            print("currentID is nil")
            return
        }
        
        guard let curColorContainter = frames[currentID] else {
            return
        }
        
        if curColorContainter.contains(dragPosition) {
            highlightedId = currentID
        } else {
            highlightedId = nil
        }
    }
    
    func isHighlighted(id: Int) -> Bool {
            return highlightedId == id
    }
}
