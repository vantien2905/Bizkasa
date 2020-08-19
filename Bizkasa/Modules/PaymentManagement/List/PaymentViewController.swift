//
//  PaymentViewController.swift
//  Bizkasa
//
//  Created Tien Dinh on 7/7/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class PaymentViewController: HomeBaseViewController {
    
    @IBOutlet weak var tbPayment: UITableView!
    @IBOutlet weak var vPaymentType     : AppDropdownBorder!
    @IBOutlet weak var vTime            : AppDateTime!
    @IBOutlet weak var hightFilterView  : NSLayoutConstraint!
    @IBOutlet weak var btnHideFilter    : UIButton!
    @IBOutlet weak var hightAddPaymentView  : NSLayoutConstraint!
    
    @IBOutlet weak var vContent: AppTextViewLogo!
    @IBOutlet weak var vCharge: AppTextFieldLogo!
    @IBOutlet weak var vService: AppDropdownBorder!
    
    var presenter: PaymentPresenterProtocol?
    
    var listPayment: [PaymentEntity] = [] {
        didSet {
            self.tbPayment.reloadData()
        }
    }
    
    var refreshControl = UIRefreshControl()
    
    let param = GetInvoiceParam.setDefaultPaymentParam()
    
    let paymentType = ["Chọn loại chi",
                       "Tiền phòng",
                       "Tiền dịch vụ",
                       "Tiền điện",
                       "Tiền nước",
                       "Tiền internet",
                       "Tiền sửa chữa",
                       "Tiền tiếp khách",
                       "Tiền nhập kho",
                       "Tiền chi khác",
                       "Phụ thu",
                       "Giảm trừ",
                       "Trả trước"
    ]
    
    var invoiceType: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tbPayment.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func refreshData() {
        param.Page?.currentPage = 1
        presenter?.getInvoiceByPayment(param: param)
    }
    
    override func setUpNavigation() {
        setTitleNavigation(title: "Phiếu chi")
        addButtonImageToNavigation(image: AppImage.imgAddNew, style: .right, action: #selector(btnAddNewPaymentTapped))
    }
    
    private func configureTableView() {
        tbPayment.registerTableCell(PaymentCell.self)
        tbPayment.delegate = self
        tbPayment.dataSource = self
        tbPayment.rowHeight = UITableView.automaticDimension
        tbPayment.contentInset.bottom = 50
    }
    
    override func setUpView() {
        vPaymentType.dataSource = paymentType
        vTime.setTitleAndLogo(AppImage.imgTime, title: "Khoảng thời gian")
        btnHideFilterTapped()
        
        vTime.setDateAndTime(fromTime: DateHelper.getDateTimeISO(), toTime: DateHelper.getDateTimeISO())
        
        vPaymentType.dropDownCallBack = {[weak self] (index, item) in
            self?.param.InvoiceCategory = index != 0 ? index : nil
        }
        
        //----
        vContent.setTitleAndLogo(AppImage.imgNote, title: "Nội dung")
        vContent.setPlaceholder("Nhập nội dung")
        vCharge.setTitleAndLogo(AppImage.price, title: "Số tiền")
        vCharge.setPlaceHolder(title: "Nhập số tiền")
        vCharge.tfContent.keyboardType = .numberPad
        
        vCharge.tfContent.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
        
        vService.dataSource = paymentType
        hightAddPaymentView.constant = 0
        
        vService.dropDownCallBack = {index, item in
            self.invoiceType = index
        }
    
    }
    
    @objc func btnAddNewPaymentTapped() {
        UIView.animate(withDuration: 0.3) {
            self.btnHideFilter.isHidden = false
            self.hightAddPaymentView.constant = 300
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
           if let amountString = vCharge.tfContent.text?.currencyInputFormatting() {
               vCharge.tfContent.text = amountString
           }
       }
    
    @IBAction func btnAcceptTapped() {
        if validate() {
            let content = vContent.getText()&
            if let price = Int(vCharge.getText().replacingOccurrences(of: ",", with: "")) {
                let param = InsertInvoiceParam()
//                param.Note = content
                param.TotalAmount = price
                param.InvoiceType = invoiceType
                
                let detail = WidgetEntity()
                
                
//                self.dismiss(animated: false)
            }
        }
    }

    func validate() -> Bool {
        
        if !vService.isSelected() {
            self.makeToast(message: "Bạn chưa chọn dịch vụ")
            return false
        }
        
        if vContent.getText()&.isEmpty {
            self.makeToast(message: "Bạn chưa nhập nội dung")
            return false
        }

        if vCharge.getText().isEmpty {
            self.makeToast(message: "Bạn chưa nhập số tiền")
            return false
        }

        return true
    }

    
    var isShowFilter = false
    @IBAction func btnFilterTapped() {
        isShowFilter = !isShowFilter
        btnHideFilter.isHidden = !isShowFilter
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2) {
            self.hightFilterView.constant = self.isShowFilter ? 195 : 0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func btnHideFilterTapped() {
        view.layoutIfNeeded()
        isShowFilter = false
        btnHideFilter.isHidden = true
        UIView.animate(withDuration: 0.2) {
            self.hightFilterView.constant = self.isShowFilter ? 195 : 0
            self.hightAddPaymentView.constant = 0
            self.view.layoutIfNeeded()
            
        }
    }
    
    @IBAction func btnFiltterTapped() {
        param.Page?.currentPage = 1
        param.Page?.pageSize = 20
        param.FromDate = vTime.fromTime
        param.ToDate = vTime.toTime
        presenter?.getInvoiceByPayment(param: param)
        btnHideFilterTapped()
    }
    
}

extension PaymentViewController: PaymentViewProtocol {
    func didGetInvoiceByPayment(result: PaymentEntityResponse?, error: APIError?) {
        refreshControl.endRefreshing()
        if let result = result {
            result.payment.isEmpty ? self.tbPayment.setEmptyView() : self.tbPayment.restore()
            self.listPayment = result.payment
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }
    
    func didInsertOrUpdateInvoice(result: BaseResponse?, error: APIError?) {
        if let _ = result {
            self.makeToast(message: "Thêm hoá đơn thành công!")
//            NotificationCenter.default.post(name: .refreshReceptionist, object: nil)
//            self.closePage()
            refreshData()
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPayment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTableCell(PaymentCell.self)
        cell.invoice = listPayment[indexPath.row]
        return cell
    }
}
