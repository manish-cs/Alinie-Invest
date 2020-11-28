//
//  AIThemesRouter.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation
import UIKit

class AIThemesRouter: AIThemesPresenterToRouterProtocol{
    
    static func createModule(collectionView: UICollectionView, indexPath: IndexPath, reuseIdentifier: String) -> AIThemesCollectionViewCell {
        
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AIThemesCollectionViewCell
        
        let presenter: AIThemesViewToPresenterProtocol & AIThemesInteractorToPresenterProtocol = AIThemesPresenter()
        let interactor: AIThemesPresenterToInteractorProtocol = AIThemesInteractor()
        let router: AIThemesPresenterToRouterProtocol = AIThemesRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
}
