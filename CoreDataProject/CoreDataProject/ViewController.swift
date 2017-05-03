//
//  ViewController.swift
//  CoreDataProject
//
//  Created by octavian nic on 5/3/17.
//  Copyright © 2017 octavian nic. All rights reserved.
//

import UIKit
import onicolae2017

class ViewController: UIViewController {
    
    var manager = ArticleManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addArticle(5)
        printArticles()
        printArticles(containString: "[2] ptdr content")
        printArticles(withLang: "fr")
        removeArticles(3)
        printArticles()
        
        //if you want to clear the db, please uncomment the next line
        //        removeArticles(manager.getAllArticles().count)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addArticle(_ x: Int) {
        print("Creating " + String(x) + " articles")
        manager.save()
        for i in 0..<x {
            if let article = manager.newArticle() {
                let random = Int(arc4random_uniform(2) + 1)
                article.title = "[" + String(i) + "] Test title"
                article.content = "[" + String(i) + "] ptdr content"
                switch random {
                case 1:
                    article.language = "fr"
                default:
                    article.language = "en"
                }
                print("Article " + "[" + String(i) + "] created -> \(article)")
            }
        }
        print("\n")
        manager.save()
    }
    
    func removeArticles(_ x: Int) {
        print("\nRemoving " + String(x) + " Articles")
        let articles = manager.getAllArticles()
        if x > articles.count {
            return
        }
        for i in 0..<x {
            manager.removeArticle(articles[i])
        }
        print("Articles removed\n")
    }
    
    func printArticles() {
        let articles = manager.getAllArticles()
        print("\nPrinting articles (" + String(articles.count) + ")")
        for i in 0..<articles.count {
            print(articles[i])
        }
        
    }
    
    func printArticles(containString str : String) {
        let articles = manager.getArticles(containString: str)
        print("\nPrinting articles with content [\(str)] (\(articles.count))")
        for i in 0..<articles.count {
            print(articles[i])
        }
    }
    
    func printArticles(withLang lang : String) {
        let articles = manager.getArticles(withLang: lang)
        print("\nPrinting articles with lang [\(lang)] (\(articles.count))")
        for i in 0..<articles.count {
            print(articles[i])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


