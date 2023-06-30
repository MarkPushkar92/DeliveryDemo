//
//  MenuCollectionView.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 29.06.2023.
//


import UIKit

class MenuCollectionView: UIView {
    
    var onTap: ((DishModel) -> Void)?

    var menu = [DishModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    private let layout = UICollectionViewFlowLayout()

    private func setupViews() {
        self.addSubview(collectionView)
        self.toAutoLayout()
        self.backgroundColor = .white
        let constraints = [

            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

        ]
        NSLayoutConstraint.activate(constraints)
        
        //collection setup
        
        layout.scrollDirection = .vertical
        collectionView.alwaysBounceVertical = true
        collectionView.toAutoLayout()
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: String(describing: MenuCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = false


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

extension MenuCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MenuCell.self), for: indexPath) as! MenuCell
        cell.model = menu[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let onTap = onTap else { return }
        let cell = collectionView.cellForItem(at: indexPath) as? MenuCell
        guard let dish = cell?.model else { return }
        onTap(dish)
    }
    
  
}

extension MenuCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 109
        let height: CGFloat = 160
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}


