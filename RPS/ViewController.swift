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
        
        isStart(GameState.start)
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
        isStart(GameState.start)
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
    
    func isStart(_ status: GameState){
        let playerButtons: [UIButton] = [playerSignRock, playerSignPaper, playerSignScissor]
        appsSign.text = "🤖"
        playAgain.isHidden = true
        view.backgroundColor = status.stateColor
        gameStatus.text = status.stateMessage
        
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
        print("PLayer Sign is \(playerSign)")
        let playerButtons: [UIButton] = [playerSignRock, playerSignPaper, playerSignScissor]
        let computerSign: Signs = playerSign.randomSign()
        let gameStatus: GameState = playerSign.compareSigns(opponentSign: computerSign)
        gameStatusChange(gameStatus)
        appsSign.text = computerSign.displaySign
        for pb in playerButtons {
            pb.isEnabled = false
        }
        hide(playerSign)
        playAgain.isHidden = false
    }
    
    func hide(_ sentSign: Signs){
        print("Sent Sign is \(sentSign)")
        switch sentSign {
        case .rock:
            print("Here rock")
            playerSignPaper.isHidden = true
            playerSignScissor.isHidden = true
        case .paper:
            print("Here Paper")
            playerSignRock.isHidden = true
            playerSignScissor.isHidden = true
        case .scissor:
            print("Here Scissors")
            playerSignRock.isHidden = true
            playerSignPaper.isHidden = true
        }
    }
    
}

