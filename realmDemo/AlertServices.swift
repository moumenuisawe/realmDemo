//
//  AlertServices.swift
//  realmDemo
//
//  Created by moumen isawe on 2/6/19.
//  Copyright © 2019 moumen. All rights reserved.
//

import UIKit


class AlertServices {
    private init() { }
    static func addAlert(in vc: UIViewController, completion: @escaping (String, Int?, String?) -> Void)
    {
        let alert = UIAlertController(title: "Add Line", message: nil, preferredStyle: .alert)
        alert.addTextField {
            (lineTf) in
            lineTf.placeholder = "enter puck up Line "
        }
        alert.addTextField {
            (scoreTf) in
            scoreTf.placeholder = "enter  score "
        }
        alert.addTextField {
            (emailTf) in
            emailTf.placeholder = "enter  email "
        }
        let action = UIAlertAction(title: "add", style: .default) { (_) in
            guard let line = alert.textFields?.first?.text,
                let scoreString = alert.textFields?[1].text,
                let emailString = alert.textFields?[2].text
                else { return }
            let score = scoreString == "" ? nil : Int(scoreString)
            let email = emailString == "" ? nil : emailString
            completion(line, score, email)
        }
        alert.addAction(action)

        vc.present(alert, animated: true)

    }



    static func updateAlert(in vc:UIViewController,
                            pickUpLine:PickUpLine,
                             completion: @escaping (String, Int?, String?) -> Void
        
            ){
        let alert = UIAlertController(title: "update Line", message: nil, preferredStyle: .alert)
        alert.addTextField {
            (lineTf) in
            lineTf.placeholder = "enter puck up Line "
            lineTf.text = pickUpLine.line
        }
        alert.addTextField {
            (scoreTf) in
            scoreTf.placeholder = "enter  score "
            scoreTf.text = pickUpLine.scoreString()
        }
        alert.addTextField {
            (emailTf) in
            emailTf.placeholder = "enter  email "
            emailTf.text = pickUpLine.email
        }
        let action = UIAlertAction(title: "add", style: .default) { (_) in
            guard let line = alert.textFields?.first?.text,
                let scoreString = alert.textFields?[1].text,
                let emailString = alert.textFields?[2].text
                else { return }
            let score = scoreString == "" ? nil : Int(scoreString)
            let email = emailString == "" ? nil : emailString
            completion(line, score, email)
        }
        alert.addAction(action)
        
    }
    

}
