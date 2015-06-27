//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Alex on 6/13/15.
//  Copyright (c) 2015 Alex Arze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var tigerArray:[Tiger] = []
    var lionArray:[Lion] = []
    
    var currentIndex:Int = 0
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger(name: "Tigger", age: 3, breed: "Bengal", image: UIImage(named: "BengalTiger.jpg"), subSpecies: "")
        
        var secondTiger = Tiger(name: "Tigress", age: 2, breed: "Indochinese Tiger", image: UIImage(named: "IndochineseTiger.jpg"), subSpecies: "")
        
        var thirdTiger = Tiger(name: "Jacob", age: 4, breed: "Malayan Tiger", image: UIImage(named: "MalayanTiger.jpg"), subSpecies: "")
        
        var fourthTiger = Tiger(name: "Scar", age: 5, breed: "Siberian Tiger", image: UIImage(named: "SiberianTiger.jpg"), subSpecies: "")
        
        var lion = Lion()
        lion.name = "Mufasa"
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.subSpecies = "West African"
        
        var lioness = Lion()
        lioness.name = "Mufasa"
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.subSpecies = "Barbary"

        self.tigerArray += [myTiger, secondTiger, thirdTiger, fourthTiger]
        self.lionArray += [lion, lioness]
        
        self.currentIndex = 0

        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        currentIndex++
        
//        setTigerProperties()
    }

    @IBAction func backBarButtonItemPressed(sender: UIBarButtonItem) {
        
        currentIndex--
        
        updateView()
    }
    
    func updateView() {
        
        if currentAnimal.species == "Tiger" {
            let currentArray = tigerArray
            println("\(currentIndex)")
            let openAnimal:Tiger = currentArray[currentIndex]
        }
        else {
            let currentArray = lionArray
            
            let openAnimal = currentArray[currentIndex]
        }
        
        if currentIndex < 0 {
            currentIndex = currentArray.count - 1
        }
        else if (currentIndex + 1 > currentArray.count) {
            currentIndex = 0
        }
        
        UIView.transitionWithView(
            self.view,
            duration: 1,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                
//                self.myImageView.image = openAnimal.image
//                self.nameLabel.text = openAnimal.name
//                self.ageLabel.text = "\(openAnimal.age)"
//                self.breedLabel.text = openAnimal.breed
//                self.randomFactLabel.text = openAnimal.randomFact()
            
            },
            completion: {
                (finished: Bool) -> () in
            }
        )
        
//        openAnimal.chuffNumberOfTimes(5)
    }
    
    func updateAnimal() {
        
        switch currentAnimal {
        case ("Tiger",_):
            let randomIndex = Int(arc4random_uniform(UInt32(lionArray.count)))
            currentAnimal = ("Lion", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(tigerArray.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
        
    }
    
}

