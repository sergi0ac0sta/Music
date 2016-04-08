//
//  MasterViewController.swift
//  MusicPlayer
//
//  Created by Sergio Acosta on 08/04/16.
//  Copyright © 2016 Sergio Acosta. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    var detailViewController: DetailViewController? = nil
    var navigationViewController: UINavigationController? = nil
    var objects = [AnyObject]()
    var music: [Song] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        music.append(createSong("Becoming Insane", artist: "Infected Mushroom", image: UIImage(named: "ViciousDelicious")!))
        music.append(createSong("The Dog Days Are Over", artist: "Florence And The Machine", image: UIImage(named: "Lungs")!))
        music.append(createSong("Immigrant Song", artist: "Trent Reznor", image: UIImage(named: "TheGirlWithTheDragonTatoo")!))
        music.append(createSong("We Found Love", artist: "Rihanna", image: UIImage(named: "WeFoundLove")!))
        music.append(createSong("What Else Is There", artist: "Royksopp", image: UIImage(named: "WhatElseIsThere")!))
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    func createSong(title: String, artist: String, image: UIImage) -> Song {
        return Song(title: title, artist: artist, cover: image)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.song = self.music[indexPath.row]
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        if segue.identifier == "showDetailRandom" {
            let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
            let random = arc4random() % UInt32(music.count)
            controller.song = self.music[Int(random)]
            controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
            controller.navigationItem.leftItemsSupplementBackButton = true
        }
    }
    
    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.music.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        self.configureCell(cell, atIndexPath: indexPath)
        return cell
    }

    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        cell.imageView!.image = self.music[indexPath.row].cover
        cell.textLabel!.text = self.music[indexPath.row].title
        cell.detailTextLabel!.text = self.music[indexPath.row].artist
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func shuffle(sender: UIBarButtonItem) {
    }
}

