//
//  MyColor.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import SwiftUI

struct MyColor: Hashable {
    let id: Int
    let color: Color
}

extension MyColor {
    static let all = [
        MyColor(id: 1, color: .red),
        MyColor(id: 2, color: .blue),
        MyColor(id: 3, color: .green),
        MyColor(id: 4, color: .black),
        MyColor(id: 5, color: .orange),
        MyColor(id: 6, color: .purple)
    ]
}
