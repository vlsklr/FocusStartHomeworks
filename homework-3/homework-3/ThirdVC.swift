//
//  ThirdVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit
import SnapKit

class ThirdVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initThirdVC()
    }
    let thirdVCTitle = UILabel()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        
    }
    let skiiOrBoard = UIButton(type: .system)
    @objc func btnAction() {
        let alert = UIAlertController(title: "Почему или?", message: "И!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Понятно", style: .default))
        //self.present(alert, animated: true)
        
        var animator = UIViewPropertyAnimator()
        animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
         
            self.skiiOrBoard.backgroundColor = .black
         
        })
         
        animator.startAnimation()
    }
    
    func initThirdVC() {
        let thirdVCData = ThirdVCData()
        
        thirdVCTitle.text = "Мои увлечения"
        self.view.addSubview(thirdVCTitle)
        thirdVCTitle.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(130)
            constr.top.equalToSuperview().inset(50)
        }
        
        let myHobbies = UILabel()
        myHobbies.text = "Мои увлечения"
        self.view.addSubview(myHobbies)
        myHobbies.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(16)
            constr.top.equalTo(thirdVCTitle).inset(50)
        }
        
        let myHobbiesText = UILabel()
        myHobbiesText.text = thirdVCData.myHobbies
        myHobbiesText.numberOfLines = 0
        self.view.addSubview(myHobbiesText)
        myHobbiesText.sizeToFit()
        myHobbiesText.snp.makeConstraints { (constr) in
            constr.right.equalToSuperview().inset(16)
            constr.top.equalTo(thirdVCTitle).inset(50)
            constr.width.equalTo(175)
        }
        
        let myFavSport = UILabel()
        myFavSport.text = "Мой любимый вид спорта"
        self.view.addSubview(myFavSport)
        myFavSport.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(16)
            constr.top.equalTo(myHobbiesText).inset(225)
        }
        
        let myFavSportText = UILabel()
        myFavSportText.text = thirdVCData.sport
        self.view.addSubview(myFavSportText)
        myFavSportText.snp.makeConstraints { (constr) in
            constr.right.equalToSuperview().inset(16)
            constr.top.equalTo(myHobbiesText).inset(225)
        }
        
        let myNewHobbie = UILabel()
        myNewHobbie.text = "Мое новое увлечение"
        self.view.addSubview(myNewHobbie)
        myNewHobbie.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(16)
            constr.top.equalTo(myFavSport).inset(50)
        }
        
        let myNewHobbieText = UILabel()
        myNewHobbieText.text = thirdVCData.newHobbie
        self.view.addSubview(myNewHobbieText)
        myNewHobbieText.snp.makeConstraints { (constr) in
            constr.right.equalToSuperview().inset(16)
            constr.top.equalTo(myFavSportText).inset(50)
        }
        
        
        skiiOrBoard.setTitle("⛷ или 🏂", for: .normal)
        skiiOrBoard.backgroundColor = .darkGray
        skiiOrBoard.layer.cornerRadius = 10
        self.view.addSubview(skiiOrBoard)
        skiiOrBoard.addTarget(self, action: #selector(ThirdVC.btnAction), for: .allEvents)
        skiiOrBoard.snp.makeConstraints { (constr) in
            constr.bottom.equalToSuperview().inset(175)
            constr.centerX.equalToSuperview()
            constr.width.equalTo(125)
        }
    }
}
