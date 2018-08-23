//
//  ViewController.swift
//  Dice
//
//  Created by Sakthivel Balakrishnan on 22/08/18.
//  Copyright © 2018 Sakthivel Balakrishnan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randomNumber1:Int = 0
    var randomNumber2:Int = 0
    let dice:[String] = ["dice1.png","dice2.png","dice3.png","dice4.png","dice5.png","dice6.png"]
    let background:UIImageView={
        let image=UIImageView(image: #imageLiteral(resourceName: "newbackground"))
        image.translatesAutoresizingMaskIntoConstraints=false
        return image
    }()
    let diceimage1:UIImageView={
        let image=UIImageView(image: #imageLiteral(resourceName: "dice1"))
        image.translatesAutoresizingMaskIntoConstraints=false
        image.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 130),
            image.widthAnchor.constraint(equalToConstant: 130)
            ])
        return image
    }()
    let diceimage2:UIImageView={
        let image=UIImageView(image: #imageLiteral(resourceName: "dice1"))
        image.translatesAutoresizingMaskIntoConstraints=false
        image.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 130),
            image.widthAnchor.constraint(equalToConstant: 130)
            ])
        return image
    }()
    let logoImage:UIImageView={
        let image=UIImageView(image: #imageLiteral(resourceName: "diceeLogo"))
        image.translatesAutoresizingMaskIntoConstraints=false
        image.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200)
            ])
        return image
    }()
    let roll:UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        button.setTitle(" ROLL ", for: .normal)
        button.addTarget(self, action: #selector(rolldice), for: .touchUpInside)
        button.backgroundColor=UIColor.red
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 90)
            ])
        return button
    }()
    @objc func rolldice(){
        randomNumber1 = Int(arc4random_uniform(6))
        randomNumber2 = Int(arc4random_uniform(6))
        diceimage1.image=UIImage(named: dice[randomNumber1])
        diceimage2.image=UIImage(named: dice[randomNumber2])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leftAnchor.constraint(equalTo: view.leftAnchor),
            background.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
        view.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ])
        view.addSubview(diceimage1)
        view.addSubview(diceimage2)
        NSLayoutConstraint.activate([
            diceimage1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 20),
            diceimage2.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            diceimage1.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            diceimage2.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
            ])
        view.addSubview(roll)
        NSLayoutConstraint.activate([
            roll.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            roll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -view.frame.height/9)
            ])
        rolldice()
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        rolldice()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

