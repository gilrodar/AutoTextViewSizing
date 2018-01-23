//
//  ViewController.swift
//  AutoTextViewSizing
//
//  Created by Gil Rodarte on 23/01/18.
//  Copyright © 2018 Gil Rodarte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        textView.backgroundColor = UIColor.lightGray
        textView.text = "AutoTextViewSizing"
        
        view.addSubview(textView)
        
        //Use auto layout to set my textView frame...kinda
        textView.translatesAutoresizingMaskIntoConstraints = false
        [
            // If wanna textView in a Bottom
            //textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 50)
            ].forEach { $0.isActive = true }
        
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        
        textView.delegate = self
        textView.isScrollEnabled = false
        
        textViewDidChange(textView)
        
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        //print(textView.text)
        let size = CGSize(width: view.frame.width, height: .infinity)
        let etimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = etimatedSize.height
            }
        }
    }
}

