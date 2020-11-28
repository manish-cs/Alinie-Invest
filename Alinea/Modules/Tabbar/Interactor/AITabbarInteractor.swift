//
//  AITabbarInteractor.swift
//  Alinea
//
//  Created by Manish Agrawal on 23/11/20.
//

import Foundation

class AITabbarInteractor: AITabBarPresenterToInteractorProtocol{
    var presenter: AITabBarInteractorToPresenterProtocol?
    
    func fetchTabData() -> [AITabbarViewModel] {
        return [AITabbarViewModel(title: "Explore", imageName: "fa-home", type: .home),
                AITabbarViewModel(title: "Search", imageName: "fa-search", type: .search),
                AITabbarViewModel(title: "Market", imageName: "fa-chart-line", type: .market),
                AITabbarViewModel(title: "Profile", imageName: "fa-user-circle", type: .profile),
                AITabbarViewModel(title: "Insights", imageName: "fa-lightbulb", type: .insight)]
    }
}
