//
//  MyColor.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import SwiftUI

struct MyColor: Hashable {
    let id: UUID = UUID()
    let color: Color
}

extension MyColor {
    static let all = [
        MyColor(color: .red),
        MyColor(color: .blue),
        MyColor(color: .green),
        MyColor(color: .black),
        MyColor(color: .orange),
        MyColor(color: .purple)
    ]
}
