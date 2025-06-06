//
//  CalendarView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 04/06/25.
//

import SwiftUI

struct CalendarView: View {
    @Binding private var selectedDate: Date
    @Binding private var shouldShowCalendar: Bool
    var minimumDate: Date?
    var maximumDate: Date?
    
    init(
        selectedDate: Binding<Date>,
        shouldShowCalendar: Binding<Bool>,
        minimumDate: Date? = nil,
        maximumDate: Date? = nil
    ) {
        self._selectedDate = selectedDate
        self._shouldShowCalendar = shouldShowCalendar
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
    }
    
    var body: some View {
        let datePicker: DatePicker<Text>
        
        if let minimumDate, let maximumDate {
            datePicker = DatePicker("", selection: $selectedDate, in: minimumDate...maximumDate, displayedComponents: .date)
        } else if let minimumDate {
            datePicker = DatePicker("", selection: $selectedDate, in: minimumDate..., displayedComponents: .date)
        } else if let maximumDate {
            datePicker = DatePicker("", selection: $selectedDate, in: ...maximumDate, displayedComponents: .date)
        } else {
            datePicker = DatePicker("", selection: $selectedDate, displayedComponents: .date)
        }
        
        return datePicker
            .datePickerStyle(GraphicalDatePickerStyle())
            .onChange(of: selectedDate) { oldValue, newValue in
                print("Date changed from \(oldValue) to \(newValue)")
                shouldShowCalendar = false
            }
    }
}

#Preview {
    CalendarView(selectedDate: .constant(.now), shouldShowCalendar: .constant(true))
}
