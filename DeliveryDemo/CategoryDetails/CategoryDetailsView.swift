//
//  CategoryDetailsView.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import UIKit

class CategoryDetailsView: UIView {
    
    private lazy var tagsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    private let layout = UICollectionViewFlowLayout()
    
    let menuView = MenuCollectionView()

    private func setupViews() {
        self.toAutoLayout()
        self.backgroundColor = .white
        self.addSubview(tagsCollectionView)
        self.addSubview(menuView)
        let constraints = [

            tagsCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            tagsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tagsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tagsCollectionView.heightAnchor.constraint(equalToConstant: 51),

            menuView.topAnchor.constraint(equalTo: tagsCollectionView.bottomAnchor),
            menuView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            menuView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
        
        //collection setup
        
        layout.scrollDirection = .horizontal
        tagsCollectionView.alwaysBounceHorizontal = true
        tagsCollectionView.toAutoLayout()
        tagsCollectionView.register(TagCell.self, forCellWithReuseIdentifier: String(describing: TagCell.self))
        tagsCollectionView.dataSource = self
        tagsCollectionView.delegate = self
        tagsCollectionView.allowsMultipleSelection = false


    }

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: EXTENSIONS

extension CategoryDetailsView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Teg.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TagCell.self), for: indexPath) as! TagCell
        cell.tagLabelText = Teg.allCases[indexPath.row].rawValue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
    }
    
  
}

extension CategoryDetailsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 94
        let height: CGFloat = 35
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}


