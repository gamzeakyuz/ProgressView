//
//  ViewController.swift
//  AlertApp
//
//  Created by Gamze Akyüz on 11.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var view1: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view1.layer.cornerRadius = 10.0
    }
    @IBAction func startButton(_ sender: Any){
        updateProgress()
    }
    func updateProgress() {
        
        let totalProgress: Float = Float(timeTextField.text!) ?? 0.0 // Toplamda kaç adım sürecekse
        var currentProgress: Float = 0.0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            currentProgress += 1.0
            
            if currentProgress <= totalProgress {
                self.progressView.progress = currentProgress / totalProgress
                
            } else {
                timer.invalidate()
                self.alert()
            }
        }
    }
    @IBAction func restartButton(_ sender: Any){
        timeTextField.text = ""
        progressView.progress = 0.0
    }
    func alert(){
        let alert = UIAlertController(title: "Info", message: "Time's up!", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Close", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }


}

