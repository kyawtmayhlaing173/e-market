import SwiftUI

struct ProductCard: View {
    var product: Product
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.imageUrl)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 170)
                    .scaledToFit()
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
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productLists[0])
    }
}
