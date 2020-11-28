//
//  AITrendingInteractor.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

class AITrendingInteractor: AITrendingPresenterToInteractorProtocol {
    var presenter: AITrendingInteractorToPresenterProtocol?
    
    func fetchCategories() -> [AITrendingViewModel] {
        let list = [AITrendingListViewModel(title: "Medifast", subtitle: "MEDI", imagename: "fa-dot-circle", change: 5.78, type: .profit),
                    AITrendingListViewModel(title: "Pinterest", subtitle: "PINS", imagename: "fa-check-circle", change: 2.78, type: .loss),
                    AITrendingListViewModel(title: "Slack Technologies", subtitle: "WORK", imagename: "fa-circle", change: 2.38, type: .profit),
                    AITrendingListViewModel(title: "Evoqua", subtitle: "AQUA", imagename: "fa-dot-circle", change: 1.12, type: .loss)]
        return [AITrendingViewModel(title: "Top Gainers", list: list),
                AITrendingViewModel(title: "Top Sellers", list: list),
                AITrendingViewModel(title: "Top Loosers", list: list)]
    }
}
