//
//  Play2ViewController.swift
//  RockPaperScissors_Challenge
//
//  Created by MAX WIDHALM on 11/17/22.
//

import UIKit

class Play2ViewController: UIViewController {

    var p1Choice : Choice?
    var p2Choice : Choice?
    var p1Wins = 0
    var p1Streak = 0
    var p2Wins = 0
    var p2Streak = 0

    @IBOutlet weak var resultLabelOutlet: UILabel!
    
    @IBOutlet weak var p2ImageViewOutlet: UIImageView!
    @IBOutlet weak var p1ImageViewOutlet: UIImageView!
    
    @IBOutlet weak var p1WinsLabelOutlet: UILabel!
    @IBOutlet weak var p1StreakLabelOutlet: UILabel!
    @IBOutlet weak var p2WinsLabelOutlet: UILabel!
    @IBOutlet weak var p2StreakLabelOutlet: UILabel!
    
    @IBOutlet weak var rockOutlet1: UIImageView!
    @IBOutlet weak var paperOutlet1: UIImageView!
    @IBOutlet weak var scissorsOutlet1: UIImageView!
    
    @IBOutlet weak var rockOutlet2: UIImageView!
    @IBOutlet weak var paperOutlet2: UIImageView!
    @IBOutlet weak var scissorsOutlet2: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        
//        let temp = Int.random(in: 1...3)
//        if temp == 1 {
//            cpuChoice = Choice.rock
//        } else if temp == 2 {
//            cpuChoice = Choice.paper
//        } else {
//            cpuChoice = Choice.scissors
//        }
        print("2")

    }
    
    func checkChoice() {
        if p1Choice != nil && p2Choice != nil {
            // P1 Chose Rock
            if p1Choice == Choice.rock && p2Choice == Choice.rock {
                resultLabelOutlet.text = "Tie: Both Chose Rock"
                p1ImageViewOutlet.image = UIImage(named: "theRock.png")
                p2ImageViewOutlet.image = UIImage(named: "theRock.png")
            } else if p1Choice == Choice.rock && p2Choice == Choice.paper {
                resultLabelOutlet.text = "P2 Wins: Paper Beats Rock"
                p1ImageViewOutlet.image = UIImage(named: "theRock.png")
                p2ImageViewOutlet.image = UIImage(named: "paper.png")
                p1Streak = 0
                p2Wins += 1
                p2Streak += 1
            }
            else if p1Choice == Choice.rock && p2Choice == Choice.scissors {
                resultLabelOutlet.text = "P1 Wins: Rock Smashes Scissors"
                p1ImageViewOutlet.image = UIImage(named: "theRock.png")
                p2ImageViewOutlet.image = UIImage(named: "scissors.png")
                p1Streak += 1
                p1Wins += 1
                p2Streak = 0
            }
            // P1 Chose Paper
            if p1Choice == Choice.paper && p2Choice == Choice.rock {
                resultLabelOutlet.text = "P1 Wins: Paper Beats Rock"
                p1ImageViewOutlet.image = UIImage(named: "paper.png")
                p2ImageViewOutlet.image = UIImage(named: "theRock.png")
                p1Streak += 1
                p1Wins += 1
                p2Streak = 0
            } else if p1Choice == Choice.paper && p2Choice == Choice.paper {
                resultLabelOutlet.text = "Tie: Both Chose Paper"
                p1ImageViewOutlet.image = UIImage(named: "paper.png")
                p2ImageViewOutlet.image = UIImage(named: "paper.png")
            }
            else if p1Choice == Choice.paper && p2Choice == Choice.scissors {
                resultLabelOutlet.text = "P2 Wins: Scissors Cuts Paper"
                p1ImageViewOutlet.image = UIImage(named: "paper.png")
                p2ImageViewOutlet.image = UIImage(named: "scissors.png")
                p1Streak = 0
                p2Wins += 1
                p2Streak += 1
            }
            // P1 Chose Scissors
            if p1Choice == Choice.scissors && p2Choice == Choice.rock {
                resultLabelOutlet.text = "P2 Wins: Rock Smashes Scissors"
                p1ImageViewOutlet.image = UIImage(named: "scissors.png")
                p2ImageViewOutlet.image = UIImage(named: "theRock.png")
                p1Streak = 0
                p2Wins += 1
                p2Streak += 1
            } else if p1Choice == Choice.scissors && p2Choice == Choice.paper {
                resultLabelOutlet.text = "P1 Wins: Scissors Cuts Paper"
                p1ImageViewOutlet.image = UIImage(named: "scissors.png")
                p2ImageViewOutlet.image = UIImage(named: "paper.png")
                p1Streak += 1
                p1Wins += 1
                p2Streak = 0
            }
            else if p1Choice == Choice.scissors && p2Choice == Choice.scissors {
                resultLabelOutlet.text = "Tie: Both Chose Rock"
                p1ImageViewOutlet.image = UIImage(named: "scissors.png")
                p2ImageViewOutlet.image = UIImage(named: "scissors.png")
            }
            rockOutlet1.isUserInteractionEnabled = false
            paperOutlet1.isUserInteractionEnabled = false
            scissorsOutlet1.isUserInteractionEnabled = false
            
            rockOutlet2.isUserInteractionEnabled = false
            paperOutlet2.isUserInteractionEnabled = false
            scissorsOutlet2.isUserInteractionEnabled = false
            
            p2WinsLabelOutlet.text = "P2: \(p2Wins)"
            p2StreakLabelOutlet.text = "Streak: \(p2Streak)"
            p1WinsLabelOutlet.text = "P1: \(p1Wins)"
            p1StreakLabelOutlet.text = "Streak: \(p1Streak)"
        }
    }
    
    func playAgain() {
        
        p1Choice = nil
        p2Choice = nil
        
        rockOutlet1.isUserInteractionEnabled = true
        paperOutlet1.isUserInteractionEnabled = true
        scissorsOutlet1.isUserInteractionEnabled = true
        
        rockOutlet2.isUserInteractionEnabled = true
        paperOutlet2.isUserInteractionEnabled = true
        scissorsOutlet2.isUserInteractionEnabled = true

        p2ImageViewOutlet.image = UIImage(named: "")
        p1ImageViewOutlet.image = UIImage(named: "")
        resultLabelOutlet.text = "Choose your weapon"
        
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        playAgain()
    }
    
    
    @IBAction func rockAction1(_ sender: UITapGestureRecognizer) {
        print("YOOOOOO")
        p1Choice = Choice.rock
        //p1ImageViewOutlet.image = UIImage(named: "theRock.png")
        checkChoice()
    }
    @IBAction func paperAction1(_ sender: UITapGestureRecognizer) {
        print("YOOOOOO")
        p1Choice = Choice.paper
       // p1ImageViewOutlet.image = UIImage(named: "paper.png")
        checkChoice()
    }
    @IBAction func scissorsAction1(_ sender: UITapGestureRecognizer) {
        print("YOOOOOO")
        p1Choice = Choice.scissors
        //p1ImageViewOutlet.image = UIImage(named: "scissors.png")
        checkChoice()
    }
    
    @IBAction func rockAction2(_ sender: UITapGestureRecognizer) {
        print("YOOOOOO")
        p2Choice = Choice.rock
        //p2ImageViewOutlet.image = UIImage(named: "theRock.png")
        checkChoice()
    }
    @IBAction func paperAction2(_ sender: UITapGestureRecognizer) {
        print("YOOOOOO")
        p2Choice = Choice.paper
        //p2ImageViewOutlet.image = UIImage(named: "paper.png")
        checkChoice()
    }
    @IBAction func scissorsAction2(_ sender: UITapGestureRecognizer) {
        print("YOOOOOO")
        p2Choice = Choice.scissors
        //p2ImageViewOutlet.image = UIImage(named: "scissors.png")
        checkChoice()
    }
    

}
