//
//  RealmServices.swift
//  realmDemo
//
//  Created by moumen isawe on 2/7/19.
//  Copyright © 2019 moumen. All rights reserved.
//

import UIKit
import RealmSwift

class RealmServices {

    var realm = try! Realm()
    private init() { }
    static let shared = RealmServices()
    func creat<T:Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        }
        catch {
            post(error)
        }
    }


    func update<T:Object>(_ object: T, with dictionary: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        }
        catch {
            post(error)
        }
    }
    func delete<T:Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        }
        catch {
            post(error)
        }
    }


    func post(_ error: Error) {
        NotificationCenter.default.post(name: NSNotification.Name("RealmError"), object: error)
    }
    func observationRealmErrors(in vc: UIViewController, compleation: @escaping (Error?) -> Void) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("RealmError"), object: nil, queue: nil) {
            (notification) in
            compleation(notification.object as? Error)
        }
    }

    func stopObserving(_ vc: UIViewController) {
        NotificationCenter.default.removeObserver(vc, name: NSNotification.Name("RealmError"), object: nil)
    }
}

