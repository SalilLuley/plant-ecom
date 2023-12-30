//
//  FiltersCollectionViewCell.swift
//  plant_marketplace
//
//  Created by Salil Luley on 01/01/2024.
//

import UIKit

class FiltersCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "FiltersCollectionViewCell"
    
    let btnFilter : UIButton = {
        let config = UIButton.Configuration.plain()
        let btn = UIButton(configuration: config)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    let imgBG : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Filter")
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelectors()
    }
    
    override func layoutSubviews() {
        setup()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FiltersCollectionViewCell {
    
    func setup(){
        contentView.addSubview(imgBG)
        contentView.addSubview(btnFilter)
    }
    
    func setupSelectors(){
        btnFilter.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
    }
    
    @objc func btnClick(_ sender: UIButton){
        print("Tag \(sender.tag)")
    }
    
    func setupLayout() {
        layout()
    }
    
    func layout(){
        btnFilter.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        imgBG.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(1)
            make.height.equalToSuperview().multipliedBy(1)
        }
    }
    
    func setupUI(title: String, index: Int) {
        btnFilter.setTitle(title, for: .normal)
        if index == 0 {
            btnFilter.backgroundColor = .green
        } else {
            btnFilter.backgroundColor = .none
        }
    }

}
