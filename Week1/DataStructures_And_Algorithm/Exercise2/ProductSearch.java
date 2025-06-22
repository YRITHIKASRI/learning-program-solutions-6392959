package Week1.DataStructures_And_Algorithm.Exercise2;
import java.util.Arrays;
import java.util.Comparator;

class Product {
    int productId;
    String productName;
    String category;

    public Product(int productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }

    public String toString() {
        return productId + " - " + productName + " (" + category + ")";
    }
}

public class ProductSearch {

    
    public static Product linearSearch(Product[] products, String targetName) {
        for (Product product : products) {
            if (product.productName.equalsIgnoreCase(targetName)) {
                return product;
            }
        }
        return null;
    }

    
    public static Product binarySearch(Product[] products, String targetName) {
        int low = 0, high = products.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            int cmp = products[mid].productName.compareToIgnoreCase(targetName);

            if (cmp == 0) return products[mid];
            else if (cmp < 0) low = mid + 1;
            else high = mid - 1;
        }
        return null;
    }

    public static void main(String[] args) {
        Product[] products = {
            new Product(101, "iPhone", "Electronics"),
            new Product(102, "T-Shirt", "Fashion"),
            new Product(103, "Laptop", "Electronics"),
            new Product(104, "Shoes", "Footwear"),
            new Product(105, "Washing Machine", "Home Appliances")
        };

        
        String target = "Laptop";
        System.out.println("Using Linear Search:");
        Product result1 = linearSearch(products, target);
        System.out.println(result1 != null ? result1 : "Product not found");

        
        Arrays.sort(products, Comparator.comparing(p -> p.productName.toLowerCase()));

       
        System.out.println("\nUsing Binary Search:");
        Product result2 = binarySearch(products, target);
        System.out.println(result2 != null ? result2 : "Product not found");
    }
}

