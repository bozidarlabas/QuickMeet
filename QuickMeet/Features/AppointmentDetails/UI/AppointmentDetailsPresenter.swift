//
//  AppointmentDetailsPresenter.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import Foundation
import Combine

class AppointmentDetailsPresenter {
    
    private weak var coordinator: MainCoordinatorProtocol?
    private var repository: AppointmentRepositoryProtocol
    var selectedModel: AppointmentItemModel
    
    var editedAppointmentPublisher: AnyPublisher<AppointmentItemModel?, Never> {
        repository
            .editedAppointmentPublisher
            .handleEvents(receiveOutput: { [weak self] updatedAppointment in
                guard let self = self, let updatedAppointment = updatedAppointment else { return }
                self.selectedModel = updatedAppointment
            })
            .eraseToAnyPublisher()
    }
    
    init(
        coordinator: MainCoordinatorProtocol?,
        selectedModel: AppointmentItemModel,
        repository: AppointmentRepositoryProtocol
    ) {
        self.coordinator = coordinator
        self.selectedModel = selectedModel
        self.repository = repository
    }
    
    func deleteButtonSelected() {
        repository.deleteAppointment(withId: selectedModel.id)
    }
    
    func editButtonSelected() {
        coordinator?.presentCreateAppointmentScreen(selectedModel: selectedModel)
    }
    
}
