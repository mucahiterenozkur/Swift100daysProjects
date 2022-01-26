//
//  ViewController.swift
//  Project2
//
//  Created by Mücahit Eren Özkur on 26.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button2.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button3.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + "            Score: \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        questionsAsked += 1
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else{
            title = "Wrong! That's the flag of \(countries[sender.tag])"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        if questionsAsked != 5 {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        
        
        present(ac, animated: true)
        
        if questionsAsked == 5 {
            ac.addAction(UIAlertAction(title: "Final Score: \(score), Restart!", style: .default, handler: askQuestion))
            
            score = 0
            questionsAsked = 0
        }
        
    }
    
    

}

