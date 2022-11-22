//
//  Play1ViewController.swift
//  RockPaperScissors_Challenge
//
//  Created by MAX WIDHALM on 11/17/22.
//
import UIKit

enum Choice {
    case rock, paper, scissors
}

class Play1ViewController: UIViewController {
    
    var cpuChoice : Choice?
    var p1Choice : Choice?
    var p1Wins = 0
    var p1Streak = 0
    var cpuWins = 0

    @IBOutlet weak var resultLabelOutlet: UILabel!
    
    @IBOutlet weak var cpuImageViewOutlet: UIImageView!
    @IBOutlet weak var p1ImageViewOutlet: UIImageView!
    
    @IBOutlet weak var cpuWinsLabelOutlet: UILabel!
    @IBOutlet weak var p1WinsLabelOutlet: UILabel!
    @IBOutlet weak var p1StreakLabelOutlet: UILabel!
    
    @IBOutlet weak var rockOutlet: UIImageView!
    @IBOutlet weak var paperOutlet: UIImageView!
    @IBOutlet weak var scissorsOutlet: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        
        let temp = Int.random(in: 1...3)
        if temp == 1 {
            cpuChoice = Choice.rock
        } else if temp == 2 {
            cpuChoice = Choice.paper
        } else {
            cpuChoice = Choice.scissors
        }
        print("2")

    }
    
    func checkChoice() {
        if p1Choice != nil {
            // P1 Chose Rock
            if p1Choice == Choice.rock && cpuChoice == Choice.rock {
                resultLabelOutlet.text = "Tie: Both Chose Rock"
                cpuImageViewOutlet.image = UIImage(named: "theRock.png")
            } else if p1Choice == Choice.rock && cpuChoice == Choice.paper {
                resultLabelOutlet.text = "CPU Wins: Paper Beats Rock"
                cpuImageViewOutlet.image = UIImage(named: "paper.png")
                p1Streak = 0
                cpuWins += 1
            }
            else if p1Choice == Choice.rock && cpuChoice == Choice.scissors {
                resultLabelOutlet.text = "P1 Wins: Rock Smashes Scissors"
                cpuImageViewOutlet.image = UIImage(named: "scissors.png")
                p1Streak += 1
                p1Wins += 1
            }
            // P1 Chose Paper
            if p1Choice == Choice.paper && cpuChoice == Choice.rock {
                resultLabelOutlet.text = "P1 Wins: Paper Beats Rock"
                cpuImageViewOutlet.image = UIImage(named: "theRock.png")
                p1Streak += 1
                p1Wins += 1
            } else if p1Choice == Choice.paper && cpuChoice == Choice.paper {
                resultLabelOutlet.text = "Tie: Both Chose Paper"
                cpuImageViewOutlet.image = UIImage(named: "paper.png")
            }
            else if p1Choice == Choice.paper && cpuChoice == Choice.scissors {
                resultLabelOutlet.text = "CPU Wins: Scissors Cuts Paper"
                cpuImageViewOutlet.image = UIImage(named: "scissors.png")
                p1Streak = 0
                cpuWins += 1
            }
            // P1 Chose Scissors
            if p1Choice == Choice.scissors && cpuChoice == Choice.rock {
                resultLabelOutlet.text = "CPU Wins: Rock Smashes Scissors"
                cpuImageViewOutlet.image = UIImage(named: "theRock.png")
                p1Streak = 0
                cpuWins += 1
            } else if p1Choice == Choice.scissors && cpuChoice == Choice.paper {
                resultLabelOutlet.text = "P1 Wins: Scissors Cuts Paper"
                cpuImageViewOutlet.image = UIImage(named: "paper.png")
                p1Streak += 1
                p1Wins += 1
            }
            else if p1Choice == Choice.scissors && cpuChoice == Choice.scissors {
                resultLabelOutlet.text = "Tie: Both Chose Rock"
                cpuImageViewOutlet.image = UIImage(named: "scissors.png")
            }
            rockOutlet.isUserInteractionEnabled = false
            paperOutlet.isUserInteractionEnabled = false
            scissorsOutlet.isUserInteractionEnabled = false
            
            cpuWinsLabelOutlet.text = "CPU: \(cpuWins)"
            p1WinsLabelOutlet.text = "P1: \(p1Wins)"
            p1StreakLabelOutlet.text = "Streak: \(p1Streak)"
        }
    }
    
    func playAgain() {
        let temp = Int.random(in: 1...3)
        if temp == 1 {
            cpuChoice = Choice.rock
        } else if temp == 2 {
            cpuChoice = Choice.paper
        } else {
            cpuChoice = Choice.scissors
        }
        
        rockOutlet.isUserInteractionEnabled = true
        paperOutlet.isUserInteractionEnabled = true
        scissorsOutlet.isUserInteractionEnabled = true

        cpuImageViewOutlet.image = UIImage(named: "")
        p1ImageViewOutlet.image = UIImage(named: "")
        resultLabelOutlet.text = "Choose your weapon"
        
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        playAgain()
    }
    
    
    @IBAction func rockAction(_ sender: UITapGestureRecognizer) {
        print("YOOOOOO")
        p1Choice = Choice.rock
        p1ImageViewOutlet.image = UIImage(named: "theRock.png")
        checkChoice()
    }
    @IBAction func paperAction(_ sender: UITapGestureRecognizer) {
        print("YOOOOOO")
        p1Choice = Choice.paper
        p1ImageViewOutlet.image = UIImage(named: "paper.png")
        checkChoice()
    }
    @IBAction func scissorsAction(_ sender: UITapGestureRecognizer) {
        print("YOOOOOO")
        p1Choice = Choice.scissors
        p1ImageViewOutlet.image = UIImage(named: "scissors.png")
        checkChoice()
    }
    
}
