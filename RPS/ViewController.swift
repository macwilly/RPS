//
//  ViewController.swift
//  RPS
//
//  Created by Mackenzie Willard on 3/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var appsSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var playerSignRock: UIButton!
    @IBOutlet weak var playerSignPaper: UIButton!
    @IBOutlet weak var playerSignScissor: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isStart()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func playerSignRockAction(_ sender: UIButton) {
        play(Signs.rock)
    }
    
    @IBAction func playerSignPaperAction(_ sender: UIButton) {
        play(Signs.paper)
    }
    
    @IBAction func playerSignScissorAction(_ sender: UIButton) {
        play(Signs.scissor)
    }
    
    @IBAction func playAgainAction(_ sender: Any) {
        isStart()
    }
    
    func gameStatusChange(_ state: GameState){
        changeGameStatusMessage(state)
        changeBackGroundColor(state)
    }
    
    func changeGameStatusMessage(_ state: GameState){
        gameStatus.text = state.stateMessage
    }
    
    func changeBackGroundColor(_ state: GameState) {
        view.backgroundColor = state.stateColor
    }
    
    func isStart(){
        let playerButtons: [UIButton] = [playerSignRock, playerSignPaper, playerSignScissor]
        appsSign.text = "🤖"
        playAgain.isHidden = true
        
        //updating all of the buttons
        for pb in playerButtons{
            enableAndShow(pb)
        }
        
    }
    
    func enableAndShow(_ button: UIButton){
        button.isHidden = false
        button.isEnabled = true
    }
    
    func play(_ playerSign: Signs) {
        let playerButtons: [UIButton] = [playerSignRock, playerSignPaper, playerSignScissor]
        let computerSign: Signs = playerSign.randomSign()
        let gameStatus: GameState = playerSign.compareSigns(opponentSign: computerSign)
        gameStatusChange(gameStatus)
        appsSign.text = computerSign.displaySign
        for pb in playerButtons {
            pb.isEnabled = false
        }
        hide(sign: playerSign)
        playAgain.isHidden = false
    }
    
    func hide(sign: Signs){
        switch sign {
        case .rock:
            playerSignPaper.isHidden = true
            playerSignScissor.isHidden = true
        case .paper:
            playerSignRock.isHidden = true
            playerSignScissor.isHidden = true
        case .scissor:
            playerSignRock.isHidden = true
            playerSignPaper.isHidden = true
        }
            
    }
    
}

