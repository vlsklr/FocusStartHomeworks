//
//  ThirdVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit
import SnapKit

class ThirdVC: UIViewController {
    
    let thirdVCTitle = UILabel()
    let myHobbies = UILabel()
    let myHobbiesText = UILabel()
    let myFavSport = UILabel()
    let myFavSportText = UILabel()
    let myNewHobbie = UILabel()
    let myNewHobbieText = UILabel()
    let skiiOrBoard = UIButton(type: .system)
    
    let thirdVCData = ThirdVCData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initThirdVC()
        didLoadAnimate()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func didLoadAnimate() {
        UIView.animate(withDuration: 1.0) {
            self.myFavSport.center = CGPoint(x: 150, y: 250)
            self.myHobbies.center = CGPoint(x: 150, y: 250)
            self.myNewHobbie.center = CGPoint(x: 150, y: 250)
            
            self.myHobbiesText.center = CGPoint(x: 150, y: 250)
            self.myNewHobbieText.center = CGPoint(x: 150, y: 250)
            self.myFavSportText.center = CGPoint(x: 150, y: 250)
            
            self.skiiOrBoard.center = CGPoint(x: 0, y: 150)
        }
    }
    
    @objc func btnAction() {
        var animator = UIViewPropertyAnimator()
        animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
            
            self.skiiOrBoard.backgroundColor = .black
            
        })
        
        animator.startAnimation()
        
        let alert = UIAlertController(title: "Почему или?", message: "И!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Понятно", style: .default))
        self.present(alert, animated: true)
        
        
        
    }
    
    func initThirdVC() {
        
        let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + (tabBarController?.tabBar.bounds.height ?? 100))
            scrollView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            return scrollView
        }()
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(view)
            make.height.equalTo(scrollView.contentSize.height)
            make.width.equalTo(view.bounds.width)
        }
        
//        let contentView = UIView()
//        scrollView.addSubview(contentView)
//        contentView.snp.makeConstraints { make in
//            make.top.bottom.leading.trailing.equalTo(scrollView)
//            make.height.equalTo(scrollView.contentSize.height).inset(150)
//            make.width.equalTo(view.bounds.width)
//        }
        
        view.backgroundColor = .blue
        thirdVCTitle.text = "Мои увлечения"
        scrollView.addSubview(thirdVCTitle)
        thirdVCTitle.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(130)
            constr.top.equalToSuperview().inset(50)
//            constr.leading.equalTo(contentView.snp.leading).inset(130)
//            constr.top.equalTo(contentView.snp.top).inset(50)
            
              
            
            
        }
        
        myHobbies.text = "Мои увлечения"
        scrollView.addSubview(myHobbies)
        myHobbies.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(16)
            constr.top.equalTo(thirdVCTitle).inset(50)
            constr.width.equalTo(150)
            constr.height.equalTo(250)
        }
        myHobbies.layer.masksToBounds = true
        myHobbies.layer.cornerRadius = 5
        myHobbies.backgroundColor = .cyan
        
        myHobbiesText.text = thirdVCData.myHobbies
        myHobbiesText.numberOfLines = 0
        scrollView.addSubview(myHobbiesText)
        myHobbiesText.sizeToFit()
        myHobbiesText.snp.makeConstraints { (constr) in
            constr.left.equalTo(myHobbies).offset(175)
            constr.top.equalTo(thirdVCTitle).inset(50)
            constr.width.equalTo(175)
            constr.height.equalTo(250)
        }
        myHobbiesText.layer.masksToBounds = true
        myHobbiesText.textColor = .white
        
        myFavSport.numberOfLines = 0
        myFavSport.text = "Мой любимый вид спорта"
        scrollView.addSubview(myFavSport)
        myFavSport.snp.makeConstraints { (constr) in

            constr.left.equalToSuperview().inset(16)
            constr.top.equalTo(myHobbiesText).inset(250)
            constr.width.equalTo(150)
            constr.height.equalTo(250)
        }
        myFavSport.layer.masksToBounds = true
        myFavSport.backgroundColor = .cyan
        myFavSport.layer.cornerRadius = 5
        
        myFavSportText.text = thirdVCData.sport
        myFavSportText.layer.masksToBounds = true
        myFavSportText.textColor = .white
        scrollView.addSubview(myFavSportText)
        myFavSportText.snp.makeConstraints { (constr) in
            constr.left.equalTo(myFavSport).offset(175)
            constr.top.equalTo(myHobbiesText).inset(250)
            constr.height.equalTo(250)
        }
        
        myNewHobbie.text = "Мое новое увлечение"
        scrollView.addSubview(myNewHobbie)
        myNewHobbie.layer.masksToBounds = true
        myNewHobbie.backgroundColor = .cyan
        myNewHobbie.layer.cornerRadius = 5
        myNewHobbie.numberOfLines = 0
        myNewHobbie.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(16)
            constr.top.equalTo(myFavSport).inset(250)
            constr.width.equalTo(150)
            constr.height.equalTo(250)
        }
        
        myNewHobbieText.text = thirdVCData.newHobbie
        scrollView.addSubview(myNewHobbieText)
        myNewHobbieText.textColor = .white
        myNewHobbieText.snp.makeConstraints { (constr) in

            constr.left.equalTo(myNewHobbie).offset(175)
            constr.top.equalTo(myFavSportText).inset(250)
            constr.height.equalTo(250)
        }
        
        skiiOrBoard.setTitle("⛷ или 🏂", for: .normal)
        skiiOrBoard.backgroundColor = .darkGray
        skiiOrBoard.layer.cornerRadius = 10
        skiiOrBoard.layer.borderWidth = 3
        skiiOrBoard.layer.borderColor = .init(red: 1/255, green: 255/255, blue: 255/255, alpha: 1)
        scrollView.addSubview(skiiOrBoard)
        skiiOrBoard.addTarget(self, action: #selector(ThirdVC.btnAction), for: .allEvents)
        skiiOrBoard.snp.makeConstraints { (constr) in
            constr.top.equalTo(myNewHobbieText).inset(250)
            constr.centerX.equalToSuperview()
            constr.width.equalTo(125)
//
//            constr.top.equalTo(myNewHobbieText).inset(250)
//            constr.centerX.equalTo(contentView.snp.centerX)
//            constr.width.equalTo(125)
        }
    }
}
