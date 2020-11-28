//
//  AITabbarRouter.swift
//  Alinea
//
//  Created by Manish Agrawal on 23/11/20.
//

import Foundation
import FontAwesome_swift

class AITabbarRouter: AITabBarPresenterToRouterProtocol{
    
    static func createModule() -> AITabBarViewController {
        
        let view = AITabBarViewController(nibName: nil, bundle: nil)
        
        let presenter: AITabBarViewToPresenterProtocol & AITabBarInteractorToPresenterProtocol = AITabbarPresenter()
        let interactor: AITabBarPresenterToInteractorProtocol = AITabbarInteractor()
        let router:AITabBarPresenterToRouterProtocol = AITabbarRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.loadViewData()
        return view
        
    }
    
    func getHomeRootView() -> UIViewController {
        return AIHomeRouter.createModule()
    }
    
    func getOtherModule() -> UIViewController {
        return UIViewController()
    }
}
