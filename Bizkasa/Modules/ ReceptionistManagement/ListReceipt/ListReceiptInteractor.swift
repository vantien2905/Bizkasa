//
//  ListReceiptInteractor.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/26/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class ListReceiptInteractor: ListReceiptInteractorInputProtocol {

    let service = Provider.shared.receptionistAPIService

    func getInvoices(page: Int, pageSize: Int, invoiceType: [Int], isInDay: Bool) {
        service.getInvoices(page: page, pageSize: pageSize, invoiceType: invoiceType, isInDay: isInDay, success: { (result) in
            self.presenter?.didGetInvoices(result: result, error: nil)
        }) { (error) in
            self.presenter?.didGetInvoices(result: nil, error: error)
        }
    }


    weak var presenter: ListReceiptInteractorOutputProtocol?
}
