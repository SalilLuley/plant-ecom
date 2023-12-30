//
//  ViewController.swift
//  plant_marketplace
//
//  Created by Salil Luley on 30/12/2023.
//

import UIKit
import SwiftUI
import SnapKit

class ViewController: BaseViewController {
    private let cvFilterDatasource = FiltersCollectionViewCellDataSource()
    private let cvPlantsDatasource = PlantGridCollectionViewCellDatasource()
    private var svCollection: UIStackView? = nil
    private var svCartItemsCount: UIStackView? = nil

    let lblBanner : UILabel = {
        let lbl = UILabel()
        lbl.text = "Lets Make our \nlives Greener"
        lbl.numberOfLines = .max
        lbl.font = UIFont(name: "Roboto-Regular", size: 38)
        return lbl
    }()
    
    let holderHamburgerMenu : UIView = {
       let v = UIView()
    return v
    }()
    
    let imgHamburgerRect: UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "HamburgerRect"))
        return iv
    }()
    let imgHamburgerLines: UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "HamburgerLines"))
        return iv
    }()
    
    let cvfilters : UICollectionView = {
        let fl = UICollectionViewFlowLayout()
        fl.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: fl)
        cv.register(FiltersCollectionViewCell.self, forCellWithReuseIdentifier: FiltersCollectionViewCell.reuseIdentifier)
        cv.backgroundColor = UIColor(cgColor: CGColor.init(red: 248/255, green: 248/255, blue: 248/255, alpha: 1))
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let lblPlantCollections : UILabel = {
        let lbl = UILabel()
        lbl.text = "Plant Collections"
        lbl.numberOfLines = .max
        lbl.font = UIFont(name: "Roboto-Regular", size: 24)
        return lbl
    }()
    
    let btnCollections : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "RightArrow"), for: .normal)
        return btn
    }()
    
    
    let cvPlants : UICollectionView = {
        let fl = UICollectionViewFlowLayout()
        fl.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: fl)
        cv.register(PlantGridCollectionViewCell.self, forCellWithReuseIdentifier: PlantGridCollectionViewCell.reuseIdentifier)
        cv.backgroundColor = UIColor(cgColor: CGColor.init(red: 248/255, green: 248/255, blue: 248/255, alpha: 1))
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.layer.cornerRadius = 16
        cv.isPagingEnabled = true
        return cv
    }()
    
//    let pageControl : UIPageControl = {
//        let pc = UIPageControl.init()
//        pc.currentPage = 1
//        pc.numberOfPages = 4
//        pc.pageIndicatorTintColor = .black
//        pc.currentPageIndicatorTintColor = .black
//        return pc
//    }()
    
    let imgCart : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "CartBottom")
        return img
    }()
    
    let holderCartItemCount : UIView = {
        let v = UIView()
        v.backgroundColor = .black
        v.layer.cornerRadius = 20
        return v
    }()
    
    let lblCartItemCount : UIView = {
        let lbl = UILabel()
        lbl.text = "4"
        lbl.font = UIFont(name: "Roboto-Regular", size: 18)
        lbl.textColor = .white
        return lbl
    }()
    
    let lblCartBanner : UIView = {
        let lbl = UILabel()
        lbl.text = "Cart Items"
        lbl.font = UIFont(name: "Roboto-Bold", size: 16)
        lbl.textColor = .black
        return lbl
    }()
    
    let lblCartItemsCountStr : UIView = {
        let lbl = UILabel()
        lbl.text = "4 Items"
        lbl.font = UIFont(name: "Roboto-Regular", size: 14)
        lbl.textColor = .black
        return lbl
    }()
    
    let holderCartItemsBackdrop : UIView = {
        let v  = UIView()
        v.backgroundColor = .init(red: 68/255, green: 241/255, blue: 166/255, alpha: 1)
        return v
    }()
    
    let imgCartItemsBackdrop : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "CartItemsBackdrop")
        return img
    }()
    
    let imgPlantIconCart1 : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "PlantIconCart1")
        return img
    }()
    
    
    let holderCartItemsBackdrop2 : UIView = {
        let v  = UIView()
        v.backgroundColor = .init(red: 68/255, green: 241/255, blue: 166/255, alpha: 1)
        return v
    }()
    
    let imgCartItemsBackdrop2 : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "CartItemsBackdrop")
        return img
    }()
    
    let imgPlantIconCart2 : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "PlantIconCart3")
        return img
    }()
    
    let holderCartItemsBackdrop3 : UIView = {
        let v  = UIView()
        v.backgroundColor = .init(red: 68/255, green: 241/255, blue: 166/255, alpha: 1)
        return v
    }()
    
    let imgCartItemsBackdrop3 : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "CartItemsBackdrop")
        return img
    }()
    
    let imgPlantIconCart3 : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "PlantIconCart2")
        return img
    }()
    
    let holderCartItemsBackdrop4 : UIView = {
        let v  = UIView()
        v.backgroundColor = .init(red: 68/255, green: 241/255, blue: 166/255, alpha: 1)
        return v
    }()
    
    let imgCartItemsBackdrop4 : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "CartItemsBackdrop")
        return img
    }()
    
    let imgPlantIconCart4 : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "PlantIconCart4")
        return img
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setup()
        setupLayout()
    }
}

//Setup UI
extension ViewController {
    func setup() {
        setupDelegates()
        setupStacks()
        view.addSubview(lblBanner)
        view.addSubview(holderHamburgerMenu)
        holderHamburgerMenu.addSubview(imgHamburgerRect)
        holderHamburgerMenu.addSubview(imgHamburgerLines)
        view.addSubview(cvfilters)
        view.addSubview(svCollection!)
        view.addSubview(cvPlants)
//        view.addSubview(pageControl)
        view.addSubview(imgCart)
        
        imgCart.addSubview(holderCartItemCount)
        holderCartItemCount.addSubview(lblCartItemCount)
        imgCart.addSubview(svCartItemsCount!)
        
        imgCart.addSubview(holderCartItemsBackdrop4)
        holderCartItemsBackdrop4.addSubview(imgCartItemsBackdrop4)
        holderCartItemsBackdrop4.addSubview(imgPlantIconCart4)
                        
        imgCart.addSubview(holderCartItemsBackdrop3)
        holderCartItemsBackdrop3.addSubview(imgCartItemsBackdrop3)
        holderCartItemsBackdrop3.addSubview(imgPlantIconCart3)
        
        
        imgCart.addSubview(holderCartItemsBackdrop2)
        holderCartItemsBackdrop2.addSubview(imgCartItemsBackdrop2)
        holderCartItemsBackdrop2.addSubview(imgPlantIconCart2)
        
        
        imgCart.addSubview(holderCartItemsBackdrop)
        holderCartItemsBackdrop.addSubview(imgCartItemsBackdrop)
        holderCartItemsBackdrop.addSubview(imgPlantIconCart1)
    }
    
    func setupStacks(){
        svCollection = createSVForCollections()
        svCartItemsCount = createSVCartItemsCount()
    }
    
    private func setupLayout(){
        layoutLblBanner()
        layoutHolderHamburgerMenu()
        layoutCvfilters()
        layoutPlantCollectionStack()
        layoutCvPlants()
//        layoutPageControl()
        layoutImgCart()
        layoutHolderCartItemCount()
        layoutLblCartItemCount()
        layoutSvCartItemsCount()
        layoutHolderCartItemsBackdrop()
        layoutHolderCartItemsBackdrop2()
        layoutHolderCartItemsBackdrop3()
        layoutHolderCartItemsBackdrop4()
    }
    
    private func layoutLblBanner(){
        lblBanner.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }
    
    private func layoutHolderHamburgerMenu() {
        holderHamburgerMenu.snp.makeConstraints { make in
            make.centerY.equalTo(lblBanner.snp.centerY)
            make.trailing.equalToSuperview()
            make.width.height.equalTo(100)
        }
        imgHamburgerRect.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        imgHamburgerLines.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func layoutCvfilters(){
        cvfilters.snp.makeConstraints { make in
            make.top.equalTo(lblBanner.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
    }
          
    private func layoutPlantCollectionStack(){
        svCollection?.snp.makeConstraints { make in
            make.top.equalTo(cvfilters.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    private func layoutCvPlants() {
        cvPlants.snp.makeConstraints { make in
            make.top.equalTo(svCollection!.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.leading.equalToSuperview().offset(20)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
    }
    
//    private func layoutPageControl() {
//        pageControl.snp.makeConstraints { make in
//            make.bottom.equalTo(cvPlants.snp.bottom)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(80)
//            make.height.equalTo(20)
//        }
//    }
    
    
    
    private func layoutImgCart() {
        imgCart.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(cvPlants.snp.bottom).offset(20)
            make.height.equalToSuperview().multipliedBy(0.13)
        }
    }
    
    private func layoutHolderCartItemCount() {
        holderCartItemCount.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }
    
    private func layoutLblCartItemCount() {
        lblCartItemCount.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    
    private func layoutSvCartItemsCount() {
        svCartItemsCount?.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lblCartItemCount.snp.trailing).offset(25)
            make.top.equalTo(lblCartItemCount.snp.top)
            make.bottom.equalTo(lblCartItemCount.snp.bottom)
        }
    }
    
    private func layoutHolderCartItemsBackdrop() {
        holderCartItemsBackdrop.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(svCartItemsCount!.snp.trailing).offset(90)
            make.width.height.equalTo(40)
        }
        imgCartItemsBackdrop.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        imgPlantIconCart1.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func layoutHolderCartItemsBackdrop2() {
        holderCartItemsBackdrop2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(svCartItemsCount!.snp.trailing).offset(115)
            make.width.height.equalTo(40)
        }
        imgCartItemsBackdrop2.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        imgPlantIconCart2.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func layoutHolderCartItemsBackdrop3() {
        holderCartItemsBackdrop3.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(svCartItemsCount!.snp.trailing).offset(135)
            make.width.height.equalTo(40)
        }
        imgCartItemsBackdrop3.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        imgPlantIconCart3.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func layoutHolderCartItemsBackdrop4() {
        holderCartItemsBackdrop4.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(svCartItemsCount!.snp.trailing).offset(155)
            make.width.height.equalTo(40)
        }
        imgCartItemsBackdrop4.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        imgPlantIconCart4.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    
    
    private func createSVForCollections() -> UIStackView {
        let sv = UIStackView(arrangedSubviews: [lblPlantCollections, btnCollections])
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        return sv
    }
    
    private func createSVCartItemsCount() -> UIStackView {
        let sv = UIStackView(arrangedSubviews: [lblCartBanner, lblCartItemsCountStr])
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        return sv
    }
    
    
}

//Delegates
extension ViewController {
    func setupDelegates(){
        cvfilters.dataSource = cvFilterDatasource
        cvfilters.delegate = cvFilterDatasource
        
        cvPlants.dataSource = cvPlantsDatasource
        cvPlants.delegate = cvPlantsDatasource
    }
}




struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews : some View {
        ViewControllerRepresentable()
    }
}

