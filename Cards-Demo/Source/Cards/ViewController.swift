//
//  ViewController.swift
//  Cards
//
//  Created by Paolo on 05/10/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class ViewController: UIViewController,CardDelegate {
    let icons: [UIImage] = [
        
        UIImage(named: "grBackground")!,
        UIImage(named: "background")!,
        UIImage(named: "flappy")!,
        UIImage(named: "flBackground")!,
        UIImage(named: "Icon")!,
        UIImage(named: "mvBackground")!
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGroupSliding()
        addCardPlay()
        addArtile()
        addCardGroup()
    }
    func addGroupSliding() {
        // Data source for CardGroupSliding
    
        
        let card = CardGroupSliding(frame: CGRect(x: 20, y: 50, width: (view.bounds.width-40)/2 , height: (view.bounds.width-40)/2))
        card.textColor = UIColor.black
        
        card.icons = icons
        card.iconsSize = 30
        card.iconsRadius = 5
        card.title = "from the editors"
        card.subtitle = "Welcome to XI Cards !"
        
        // card.subtitleLbl.textAlignment = .center
        card.titleSize = 15
        card.delegate =  self
        
        card.backgroundImage = icons[5]
        
        view.addSubview(card)
    }
    
    func addCardPlay() {
        let card = CardPlayer(frame: CGRect(x: 20, y: (view.bounds.width-40)/2+70, width: view.bounds.width-40 , height: view.bounds.width-40))
        card.textColor = UIColor.black
        card.videoSource = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        self.addChildViewController(card.player)    /// IMPORTANT: Don't forget this
        
        card.playerCover = UIImage(named: "mvBackground")!  // Shows while the player is loading
        card.playImage = UIImage(named: "CardPlayerPlayIcon")!  // Play button icon
        
        card.isAutoplayEnabled = true
        card.shouldRestartVideoWhenPlaybackEnds = true
        
        card.title = "Big Buck Bunny"
        card.subtitle = "Inside the extraordinary world of Buck Bunny"
        card.category = "today's movie"
        card.delegate = self
        
        view.addSubview(card)
    }
    func addArtile() {
        let card = CardArticle.init(frame: CGRect(x: 20, y: view.bounds.height - ((view.bounds.width-40)/4) - 10,  width: view.bounds.width-40 , height: (view.bounds.width-40)/4))
        card.category = "category"
        card.title = "article card coming"
        card.subtitle = "my favourate"
        card.delegate = self
        card.textColor = UIColor.white
        card.backgroundImage = icons[5]
        card.blurEffect = .dark
        view.addSubview(card)
        
    }
    func addCardGroup() {
        let card = CardGroup.init(frame: CGRect(x: view.bounds.width/2+10, y: 50, width: (view.bounds.width-40)/2 , height: (view.bounds.width-40)/2))
        card.backgroundImage = icons[1]
        card.title = "title"
        card.subtitle = "subtitle"
        card.delegate = self
        card.textColor = UIColor.white
        card.blurEffect = .light
        view.addSubview(card)
        
    }
    //MARK:CardDelegate
    func cardDidTapInside(card: Card) {
        print("111")
    }
    func cardHighlightDidTapButton(card: CardHighlight, button: UIButton) {
        print("222")
    }
    func cardPlayerDidPlay(card: CardPlayer) {
        print("did play")
        let player = AVPlayerViewController()
        player.player = AVPlayer.init(url: URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
        
        
        present(player, animated: true, completion: nil)
        
    }
    func cardPlayerDidPause(card: CardPlayer) {
        print("didPause")
    }
    
}


