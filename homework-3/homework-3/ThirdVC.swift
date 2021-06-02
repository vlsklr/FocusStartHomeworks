//
//  ThirdVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit
import SnapKit

class ThirdVC: UIViewController, ILoggerProtocol {
    let scrollView = UIScrollView()
    let thirdVCTitle = UILabel()
    let myHobbies = UILabel()
    let myHobbiesText = UILabel()
    let myFavSport = UILabel()
    let myFavSportText = UILabel()
    let myNewHobbie = UILabel()
    let myNewHobbieText = UILabel()
    let skiiOrBoard = UIButton(type: .system)
    let pushViewControllerButton = UIButton(type: .system)
    let thirdVCData = ThirdVCData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initThirdVC()
        didLoadAnimate()
    }
    
    func printState(state: String) {
        print("ThirdVC has \(state)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printState(state: "appeared")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        printState(state: "disappeared")
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
    
    @objc func buttonAction() {
        var animator = UIViewPropertyAnimator()
        animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
            self.skiiOrBoard.backgroundColor = .black
        })
        animator.startAnimation()
        let alert = UIAlertController(title: "Почему или?", message: "И!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Понятно", style: .default))
        self.present(alert, animated: true)
    }
    
    @objc func tableViewOpener() {
        let pushViewController = PushViewController()
        self.navigationController?.pushViewController(pushViewController, animated: true)
    }
    
    func initScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + (tabBarController?.tabBar.bounds.height ?? 100))
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { constr in
            constr.top.bottom.leading.trailing.equalTo(view)
            constr.height.equalTo(scrollView.contentSize.height)
            constr.width.equalTo(view.bounds.width)
        }
    }
    
    func initMyHobbies() {
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
    }
    
    func initMyFavoriteSport() {
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
    }
    
    func initMyNewHobbie() {
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
    }
    
    func initButton() {
        skiiOrBoard.setTitle("⛷ или 🏂", for: .normal)
        skiiOrBoard.backgroundColor = .darkGray
        skiiOrBoard.layer.cornerRadius = 10
        skiiOrBoard.layer.borderWidth = 3
        skiiOrBoard.layer.borderColor = .init(red: 1/255, green: 255/255, blue: 255/255, alpha: 1)
        scrollView.addSubview(skiiOrBoard)
        skiiOrBoard.addTarget(self, action: #selector(ThirdVC.buttonAction), for: .allEvents)
        skiiOrBoard.snp.makeConstraints { (constr) in
            constr.top.equalTo(myNewHobbieText).inset(265)
            constr.centerX.equalToSuperview()
            constr.width.equalTo(125)
        }
    }
    
    func initPushViewControllerButton() {
        pushViewControllerButton.setTitle("Покажи цитатки", for: .normal)
        pushViewControllerButton.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        scrollView.addSubview(pushViewControllerButton)
        pushViewControllerButton.addTarget(self, action: #selector(ThirdVC.tableViewOpener), for: .touchUpInside)
        pushViewControllerButton.snp.makeConstraints { (constr) in
            constr.top.equalTo(skiiOrBoard).inset(50)
            constr.bottom.equalToSuperview().inset(75	)
            constr.centerX.equalToSuperview()
            constr.width.equalTo(125)
        }
    }
    
    func initThirdVC() {
        view.backgroundColor = .blue
        thirdVCTitle.text = "Мои увлечения"
        scrollView.addSubview(thirdVCTitle)
        thirdVCTitle.snp.makeConstraints { (constr) in
            constr.left.equalToSuperview().inset(130)
            constr.top.equalToSuperview().inset(50)
        }
        initMyHobbies()
        initMyFavoriteSport()
        initMyNewHobbie()
        initButton()
        initPushViewControllerButton()
        initScrollView()
    }
}
