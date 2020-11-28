//
//  AITrendingViewModel.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation
import UIKit

enum ChangeType {
    case profit
    case loss
}

struct AITrendingViewModel {
    let title: String
    let list: [AITrendingListViewModel]
}

struct AITrendingListViewModel {
    let title: String
    let subtitle: String
    let imagename: String
    let change: Float
    let type: ChangeType
}
