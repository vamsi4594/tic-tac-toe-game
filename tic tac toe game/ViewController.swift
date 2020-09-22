//
//  ViewController.swift
//  tic tac toe game
//
//  Created by THANIKANTI VAMSI KRISHNA on 1/18/20.
//  Copyright © 2020 THANIKANTI VAMSI KRISHNA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // cross player, nought player is player 2
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
  
    @IBOutlet weak var winnerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
    }

    @IBAction func selectMark(_ sender: UIButton)
    {
        if gameState[sender.tag-1] == 0 && gameIsActive == true
        {
            gameState[sender.tag-1] = activePlayer
            if activePlayer == 1
            {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
                activePlayer = 2
            }else{
                sender.setImage(UIImage(named: "nought.png"), for: UIControl.State())
                activePlayer = 1
            }
        }
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                if gameState[combination[0]] == 1
                {
                    winnerLabel.text = "CROSS HAS WON!"
                }else{
                    winnerLabel.text = "NOUGHT HAS WON!"
                }
                winnerLabel.isHidden = false
                playAgainButton.isHidden = false
            }
            
        }
       gameIsActive = false
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false && winnerLabel.text == nil
        {
            winnerLabel.text = "ITS A DRAW"
            winnerLabel.isHidden = false
            playAgainButton.isHidden = false
        }
        
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton)
    {
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
    }
    
    
}

