import SwiftUI

struct CardView: View {
    var image: String
    var title: String
    
    var body: some View {
        ZStack {
            Image(image).resizable()
                .aspectRatio(contentMode: .fit)
        }
        .cornerRadius(10)
        .overlay(
            VStack(alignment: .leading) {
                PillView(start: Date(), end: Calendar.current.date(byAdding: .hour, value: 72, to: Date())!).padding([.top, .horizontal], 5)
                
                Spacer()
                
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white).lineLimit(2)
                        .shadow(color: .black, radius: 0.75)
                        .padding([.leading, .bottom], 5)
                    Spacer()
                }
            },
            alignment: .bottom
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

#Preview {
    CardView(image: "flutter-app", title: "Order one phone,\n get one free!")
}
