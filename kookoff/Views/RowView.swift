import SwiftUI

struct Contest: Identifiable { // Todo: Add image to Contest
    var id: String
    var name: String
    
    var imageUrl: String

    var image: Image {
        Image(imageUrl)
    }
}

struct RowItem: View {
    var contest: Contest
    
    var body: some View {
        VStack(alignment: .leading) {
            contest.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(contest.name)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct RowView: View {
    var rowName: String
    var items: [Contest] // TODO: Replace with contest model
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(rowName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { contest in
                        RowItem(contest: contest)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    var contests = [
        Contest(id: "1", name: "Sunday Breakfast", imageUrl: "swiftui-button"),
        Contest(id: "2", name: "Steak & Eggs", imageUrl: "swiftui-button"),
        Contest(id: "3", name: "Potatoe Side Dish", imageUrl: "swiftui-button"),
        Contest(id: "4", name: "Delicious Salad", imageUrl: "swiftui-button"),
        Contest(id: "4", name: "Weekday Brunch", imageUrl: "swiftui-button"),
    ]
    return RowView(rowName: "Coming Soon", items: contests)
}
