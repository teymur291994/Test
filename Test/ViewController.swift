//
//  ViewController.swift
//  Test
//
//  Created by Timur on 9/17/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.comics(onSuccess: { (marvelResponse) in
            print("marvelResponse?.data: ", marvelResponse?.data ?? "")
        }, onFailure: {(_) in

        })
    }
}
