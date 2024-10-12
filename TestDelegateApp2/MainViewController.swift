//
//  MainViewController.swift
//  TestDelegateApp2
//
//  Created by Кирилл Сысоев on 12.10.24.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func updateScore(_ score: Int, _ segue: String)
}

class MainViewController: UIViewController {

    var score: Int = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "\(score)"
        
    }
    
    @IBOutlet weak var switcher: UISwitch!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        score += 1
        if score == 15 {
            performSegue(withIdentifier: "summaVC", sender: self)
        }
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        score -= 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ScoreViewController {
            destinationVC.score = score
            destinationVC.delegate = self
            destinationVC.bool = switcher.isOn
        }
    }
    
}

extension MainViewController: ViewControllerDelegate {
    func updateScore(_ score: Int, _ segue: String) {
        scoreLabel.text = "\(score)"
        self.score = score
    }
}
