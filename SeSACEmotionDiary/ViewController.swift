//
//  ViewController.swift
//  SeSACEmotionDiary
//
//  Created by Minho on 1/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slimeImages: [UIImage]!
    @IBOutlet var slimeButtons: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
    
    var tappedTimesList: [Int] = []
    
    let emotionTextList: [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "짜증나", "힘들어"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        
        slimeImages = [.slime1, .slime2, .slime3, .slime4, .slime5,
                       .slime6, .slime7, .slime8, .slime9]
        
        for i in 0..<9 {
            slimeButtons[i].setImage(slimeImages[i], for: .normal)
            slimeButtons[i].addTarget(self, action: #selector(didSlimeButtonTapped), for: .touchUpInside)
            tappedTimesList.append(UserDefaults.standard.integer(forKey: "EmotionCount \(i)"))
            emotionLabels[i].text = "\(emotionTextList[i]) \(tappedTimesList[i])"
        }
    }
    
    @objc func didSlimeButtonTapped(sender: UIButton!) {
        let index: Int = sender.tag
        
        tappedTimesList[index] += 1
        
        UserDefaults.standard.setValue(tappedTimesList[index], forKey: "EmotionCount \(index)")
        
        updateSlimeTextLabel(of: index)
    }
    
    func updateSlimeTextLabel(of index: Int) {
        let updatedText: String = "\(emotionTextList[index]) \( tappedTimesList[index])"
        
        emotionLabels[index].text = updatedText
    }
}

