//
//  AIExploreRouter.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation
import UIKit

class AIExploreRouter: AIExplorePresenterToRouterProtocol{
    
    static func createModule(collectionView: UICollectionView, indexPath: IndexPath, reuseIdentifier: String) -> AIExploreCollectionViewCell {
        
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AIExploreCollectionViewCell
        
        let presenter: AIExploreViewToPresenterProtocol & AIExploreInteractorToPresenterProtocol = AIExplorePresenter()
        let interactor: AIExplorePresenterToInteractorProtocol = AIExploreInteractor()
        let router: AIExplorePresenterToRouterProtocol = AIExploreRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
}
