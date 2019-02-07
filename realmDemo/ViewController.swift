//
//  ViewController.swift
//  realmDemo
//
//  Created by moumen isawe on 2/6/19.
//  Copyright © 2019 moumen. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!


    var pickUpLines: Results<PickUpLine>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let realm = RealmServices.shared.realm
         pickUpLines = realm.objects(PickUpLine.self)

    }


    @IBAction func onAddTapped(_ sender: Any) {
        AlertServices.addAlert(in: self) { (line, score, email) in
            RealmServices.shared.creat(PickUpLine(line: line, score: score, email: email))
            self.tableView.reloadData()
        }
    }
}









extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickUpLines.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "lineCell") as? lineCell
            else {
                return UITableViewCell()
        }
        cell.cinfugure(with: pickUpLines[indexPath.row])
        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
 


}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pickUpLine = pickUpLines[indexPath.row]
        
        AlertServices.updateAlert(in: self, pickUpLine: pickUpLine) { (line, score, email) in
            let dict:[String:Any?]=[
                "line" :line,
                "score":score,
                "email":email
            ]
            RealmServices.shared.update(pickUpLine, with: dict)
        }
        tableView.reloadData()

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
//       pickUpLines.remove(at: indexPath.row)
        RealmServices.shared.delete(pickUpLines[indexPath.row])
        tableView.reloadData()

    }

}
