//
//  ViewController.swift
//  practice2905
//
//  Created by Vlad on 29.05.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController, IViewController {
    
    var label:UILabel?
    var button: UIButton?
    var catView: UIImageView?
    var presenter: IPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        makeLabel()
        makeButton()
        makeImageView()

    }
    func makeLabel() {
        label = UILabel(frame: CGRect(x: 35, y: 350, width: 300, height: 150))
        label?.numberOfLines = 0
        label?.backgroundColor = .green
        view.addSubview(label ?? UILabel())
    }
    
    func makeButton() {
        button = UIButton(type: .system)
        view.addSubview(button ?? UIButton(type: .system))
        button?.addTarget(self, action: #selector(ViewController.btnAction), for: .allEvents)

        button?.setTitle("load cat", for: .normal)
        button?.backgroundColor = .cyan
        button?.layer.cornerRadius = 10
        button?.snp.makeConstraints { (constr) in
            constr.bottom.equalToSuperview().inset(175)
            constr.centerX.equalToSuperview()
            constr.width.equalTo(125)
        }
    }
    
    func makeImageView() {
        catView = UIImageView()
        catView?.backgroundColor = .black
        view.addSubview(catView ?? UIImageView())
        catView?.snp.makeConstraints({ (constr) in
            constr.top.equalToSuperview().inset(50)
            constr.centerX.equalToSuperview()
            constr.width.equalTo(300)
            constr.height.equalTo(300)
        })
        
    }
    
    func showText(text: String) {
        self.label?.text = text
        
    }
    
    func showImage(data: Data) {
        self.catView?.image = UIImage(data: data)
    }
    
    @objc func btnAction() {
        presenter = Presenter(view: self)
        presenter?.downloadData()
    }

}

