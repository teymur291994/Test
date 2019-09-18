//
//  UITableView+Extensions.swift
//  Test
//
//  Created by Timur on 9/18/19.
//

import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: String(describing: T.self), bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }

        return cell
    }
}
