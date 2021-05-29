//
//  IViewController.swift
//  practice2905
//
//  Created by Vlad on 29.05.2021.
//
import Foundation

protocol IViewController: AnyObject {
    func showText(text: String)
    func showImage(data: Data)
    
}
