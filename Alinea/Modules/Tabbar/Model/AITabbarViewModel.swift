//
//  AITabbarViewModel.swift
//  Alinea
//
//  Created by Manish Agrawal on 23/11/20.
//

import Foundation

enum TabType {
    case home
    case search
    case market
    case profile
    case insight
}

struct AITabbarViewModel {
    let title: String
    let imageName: String
    let type: TabType
}
