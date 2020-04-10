//
//  ViewController.swift
//  myapps
//
//  Created by Irul on 4/10/20.
//  Copyright © 2020 irul. All rights reserved.
//

import UIKit

struct _Quote{
    let author: String
    let quote: String
    let bgColor: UIColor
    let namedBgColor: String
}

extension UIColor{
    convenience init(r:Int = 0,g:Int = 0,b:Int = 0,a:Int = 255){
        self.init(red:CGFloat(r)/255,green:CGFloat(g)/255,blue:CGFloat(b)/255,alpha:CGFloat(a)/255)
    }
}

class ViewController: UIViewController {
    
    private let Quote:UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
//        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let Author: UILabel = {
        let label = UILabel()
        label.text = "Author"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        label.contentMode = .scaleToFill
//        label.lineBreakMode = .byWordWrapping
//        label.baselineAdjustment = .alignBaselines
//        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let ChangeQuote: UIButton = {
        let btn = UIButton()
        btn.setTitle("Change Quote", for: .normal)
        btn.setTitleColor(
            UIColor(r: 200, g: 200, b: 200, a: 255),
            for: .highlighted
        )
        btn.heightAnchor.constraint(equalToConstant: 65).isActive = true
        btn.contentMode = .scaleToFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 135)
        return btn
    }()
    
    private let Quotes: [_Quote] = [
        _Quote(
            author: "Zig Ziglar",
            quote: "People often say that motivation doesn’t last. Well, neither does bathing – that’s why we recommend it daily.",
            bgColor: UIColor(r: 255, g: 0, b: 0, a: 255),
            namedBgColor: "red"
        ),
        _Quote(
            author: "Buddha",
            quote: "Each morning we are born again. What we do today is what matters most.",
            bgColor: UIColor(r: 255, g: 255, b: 0, a: 255),
            namedBgColor: "yellow"
        ),
        _Quote(
            author: "John Wooden",
            quote: "Make each day your masterpiece.",
            bgColor: UIColor(r: 0, g: 255, b: 0, a: 255),
            namedBgColor: "green"
        ),
        _Quote(
            author: "Albert Einstein",
            quote: "Your imagination is your preview of life’s coming attractions.",
            bgColor: UIColor(r: 0, g: 0, b: 255, a: 255),
            namedBgColor: "blue"
        ),
    ]
    
    @objc func didClick(_sender: UIButton!){
        changeQuote()
    }
    
    private func changeQuote(){
        let randInt = Int.random(in: 0..<Quotes.count)
        let pick = Quotes[randInt]
        Quote.text = pick.quote
        Author.text = pick.author
        if pick.namedBgColor == "yellow" || pick.namedBgColor == "green" {
            Quote.textColor = .black
            Author.textColor = .black
        } else {
            Quote.textColor = .white
            Author.textColor = .white
        }
        view.backgroundColor = pick.bgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(Quote)
        view.addSubview(Author)
        view.addSubview(ChangeQuote)
        
        changeQuote()
        
        ChangeQuote.addTarget(self, action: #selector(self.didClick(_sender:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            // Set HelloLabel to center in X anchor
            Quote.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Set HelloLabel to center in Y anchor
            Quote.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            // Set HelloLabel height to 200
//            HelloLabel.heightAnchor.constraint(equalToConstant: 200),
            // Set HelloLabel padding left to 20
            NSLayoutConstraint(item: Quote, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 20),
            // Set HelloLabel padding right to 20
            NSLayoutConstraint(item: Quote, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -20),
            // Set Author constraint to HelloLabel bottom by 20
            NSLayoutConstraint(item: Author, attribute: .top, relatedBy: .equal, toItem: Quote, attribute: .bottom, multiplier: 1, constant: 20),
            // Set Author constraint to view right by 30
            NSLayoutConstraint(item: Author, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -30),
//            ChangeQuote.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            NSLayoutConstraint(item: ChangeQuote, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: ChangeQuote, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: ChangeQuote, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: ChangeQuote, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -20),
        ])
    }

}
