//
//  AIHomeCategoriesViewModel.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

enum HomeCategoriesType {
    case categories
    case theme
    case trending
}

struct AIHomeCategoriesViewModel {
    var title: String
    var type: HomeCategoriesType
}
