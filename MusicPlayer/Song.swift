//
//  Song.swift
//  MusicPlayer
//
//  Created by Sergio Acosta on 08/04/16.
//  Copyright © 2016 Sergio Acosta. All rights reserved.
//

import UIKit

class Song {
    var title: String
    var artist: String
    var cover: UIImage
    
    init(title: String, artist: String, cover: UIImage) {
        self.title = title
        self.artist = artist
        self.cover = cover
    }
}