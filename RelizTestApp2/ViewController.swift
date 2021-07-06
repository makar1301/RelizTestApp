//
//  ViewController.swift
//  RelizTestApp2
//
//  Created by Nikita Makarov on 06.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var popUpButton: UIButton!
    
    
    
    
    // MARK: - Internal Vars
    var screenArray = ["Screen 1", "Screen 2", "Screen 3", "Screen 4" ]
    var screenName = "Screen 1"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - In-Way Animation
    func buttonAnimationIn() {
        UIView.animate(withDuration: 0.6) {
            self.firstButton.transform = CGAffineTransform(translationX: 0, y: -150)
            self.secondButton.transform = CGAffineTransform(translationX: 0, y: -150)
            self.thirdButton.transform = CGAffineTransform(translationX: 0, y: -150)
            self.backButton.transform = CGAffineTransform(translationX: 0, y: -150)
            self.screenTitle.transform = CGAffineTransform(translationX: 0, y: -150)
            
            
            self.firstButton.alpha = 1.0
            self.secondButton.alpha = 1.0
            self.thirdButton.alpha = 1.0
            self.backButton.alpha = 1.0
            self.screenTitle.alpha = 1.0
        }
        self.firstButton.transform = CGAffineTransform.identity
        self.secondButton.transform = CGAffineTransform.identity
        self.thirdButton.transform = CGAffineTransform.identity
        self.backButton.transform = CGAffineTransform.identity
        self.screenTitle.transform = CGAffineTransform.identity
    }
    
    // MARK: - Out-Way Animation
    func buttonAnimationOut() {
        UIView.animate(withDuration: 0.2) {
            self.firstButton.transform = CGAffineTransform(translationX: 0, y: -20)
            self.secondButton.transform = CGAffineTransform(translationX: 0, y: -20)
            self.thirdButton.transform = CGAffineTransform(translationX: 0, y: -20)
            self.backButton.transform = CGAffineTransform(translationX: 0, y: -50)
            self.screenTitle.transform = CGAffineTransform(translationX: 0, y: -50)
            
            
            
            self.firstButton.alpha = 0.0
            self.secondButton.alpha = 0.0
            self.thirdButton.alpha = 0.0
            self.backButton.alpha = 0.0
            self.screenTitle.alpha = 0.0
        }
       
    }
    
    // MARK: - Settings of view
    func setView() {
        screenTitle.text = screenName
        var index = 1
        for item in screenArray {
            if item == screenName { }
            else { switch index{
            case 1:
                firstButton.setTitle(item, for: .normal)
                index += 1
            case 2: secondButton.setTitle(item, for: .normal)
                index += 1
            case 3: thirdButton.setTitle(item, for: .normal)
            default: break
            }
                
            }
        }
    }

    
    // MARK: - IBActions
    @IBAction func backButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = UIColor.white
            self.mainView.removeFromSuperview()
        }
    }
    @IBAction func screen1Tapped(_ sender: UIButton) {
        screen1Button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        mainView.center = self.view.center
        mainView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        mainView.layer.position.y = 700
        mainView.layer.position.x = self.view.layer.position.x
        self.view.addSubview(mainView)
        setView()
        UIView.animate(withDuration: 0.6) {
            self.mainView.center = self.view.center
            self.screen1Button.transform = CGAffineTransform.identity
        }
        
    }
    
    @IBAction func popUpTapped(_ sender: UIButton) {
        popUpButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        self.view.addSubview(mainView)
        mainView.frame.size = CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 0.8)
        mainView.layer.position.x = 600
        mainView.layer.position.y = self.view.layer.position.y
        mainView.layer.cornerRadius = 16
        setView()
        
        UIView.animate(withDuration: 0.6) {
            self.mainView.center = self.view.center
            self.view.backgroundColor = UIColor(red: 137/255, green: 151/255, blue: 244/255, alpha: 0.8)
            self.popUpButton.transform = CGAffineTransform.identity
        }
    }
    
    
    @IBAction func firstButton(_ sender: UIButton) {
        firstButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        self.screenName = firstButton.title(for: .normal)!
        buttonAnimationOut()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.buttonAnimationIn()
        }
        setView()
    }
    
    @IBAction func secondButton(_ sender: UIButton) {
        secondButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        self.screenName = secondButton.title(for: .normal)!
        buttonAnimationOut()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.buttonAnimationIn()
        }
        setView()
    }
    
    
    @IBAction func thirdButton(_ sender: UIButton) {
        thirdButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        self.screenName = thirdButton.title(for: .normal)!
        buttonAnimationOut()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.buttonAnimationIn()
        }
        setView()
    }
}

