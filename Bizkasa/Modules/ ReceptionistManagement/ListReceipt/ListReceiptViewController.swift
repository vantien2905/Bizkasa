//
//  ListReceiptViewController.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/26/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class ListReceiptViewController: HomeBaseViewController {

    @IBOutlet weak var tbReceipt: UITableView!
    @IBOutlet weak var lbTotal: UILabel!

	var presenter: ListReceiptPresenterProtocol?

    var invoiceResponse: InvoiceResponse! {
        didSet {
            self.lbTotal.text = "\(self.invoiceResponse.totalAmount*.formattedWithSeparator) VNĐ"
            self.listInvoice = self.invoiceResponse.dataPaging?.data ?? []
        }
    }

    var listInvoice: [InvoiceEntity] = [] {
        didSet {
            self.tbReceipt.reloadData()
        }
    }

	override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()

        presenter?.getInvoices(page: 1, pageSize: 10, invoiceType: 1, isInDay: true)

        NotificationCenter.default.addObserver(forName: .refreshReceptionist, object: nil, queue: nil) { (_) in
            self.presenter?.getInvoices(page: 1, pageSize: 10, invoiceType: 1, isInDay: true)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func setUpNavigation() {
        setTitleNavigation(title: "Phiếu thu")
        addButtonToNavigation(image: AppImage.imgAddNew, style: .right, action: #selector(btnAddNewTapped))
    }

    private func configureTableView() {
        tbReceipt.registerTableCell(ListReceiptCell.self)
        tbReceipt.delegate = self
        tbReceipt.dataSource = self
        tbReceipt.rowHeight = UITableView.automaticDimension
        tbReceipt.contentInset.bottom = 40
    }

    @objc func btnAddNewTapped() {
        let vc = CreateNewReceiptRouter.createModule().convertNavi()
        self.present(controller: vc)
    }

}

extension ListReceiptViewController: ListReceiptViewProtocol {
    func didGetInvoices(result: InvoiceResponse?, error: APIError?) {
        if let result = result {
            self.invoiceResponse = result
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }
}

extension ListReceiptViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listInvoice.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTableCell(ListReceiptCell.self)
        cell.invoice = listInvoice[indexPath.row]
        return cell
    }
}