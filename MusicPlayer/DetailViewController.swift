//
//  DetailViewController.swift
//  MusicPlayer
//
//  Created by Sergio Acosta on 08/04/16.
//  Copyright © 2016 Sergio Acosta. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    var song: Song = Song(title: "", artist: "", cover: UIImage(named: "ViciousDelicious")!)
    private var player: AVAudioPlayer!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var imgCover: UIImageView!
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    
    @IBOutlet weak var sldVolume: UISlider!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        /*
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
        */
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = song.title
        lblArtist.text = song.artist
        imgCover.image = song.cover
        
        let songUrl = NSBundle.mainBundle().URLForResource(song.title, withExtension: "mp3")
        do {
            try player = AVAudioPlayer(contentsOfURL: songUrl!)
        } catch {
            print("Error al cargar el archivo de musica.")
        }
        sldVolume.value = AVAudioSession.sharedInstance().outputVolume
        play()
    }

    @IBAction func play() {
        if !player.playing {
            player.play()
        }
    }
    
    @IBAction func pause() {
        if player.playing {
            player.pause()
        }
    }
    
    @IBAction func stop() {
        if player.playing {
            player.stop()
        }
        player.currentTime = 0.0
    }
    
    @IBAction func Volume(sender: AnyObject) {
        player.volume = sender.value
    }
    
}

