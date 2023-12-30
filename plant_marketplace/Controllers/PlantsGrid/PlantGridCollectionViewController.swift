//
//  PlantGridCollectionViewController.swift
//  plant_marketplace
//
//  Created by Salil Luley on 01/01/2024.
//

import UIKit

class PlantGridCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier  = "PlantGridCollectionViewCell"
    
    private var svAddToBasket: UIStackView? = nil
    
    let holder : UIView = {
        let v = UIView()
        return v
    }()
    
    let imgPlant : UIImageView = {
        let iv = UIImageView(image: UIImage.init(named: "Plant"))
        return iv
    }()
    
    let lblBanner : UILabel = {
        let lbl = UILabel()
        lbl.text = "The Potted Head"
        lbl.font = UIFont(name: "Roboto-Bold", size: 22)
        return lbl
    }()
    
    let lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.text = "Perfect for beginners or anyone looking for an easy-to-care-for plant"
        lbl.numberOfLines = .max
        lbl.textColor = .gray
        lbl.font = UIFont(name: "Roboto-Regular", size: 12)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let holderAddToCart : UIView = {
        let v = UIView()
        v.backgroundColor = .black
        v.layer.cornerRadius = 24
        return v
    }()
    
    let lblAddToCart : UILabel = {
        let lbl = UILabel()
        lbl.text = "Add To Cart"
        lbl.numberOfLines = .max
        lbl.textColor = .white
        lbl.font = UIFont(name: "Roboto-Bold", size: 14)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let imgBag : UIImageView = {
        let img = UIImageView.init(image: UIImage.init(named: "Bag"))
        return img
    }()
    
    let lblPricing : UILabel = {
        let lbl = UILabel()
        lbl.text = "$50.00"
        lbl.numberOfLines = .max
        lbl.textColor = .white
        lbl.font = UIFont(name: "Roboto-Bold", size: 14)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        initialiseStacks()
        setup()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlantGridCollectionViewCell {
    func setup() {
        contentView.addSubview(holder)
        holder.addSubview(imgPlant)
        holder.addSubview(lblBanner)
        holder.addSubview(lblTitle)
        holder.addSubview(holderAddToCart)
        holderAddToCart.addSubview(svAddToBasket!)
        holderAddToCart.addSubview(imgBag)
    }
    
    
    func initialiseStacks(){
        self.svAddToBasket = createSvAddToBasket()
    }
    
    func setupLayout(){
        layoutImgPlant()
    }
    
    func layoutImgPlant(){
        holder.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imgPlant.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.65)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        lblBanner.snp.makeConstraints { make in
            make.top.equalTo(imgPlant.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(lblBanner.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        holderAddToCart.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        self.svAddToBasket?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview().multipliedBy(1.1)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalToSuperview().multipliedBy(0.6)
        })
        
        imgBag.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    private func createSvAddToBasket() -> UIStackView {
        let sv = UIStackView(arrangedSubviews: [lblAddToCart,lblPricing])
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        return sv
    }
}


