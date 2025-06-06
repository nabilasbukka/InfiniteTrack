//
//  FilterAttendanceDateView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 04/06/25.
//

import SwiftUI

struct FilterAttendanceDateView: View {
    @State private var selectedStartDate = Date()
    @State private var isDatePickerVisible = false
    
    @State var startDate: Date = .now
    @State private var shouldShowStartDatePicker = false
    
    @State var endDate: Date = .now
    @State private var shouldShowEndDatePicker = false
    @State var minStartDate: Date?
    
    var onClickSearch: ((Date, Date) -> Void)?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Choose Attendance Date")
                    .foregroundColor(.primary400)
                    .font(.subheadline)
                
                HStack(spacing: 8) {
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "calendar")
                            .foregroundColor(Color.primary500)
                        
                        Text(startDate.toString(format: "dd MMM"))
                            .font(.headline)
                            .foregroundColor(Color.primary500)
                    }
                    .onTapGesture {
                        shouldShowStartDatePicker.toggle()
                    }
                    .sheet(isPresented: $shouldShowStartDatePicker) {
                        AnyView(showDatePicker(selectedDate: $startDate))
                    }
                    .onChange(of: startDate) { _, newValue in
                        if endDate < newValue {
                            endDate = newValue
                        }
                    }
                    
                    Text("-")
                        .font(.headline)
                        .foregroundColor(Color.primary500)
                    
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "calendar")
                            .foregroundColor(Color.primary500)
                        
                        Text(endDate.toString(format: "dd MMM"))
                            .font(.headline)
                            .foregroundColor(Color.primary500)
                    }
                    .onTapGesture {
                        shouldShowEndDatePicker.toggle()
                    }
                    .sheet(isPresented: $shouldShowEndDatePicker) {
                        AnyView(showDatePicker(selectedDate: $endDate))
                    }
                }
            }
            .padding(12)
            
            Spacer()
            
            HStack(spacing: 16) {
                Rectangle()
                    .foregroundColor(Color.primary500)
                    .frame(width: 1, height: 36)
                
                Button(action: {
                    onClickSearch?(startDate, endDate)
                }) {
                    Text("Search")
                        .foregroundColor(Color.primary500)
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .frame(width: 64, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.primary500, lineWidth: 2)
                        )
                }
                
                Spacer()
                    .frame(width: 0)
            }
        }
        .background(Color.white)
        .cornerRadius(8)
    }
    
    func showDatePicker(selectedDate: Binding<Date>) -> any View {
        let view = CalendarView(
            selectedDate: selectedDate,
            shouldShowCalendar: $shouldShowEndDatePicker,
            minimumDate: minStartDate,
            maximumDate: .now
        )
        
        if #available(iOS 16.0, *) {
            return view.presentationDetents([.medium])
        } else {
            // Fallback on earlier versions
            return view
        }
    }
}

struct NoHitTesting: ViewModifier {
    func body(content: Content) -> some View {
        SwiftUIWrapper { content }.allowsHitTesting(false)
    }
}

extension View {
    func userInteractionDisabled() -> some View {
        self.modifier(NoHitTesting())
    }
}

struct SwiftUIWrapper<T: View>: UIViewControllerRepresentable {
    let content: () -> T
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: content())
    }
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {}
}

#Preview {
    FilterAttendanceDateView()
}
