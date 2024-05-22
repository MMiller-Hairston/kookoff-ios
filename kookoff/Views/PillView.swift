import SwiftUI

struct PillView: View {
    var start: Date
    var end: Date
    
    
    var body: some View {
        Text(""
//            String(format: "%@ - %@",
//                   Date.quickFormat(date: start), Date.quickFormat(date: end)
//                  )
        )
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(
            Capsule().fill(.green).stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
    }
}

#Preview {
    return PillView(start: Date(), end: Calendar.current.date(byAdding: .month, value: 1, to: Date())!)
}
