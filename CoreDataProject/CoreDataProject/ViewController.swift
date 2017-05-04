//
//  ViewController.swift
//  CoreDataProject
//
//  Created by octavian nic on 5/3/17.
//  Copyright © 2017 octavian nic. All rights reserved.
//

import UIKit
import onicolae2017
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = ArticleManager.init()
        let article = manager.newArticle("Victor13", 13)
        article.name = "victor13"
        // Do any additional setup after loading the view, typically from a nib.
        manager.save()
        print(manager.getAllArticles())
    }
}
