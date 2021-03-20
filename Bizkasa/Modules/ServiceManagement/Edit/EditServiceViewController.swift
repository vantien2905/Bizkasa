//
//  EditServiceViewController.swift
//  Bizkasa
//
//  Created Tien Dinh on 19/03/2021.
//  Copyright © 2021 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class EditServiceViewController: BaseViewController {
    
    @IBOutlet weak var serviceNameTextField : AppTextFieldLogo!
    @IBOutlet weak var serviceTypeDropdown  : AppDropdown!
    @IBOutlet weak var priceBuyTextField    : AppTextFieldLogo!
    @IBOutlet weak var priceSellTextField   : AppTextFieldLogo!
    @IBOutlet weak var noteTextField        : AppTextFieldLogo!
    @IBOutlet weak var btnAccept            : UIButton!
    @IBOutlet weak var allowWarehouseButton : UIButton!

	var presenter: EditServicePresenterProtocol?
    
    var listType: [WidgetTypeEntity] = []
    var widget: WidgetEntity!
    var indexType: Int!
    
    var reloadListPage: (()->Void)?

	override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        self.view.backgroundColor = AppColor.normalBlack.withAlphaComponent(0.3)
        setData()
    }

    override func setUpViews() {
        serviceNameTextField.setTitleAndLogo(AppImage.service,
                                             title: "Tên dịch vụ")
        serviceTypeDropdown.setTitleAndLogo(AppImage.service,
                                            title: "Nhóm dịch vụ")
        priceSellTextField.formatNumber = true
        priceBuyTextField.formatNumber = true
        priceBuyTextField.setTitleAndLogo(AppImage.price,
                                          title: "Giá nhập")
        
        priceSellTextField.setTitleAndLogo(AppImage.price,
                                           title: "Giá bán")
        
        noteTextField.setTitleAndLogo(AppImage.imgNote,
                                      title: "Ghi chú",
                                      isSecurity: false,
                                      placeholder: "Nhập ghi chú")
        
        serviceTypeDropdown.dropDownCallBack = { [weak self] index, item in
            guard let self = self else { return }
            self.widget.GroupId = self.listType[index].GroupId
        }
        
    }
    
    @IBAction func btnCloseTapped() {
        dismiss(animated: false)
    }
    
    private func setData() {
        
        serviceNameTextField.setText(widget.Name)
        priceBuyTextField.setText("\(widget.Price ?? 0)")
        priceSellTextField.setText("\(widget.PricePaid ?? 0)")
        noteTextField.setText(widget.Note)
        serviceTypeDropdown.itemSelected = indexType
        serviceTypeDropdown.dataSource = listType.map({$0.GroupName&})
        
        allowWarehouseButton.isSelected = widget.IsRecept ?? false
    }
    
    @IBAction func acceptButtonTapped() {
        widget.Name = serviceNameTextField.getText()
        widget.Price = Int(priceBuyTextField.getText()&.removeCommaDecimal())
        widget.PricePaid = Int(priceSellTextField.getText()&.removeCommaDecimal())
        widget.Note = noteTextField.getText()
        self.presenter?.addWidget(param: widget)
    }
    
    @IBAction func allowWarehouseButtonTapped() {
        allowWarehouseButton.isSelected = !allowWarehouseButton.isSelected
        
        widget.IsRecept = allowWarehouseButton.isSelected
        
    }
}

extension EditServiceViewController: EditServiceViewProtocol {
    func didAddWidget(result: [WidgetTypeEntity]?, error: APIError?) {
        if let _ = result {
            self.reloadListPage?()
            self.dismiss()
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }
}
