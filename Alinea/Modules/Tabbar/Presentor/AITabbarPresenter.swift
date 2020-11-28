//
//  AITabbarPresenter.swift
//  Alinea
//
//  Created by Manish Agrawal on 23/11/20.
//

import Foundation
import UIKit

class AITabbarPresenter:AITabBarViewToPresenterProtocol {
    
    var view: AITabBarPresenterToViewProtocol?
    
    var interactor: AITabBarPresenterToInteractorProtocol?
    
    var router: AITabBarPresenterToRouterProtocol?
    
    func fetchTabData() -> [AITabbarViewModel] {
        return interactor?.fetchTabData() ?? []
    }
    
    func getViewForTab(type: TabType) -> UIViewController? {
        switch type {
        case .home:
            return router?.getHomeRootView()
        default:
            return  router?.getOtherModule()
        }
    }
}

extension AITabbarPresenter: AITabBarInteractorToPresenterProtocol{
    
}
