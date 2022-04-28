import SwiftUI

struct ProductCard: View {
    var product: Product
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                AsyncImage(
                    url: URL(string: product.imageUrl),
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 170, height: 250)
                            .cornerRadius(20)
                    },
                    placeholder: {
                        ProgressView()
                    }
                ).frame(width: 170, height: 250)
                VStack(alignment: .leading) {
                    Text(product.name).bold()
                    Text("\(product.price)$").font(.caption)
                }
                .padding()
                .frame(width: 170,alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 170, height: 250)
            .shadow(radius: 3)
            .padding(.top, 30)
            
            Button {
                print("Added to cart!")
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(Color.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
            .padding(.top, 30)
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productLists[0])
    }
}
