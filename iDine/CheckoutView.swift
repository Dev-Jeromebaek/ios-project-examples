//
//  CheckoutView.swift
//  iDine
//
//  Created by 백승엽 on 2020/11/16.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var pickupTime = Date()
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var closedRange: ClosedRange<Date> {
        let today = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let oneWeek = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
        
        return today...oneWeek
    }
    
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine loyalty card")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Pickup")) {
                Picker("\(pickupTime, formatter: dateFormatter)", selection: $pickupTime) {
                    DatePicker("", selection: $pickupTime, in: closedRange, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
           
            Section(header:
                        Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                        .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    // place the order
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            // more to come
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
