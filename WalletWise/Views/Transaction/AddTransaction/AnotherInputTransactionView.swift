import SwiftUI

struct AnotherInputTransactionView: View {
    @State private var selectedCategory: CategoryModel?
    @State private var date = Date()
    @State private var showDatePicker = false
    @State private var inputNote: String = ""
    @State var tvm: TransactionViewModel
    
    var body: some View {
        VStack (spacing: 24) {
            
            VStack (alignment: .leading, spacing: 16) {
                Text ("Category")
                    .font(Font.callout.bold())
                    .foregroundStyle(Color.secondary)
                
                ScrollView (.horizontal, showsIndicators: false){
                    HStack (spacing: 16) {
                        ForEach (CategoryModel.categories, id: \.self) { category in
                            Category (title: category.title, icon: category.icon, isSelected: tvm.selectedCategory == category)
                                .onTapGesture {
                                    tvm.selectedCategory = category
                                }
                        }
                    }
                }
            }
            
            Divider()
            
            HStack(spacing: 16) {
                Circle()
                    .fill(Color.green.opacity(0.15))
                    .frame(width: 56, height: 56)
                    .overlay {
                        Image(systemName: "calendar")
                            .font(.title2)
                            .foregroundStyle(.green)
                    }

                VStack(alignment: .leading, spacing: 4) {
                    Text("Tanggal")
                        .font(Font.callout.bold())
                        .foregroundStyle(.secondary)

                    Text(
                        date.formatted(
                            .dateTime.day().month(.wide).year()
                        )
                    )
                    .font(.subheadline)
                }
                .sheet(isPresented: $showDatePicker) {
                    VStack {
                        DatePicker(
                            "Pilih Tanggal",
                            selection: $date,
                            displayedComponents: .date
                        )
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()

                        Button("Selesai") {
                            showDatePicker = false
                        }
                        .padding(.bottom)
                    }
                    .presentationDetents([.height(400)])
                    .presentationDragIndicator(.visible)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                showDatePicker.toggle()
            }
            
            Divider()
            
            HStack(alignment: .top, spacing: 16) {
                
                Circle()
                    .fill(Color.red.opacity(0.1))
                    .frame(width: 56, height: 56)
                    .overlay {
                        Image(systemName: "square.and.pencil")
                            .font(.title3)
                            .foregroundStyle(.red)
                    }
                
                VStack(alignment: .leading, spacing: 12) {

                    Text("Notes")
                        .font(.headline)
                        .foregroundStyle(.secondary)

                    ZStack(alignment: .topLeading) {

                        TextEditor(text: $tvm.note)
                            .scrollContentBackground(.hidden)
                            .padding(8)

                        if tvm.note.isEmpty {
                            Text("Add a note...")
                                .foregroundStyle(.secondary)
                                .padding(16)
                                .allowsHitTesting(false)
                        }
                    }
                    .frame(height: 120)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.gray.opacity(0.08))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                    )
                }
            }
            
        }
        .padding()
        .cardStyle()
        .dismissKeyboardOnTap()
    }
}

