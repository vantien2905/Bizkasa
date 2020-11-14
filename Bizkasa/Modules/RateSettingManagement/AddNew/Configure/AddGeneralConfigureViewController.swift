//
//  AddGeneralConfigureViewController.swift
//  Bizkasa
//
//  Created Tien Dinh on 11/1/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

enum GeneralConfigure: Int, CaseIterable {
    case configureName
    case priceByDay
    case priceByNight
    case priceByMonth
}

class AddGeneralConfigureViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!

	var presenter: AddGeneralConfigurePresenterProtocol?
    
    let param = RateSettingEntity()
    
    let addOrUpdateConfigParam = AddOrUpdateConfigPriceParam()
    
    weak var delegate: RateSettingDelegate?

	override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func setUpNavigation() {
        setTitleNavigation(title: "Thêm cấu hình")
        addBackWhiteToNavigation()
    }

    private func configureTableView() {
        tableView.registerTableCell(GeneralInfoCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func nextButtonTapped() {
        let vc = AddSurchargeRouter.createModule(type: .AddConfigPrice, addOrUpdateConfigParam: addOrUpdateConfigParam)
        vc.delegate = self
        self.push(controller: vc)
    }

}

extension AddGeneralConfigureViewController: AddGeneralConfigureViewProtocol {
	
}

extension AddGeneralConfigureViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GeneralConfigure.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTableCell(GeneralInfoCell.self)
        cell.setDataConfigure(index: indexPath.row)
        cell.textfieldDidChangeCallback = {[weak self] text in
            guard let self = self else { return }
            self.setParam(index: indexPath.row, text: text)
        }
        return cell
    }
    
    private func setParam(index: Int, text: String) {
        switch index {
        case GeneralConfigure.configureName.rawValue:
            addOrUpdateConfigParam.ConfigPrice?.ConfigPriceRow?.Name = text
        case GeneralConfigure.priceByDay.rawValue:
            addOrUpdateConfigParam.ConfigPrice?.ConfigPriceRow?.PriceByDay = Int(text)
        case GeneralConfigure.priceByNight.rawValue:
            addOrUpdateConfigParam.ConfigPrice?.ConfigPriceRow?.PriceByNight = Int(text)
        case GeneralConfigure.priceByMonth.rawValue:
            addOrUpdateConfigParam.ConfigPrice?.ConfigPriceRow?.PriceByMonth = Int(text)
        default:
            break
        }
    }
}

extension AddGeneralConfigureViewController: UITableViewDelegate {
    
}

extension AddGeneralConfigureViewController: RateSettingDelegate {
    func updateDataRateSettingList() {
        delegate?.updateDataRateSettingList()
    }
}