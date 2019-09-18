//
//  ComicsTableViewController.swift
//  Test
//
//  Created by Timur on 9/18/19.
//

import UIKit

class ComicsTableViewController: BaseViewController {
    // MARK: - properties

    @IBOutlet private weak var tableView: UITableView!
    private var listOfComics = [Comics]()

    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupBehaviour()
    }

    // MARK: - private

    private func setupBehaviour() {
        requestComics()
    }

    private func setupViewHierarchy() {
        tableView.registerCell(ComicsTableViewCell.self)
    }

    private func requestComics() {
        showActivityIndicator(true)
        NetworkManager.shared.comics(onSuccess: { [weak self] (marvelResponse) in
            self?.showActivityIndicator(false)
            guard let comics = marvelResponse?.data.results else { return }
            self?.listOfComics = comics
            self?.updateContent()

        }, onFailure: { [weak self] (_) in
            self?.showActivityIndicator(false)
        })

    }

    private func updateContent() {
        let isEmpty = listOfComics.count == 0
        if tableView.backgroundView == nil {
            tableView.backgroundView = UIView()
        }
        showEmptyDataView(isEmpty,
                          in: tableView.backgroundView,
                          message: L10n.comicsPageEmptyData)
        tableView.reloadData()
    }
}

extension ComicsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfComics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ComicsTableViewCell = tableView.dequeueReusableCell(for: indexPath)

        let comics = listOfComics[indexPath.row]
        cell.configure(comics: comics)

        return cell
    }
}
