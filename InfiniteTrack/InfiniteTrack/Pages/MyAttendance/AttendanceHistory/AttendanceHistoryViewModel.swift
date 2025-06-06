//
//  AttendanceHistoryViewModel.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 04/06/25.
//

import Foundation

@MainActor
class AttendanceHistoryViewModel: ObservableObject {
    @Published var items: [AttendanceHistoryDisplayModel] = []
    @Published var displayedItems: [AttendanceHistoryDisplayModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var startDate: Date = .now.backward(days: 7)
    @Published var minStartDate: Date = .now.backward(days: 7)
    @Published var endDate: Date = .now
    
    func onAppear() {
        getAttendanceHistory()
    }

    private func getAttendanceHistory() {
        Task {
            isLoading = true
            errorMessage = nil
            do {
                let responses = try await AttendanceApi.shared.getAttendanceHistory()
                self.items = responses.map { AttendanceHistoryDisplayModel(from: $0) }
                onClickSearch()
                isLoading = false
            } catch {
                errorMessage = error.localizedDescription
                isLoading = false
            }
        }
    }
    
    @MainActor
    func onClickSearch() {
        displayedItems = items.filter({ item in
            return item.date >= startDate.startOfDay && item.date <= endDate.endOfDay
        })
    }
}
