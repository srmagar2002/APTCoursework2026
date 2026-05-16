import java.util.Scanner;
import java.util.ArrayList;

import com.aptcoursework.dao.cartDao;
import com.aptcoursework.dao.cartDaoImpl;
import com.aptcoursework.entity.Cart;


void main() {

    Scanner sc = new Scanner(System.in);
    cartDao cartdao = new cartDaoImpl();


    while(true){
        System.out.println("1) View Cart");
        System.out.println("2) Add item");
        System.out.println("3) reduce Item");
        System.out.println("3) Delete Item");

        System.out.print("Enter your Input: ");
        int choice = sc.nextInt();

        switch (choice){
            case 1 -> {

                System.out.print("Enter your user ID: ");
                int user = sc.nextInt();

                ArrayList<Cart> cartItems = cartdao.fetchCartItemsByUserId(user);

                System.out.println("Your Cart Items");
                System.out.println("=================================");
                for (Cart cart: cartItems){
                    System.out.println("CartID: " + cart.getCartId());
                    System.out.println("productId: "+ cart.getLaptopId());
                    System.out.println("quantity: "+ cart.getQuantity());
                    System.out.println("+++============================");
                }
            }

            case 2 ->{
                System.out.print("Enter your user ID: ");
                int user = sc.nextInt();
                System.out.print("Enter your laptop Id: ");
                int laptopID = sc.nextInt();
                System.out.print("Enter the quantity: ");
                int quantity = sc.nextInt();
                cartdao.addToCart(user, laptopID);

            }

            case 3 ->{

            }
            default -> {
                System.out.println("Xito gar time xaina");
                break;
            }





        }
    }


    
}