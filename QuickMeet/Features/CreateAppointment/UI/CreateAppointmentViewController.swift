//
//  CreateAppointmentViewController.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import UIKit
import Combine

class CreateAppointmentViewController: UIViewController {
    
    // Properties
    private var presenter: CreateAppointmentPresenter!
    private var cancellables = Set<AnyCancellable>()
    var menuChildren: [UIMenuElement] = []
    var selectedLocation: String = ""
    
    // Views
    var backButton = UIButton()
    let scrollView = UIScrollView()
    let scrollViewContainer = UIView()
    
    var stackview = UIStackView()
    var dateView = CustomDateView()
    var timeView = CustomDateView()
    var locationLabel = UILabel()
    var locationDropdownView = LabelWithDropdown()
    var locationDropdownButton: UIButton { locationDropdownView.button }
    var addToCalendarView = LabelWithSwitch()
    var addNotificationView = LabelWithSwitch()
    var descriptionTextView = MultilineTextField()
    var descriptionTextViewButton = UIButton()
    var saveButton = UIButton()
    var toolbar: UIToolbar?
    
    convenience init(presenter: CreateAppointmentPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropdown()
        buildViews()
        bindUI()
        updateUI()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func bindUI() {
        backButton
            .publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.dismiss(animated: true)
            }.store(in: &cancellables)
        
        descriptionTextViewButton
            .publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.descriptionTextView.becomeFirstResponder()
            }.store(in: &cancellables)
        
        if let selectedAppointment = presenter.selectedAppointment {
            saveButton
                .publisher(for: .touchUpInside)
                .sink { [unowned self] _ in
                    guard isValid() else {
                        return
                    }
                    let model = AppointmentItemModel(id: selectedAppointment.id, details: descriptionTextView.text, date: dateView.datePicker.date, time: timeView.datePicker.date, location: selectedLocation)
                    presenter.editAppointment(updatedModel: model)
                    dismiss(animated: true)
                }.store(in: &cancellables)
            
            dateView.date = selectedAppointment.date
            timeView.date = selectedAppointment.time
            let menu = UIMenu(options: .displayInline, children: menuChildren)
            locationDropdownButton.menu = updateActionState(actionTitle: selectedAppointment.location, menu: menu)
            descriptionTextView.text = selectedAppointment.details
        } else {
            saveButton
                .publisher(for: .touchUpInside)
                .sink { [unowned self] _ in
                    guard isValid() else {
                        return
                    }
                    var model = AppointmentItemModel(details: descriptionTextView.text, date: dateView.datePicker.date, time: timeView.datePicker.date, location: selectedLocation)
                    model.saveToCalendar = addToCalendarView.switchControl.isOn
                    model.addNotification = addNotificationView.switchControl.isOn
                    presenter.saveAppointment(appointmentModel: model)
                    dismiss(animated: true)
                }.store(in: &cancellables)
            
            let menu = UIMenu(options: .displayInline, children: menuChildren)
            locationDropdownButton.menu = updateActionState(menu: menu)
            addNotificationView.switchControl.addTarget(self, action: #selector(notificationSwitchValueChanged(_:)), for: .valueChanged)
            addToCalendarView.switchControl.addTarget(self, action: #selector(calendarSwitchValueChanged(_:)), for: .valueChanged)
        }
    }
    
    private func updateUI() {
        addToCalendarView.isHidden = presenter.isEditMode
        addNotificationView.isHidden = presenter.isEditMode
    }
    
    private func isValid() -> Bool {
        if descriptionTextView.text.isEmpty {
            showDescriptionEmptyAlert()
            return false
        }
        
        let currentDate = Calendar.current.startOfDay(for: Date())
        let appointmentDate = Calendar.current.startOfDay(for: dateView.datePicker.date)
        if appointmentDate < currentDate {
            showInvalidDateAlert()
            return false
        }
        return true
    }
    
    private func showDescriptionEmptyAlert() {
        let reusableAlert = ReusableAlertController(title: "title_error_validation".localized, message: "message_descritpion_empty".localized, showCancelButton: false, okButtonTitle: "title_close".localized)
        present(reusableAlert, animated: true, completion: nil)
    }
    
    private func showInvalidDateAlert() {
        let reusableAlert = ReusableAlertController(title: "title_error_date_validation".localized, message: "message_validation_date_error".localized, showCancelButton: false, okButtonTitle: "title_close".localized)
        present(reusableAlert, animated: true, completion: nil)
    }
    
    
    private func setupDropdown() {
        if let selectedAppointment = presenter.selectedAppointment {
            selectedLocation = selectedAppointment.location
        } else {
            selectedLocation = presenter.locations.first ?? ""
        }
        
        for fruit in presenter.locations {
            menuChildren.append(UIAction(title: fruit, handler: { [weak self] (action: UIAction) in
                self?.selectedLocation = action.title
            }))
        }
    }
    
    func updateActionState(actionTitle: String? = nil, menu: UIMenu) -> UIMenu {
        if let actionTitle = actionTitle {
            menu.children.forEach { action in
                guard let action = action as? UIAction else {
                    return
                }
                if action.title == actionTitle {
                    action.state = .on
                }
            }
        } else {
            let action = menu.children.first as? UIAction
            action?.state = .on
        }
        return menu
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentOffset = CGPoint(x: 0, y: 100)
            
            UIView.animate(withDuration: 0.3) {
                self.scrollView.contentOffset = contentOffset
            }
        }
    }
    
    @objc func notificationSwitchValueChanged(_ sender: UISwitch) {
        if addNotificationView.switchControl.isOn {
            presenter.askNotificationPermission()
        }
    }
    
    @objc func calendarSwitchValueChanged(_ sender: UISwitch) {
        if addToCalendarView.switchControl.isOn {
            presenter.askCalendarPermission()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            let topOffset = CGPoint(x: 0, y: 0)
            self.scrollView.setContentOffset(topOffset, animated: true)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func closeSelected() {
        descriptionTextView.resignFirstResponder()
    }
    
    
    
}
