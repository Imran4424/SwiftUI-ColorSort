//
//  DraggableColorView.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import SwiftUI

struct DraggableColorView<Draggable: Gesture>: View {
    let myColor: MyColor
    let position: CGPoint
    let gesture: Draggable
    
    private let size: CGFloat = 100
    
    var body: some View {
        Circle()
            .fill(myColor.color)
            .frame(width: size, height: size)
            .position(position)
            .gesture(gesture)
    }
}

#Preview {
    DraggableColorView(
        myColor: MyColor.all.first!,
        position: CGPoint(x: 100, y: 100),
        gesture: DragGesture()
    )
}
