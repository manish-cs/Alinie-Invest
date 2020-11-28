//
//  AIHomeViewController.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import UIKit
import SnapKit

class AIHomeViewController: AIBaseViewController {
    var presentor: AIHomeViewToPresenterProtocol?
    var categories = [AIHomeCategoriesViewModel]()
    
    let horozontalStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
       return stackview
    }()
    
    let selectedBar: UIView = {
        let view = UIView()
        view.backgroundColor = AIColor.purpleColor
        return view
    }()
    
    let collectionView: AIBaseCollectionView = {
        let collectionView: AIBaseCollectionView = AIBaseCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.contentInset = .zero
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = presentor?.fetchCategories() ?? []
        setupView()
    }
    var selectedIndex = 0
    
    func setupView() {
        self.view.backgroundColor = AIColor.viewBackgroundColor
        setupStackView()
        setupCategories()
        setupSelectedBar()
        setupCollectionView()
        let btn = UIButton()
        btn.tag = 0
        buttonClick(btn: btn)
    }
    
    func setupStackView() {
        self.view.addSubview(horozontalStack)
        horozontalStack.snp.makeConstraints { (make) in
            make.height.equalTo(48.0)
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    func setupCategories() {
        for (index, category) in categories.enumerated() {
            let button = UIButton(type: .custom)
            button.setTitle(category.title, for: .normal)
            button.setTitleColor(AIColor.greyColor, for: .normal)
            button.setTitleColor(AIColor.purpleColor, for: .selected)
            button.tag = index
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            button.addTarget(self, action: #selector(buttonClick(btn:)), for: .touchUpInside)
            horozontalStack.addArrangedSubview(button)
            switch category.type {
            case .categories:
                collectionView.register(AIExploreCollectionViewCell.self, forCellWithReuseIdentifier: category.title)
            case .theme:
                collectionView.register(AIThemesCollectionViewCell.self, forCellWithReuseIdentifier: category.title)
            case .trending:
                collectionView.register(AITrendingCollectionViewCell.self, forCellWithReuseIdentifier: category.title)
            }
        }
    }
    
    func setupCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(selectedBar.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupSelectedBar() {
        self.view.addSubview(selectedBar)
        selectedBar.snp.makeConstraints { (make) in
            make.height.equalTo(4)
            make.bottom.equalTo(horozontalStack.snp.bottom)
            make.width.equalTo(104)
            make.centerX.equalTo(UIScreen.main.bounds.width / 6)
        }
    }
    
    @objc func buttonClick(btn: UIButton) {
        let index = btn.tag
        for obj in horozontalStack.arrangedSubviews {
            if let btn = obj as? UIButton {
                btn.isSelected = (btn.tag == index)
            }
        }
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .left, animated: true)
        updateSelectedbarPosition(index: index)
    }
    
    func updateSelectedbarPosition(index: Int) {
        selectedBar.snp.updateConstraints { (make) in
            make.centerX.equalTo( (CGFloat(index) *  (UIScreen.main.bounds.width / 3)) + (UIScreen.main.bounds.width / 6))
        }
    }
}

extension AIHomeViewController: AIHomePresenterToViewProtocol{
}

extension AIHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = categories[indexPath.row]
        var cell: AIBaseCollectionViewCell?
        switch category.type {
        case .categories:
            cell = AIExploreRouter.createModule(collectionView: collectionView, indexPath: indexPath, reuseIdentifier: category.title)
        case .theme:
            cell = AIThemesRouter.createModule(collectionView: collectionView, indexPath: indexPath, reuseIdentifier: category.title)
        case .trending:
            cell = AITrendingRouter.createModule(collectionView: collectionView, indexPath: indexPath, reuseIdentifier: category.title)
        }
        guard let sCell = cell else {
            return UICollectionViewCell()
        }
        sCell.setupData()
        return sCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index: Int = Int((scrollView.contentOffset.x + UIScreen.main.bounds.width / 2) / UIScreen.main.bounds.width)
        if selectedIndex != index {
            selectedIndex = index
            for obj in horozontalStack.arrangedSubviews {
                if let btn = obj as? UIButton {
                    btn.isSelected = (selectedIndex == btn.tag)
                }
            }
            updateSelectedbarPosition(index: index)
        }
    }
}
