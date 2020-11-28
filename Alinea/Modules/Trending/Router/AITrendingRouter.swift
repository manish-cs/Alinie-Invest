//
//  AITrendingRouter.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation
import UIKit

class AITrendingRouter: AITrendingPresenterToRouterProtocol{
    
    static func createModule(collectionView: UICollectionView, indexPath: IndexPath, reuseIdentifier: String) -> AITrendingCollectionViewCell {
        
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AITrendingCollectionViewCell
        
        let presenter: AITrendingViewToPresenterProtocol & AITrendingInteractorToPresenterProtocol = AITrendingPresenter()
        let interactor: AITrendingPresenterToInteractorProtocol = AITrendingInteractor()
        let router: AITrendingPresenterToRouterProtocol = AITrendingRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
}
