//
//  ColorContainerView.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import SwiftUI

struct ColorContainerView: View {
    let myColor: MyColor
    @ObservedObject var model: GameplayModel
    private let regularSize: CGFloat = 100
    private let highlightedSize: CGFloat = 130
    
    var body: some View {
        ZStack {
            Circle()
                .fill(myColor.color)
                .frame(width: regularSize, height: regularSize)
            
            if model.isHighlighted(id: myColor.id) {
                Circle()
                    .fill(myColor.color)
                    .opacity(0.5)
                    .frame(
                        width: highlightedSize,
                        height: highlightedSize
                    )
            }
        }
        .overlay {
            GeometryReader { proxy -> Color in
                model.update(frame: proxy.frame(in: .global), for: myColor.id)
                return Color.clear
            }
        }
        .frame(width: highlightedSize, height: highlightedSize)
    }
}

#Preview {
    ColorContainerView(myColor: MyColor.all.first!, model: GameplayModel())
}
