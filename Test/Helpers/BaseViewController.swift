//
//  BaseViewController.swift
//  Test
//
//  Created by Timur on 9/19/19.
//

import Then
import SnapKit

protocol ActivityIndicatorProtocol {
    func showActivityIndicator(_ isShow: Bool)
}

protocol EmptyDataPresentation {
    func showEmptyDataView(_ show: Bool, in view: UIView?, message: String)
}

class BaseViewController: UIViewController {
    // MARK: - properties

    lazy private var activityIndicator = UIActivityIndicatorView(style: .gray).then {
        if $0.superview == nil {
            view.addSubview($0)
        }
        $0.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    lazy private var emptyDataLabel = UILabel().then {
        $0.textAlignment = .center
        $0.adjustsFontSizeToFitWidth = true
    }
}

extension BaseViewController: ActivityIndicatorProtocol {
    func showActivityIndicator(_ isShow: Bool) {
        if isShow {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

extension BaseViewController: EmptyDataPresentation {
    func showEmptyDataView(_ show: Bool, in targetView: UIView?, message: String) {
        if show {
            targetView?.addSubview(emptyDataLabel)
            emptyDataLabel.snp.makeConstraints { (make) in
                make.bottom.top.equalToSuperview()
                make.left.equalToSuperview().offset(20)
                make.right.equalToSuperview().offset(-20)
            }
            emptyDataLabel.text = message
        } else {
            emptyDataLabel.removeFromSuperview()
        }
    }
}
