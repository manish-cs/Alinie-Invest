//
//  AIHomeRouter.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

class AIHomeRouter: AIHomePresenterToRouterProtocol{
    
    static func createModule() -> AIHomeViewController {
        
        let view = AIHomeViewController(nibName: nil, bundle: nil)
        
        let presenter: AIHomeViewToPresenterProtocol & AIHomeInteractorToPresenterProtocol = AIHomePresenter()
        let interactor: AIHomePresenterToInteractorProtocol = AIHomeInteractor()
        let router:AIHomePresenterToRouterProtocol = AIHomeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
}
