//
//  View.swift
//  homework-3
//
//  Created by Vlad on 29.05.2021.
//

import UIKit
import SnapKit

class View: UIViewController {
    
    let thirdVCTitle = UILabel()
    let myHobbies = UILabel()
    let myHobbiesText = UILabel()
    let myFavSport = UILabel()
    let myFavSportText = UILabel()
    let myNewHobbie = UILabel()
    let myNewHobbieText = UILabel()
    let skiiOrBoard = UIButton(type: .system)
    //биндим данные из ViewModel
    var viewModel: ViewModel = ViewModel(){
        didSet {
            self.thirdVCTitle.text = viewModel.myHobbie.myHobbieTittle
            
            self.myHobbies.text = viewModel.myHobbie.myHobbieTittle
            self.myHobbiesText.text = viewModel.myHobbie.myHobbieText
            
            self.myFavSport.text = viewModel.mySport.mySportTittle
            self.myFavSportText.text = viewModel.mySport.mySportText
            
            self.myNewHobbie.text = viewModel.myNewHobbie.myNewHobbieTittle
            self.myNewHobbieText.text = viewModel.myNewHobbie.myNewHobbieText
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        initThirdVC()
        didLoadAnimate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    //Анимация при первом открытии экрана
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
    //Обработка нажатия на кнопку
    @objc func btnAction() {
        //Анимируем состояния кнопки
        var animator = UIViewPropertyAnimator()
        animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
            self.skiiOrBoard.backgroundColor = .black
        })
        animator.startAnimation()
        let alert = UIAlertController(title: "Почему или?", message: "И!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Понятно", style: .default))
        self.present(alert, animated: true)
    }
    //Настраиваем лейблы(цвета констрейнты) и кнопку при загрузке View
    func initThirdVC() {
        view.backgroundColor = .blue
        self.view.addSubview(thirdVCTitle)
        thirdVCTitle.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(130)
            constr.top.equalToSuperview().inset(50)
        }
        
        self.view.addSubview(myHobbies)
        myHobbies.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(16)
            constr.top.equalTo(thirdVCTitle).inset(50)
        }
        myHobbies.layer.masksToBounds = true
        myHobbies.layer.cornerRadius = 5
        myHobbies.backgroundColor = .cyan
        
        myHobbiesText.numberOfLines = 0
        self.view.addSubview(myHobbiesText)
        myHobbiesText.sizeToFit()
        myHobbiesText.snp.makeConstraints { (constr) in
            constr.right.equalToSuperview().inset(16)
            constr.top.equalTo(thirdVCTitle).inset(50)
            constr.width.equalTo(175)
        }
        myHobbiesText.layer.masksToBounds = true
        myHobbiesText.textColor = .white
        
        self.view.addSubview(myFavSport)
        myFavSport.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(16)
            constr.top.equalTo(myHobbiesText).inset(225)
        }
        myFavSport.layer.masksToBounds = true
        myFavSport.backgroundColor = .cyan
        myFavSport.layer.cornerRadius = 5
        
        myFavSportText.layer.masksToBounds = true
        myFavSportText.textColor = .white
        self.view.addSubview(myFavSportText)
        myFavSportText.snp.makeConstraints { (constr) in
            constr.right.equalToSuperview().inset(16)
            constr.top.equalTo(myHobbiesText).inset(225)
        }
        
        self.view.addSubview(myNewHobbie)
        myNewHobbie.layer.masksToBounds = true
        myNewHobbie.backgroundColor = .cyan
        myNewHobbie.layer.cornerRadius = 5
        myNewHobbie.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(16)
            constr.top.equalTo(myFavSport).inset(50)
        }
        
        self.view.addSubview(myNewHobbieText)
        myNewHobbieText.textColor = .white
        myNewHobbieText.snp.makeConstraints { (constr) in
            constr.right.equalToSuperview().inset(16)
            constr.top.equalTo(myFavSportText).inset(50)
        }
        
        skiiOrBoard.setTitle("⛷ или 🏂", for: .normal)
        skiiOrBoard.backgroundColor = .darkGray
        skiiOrBoard.layer.cornerRadius = 10
        skiiOrBoard.layer.borderWidth = 3
        skiiOrBoard.layer.borderColor = .init(red: 1/255, green: 255/255, blue: 255/255, alpha: 1)
        self.view.addSubview(skiiOrBoard)
        skiiOrBoard.addTarget(self, action: #selector(View.btnAction), for: .allEvents)
        skiiOrBoard.snp.makeConstraints { (constr) in
            constr.bottom.equalToSuperview().inset(175)
            constr.centerX.equalToSuperview()
            constr.width.equalTo(125)
        }
    }
}
