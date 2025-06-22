import java.util.Scanner;

public class FinancialForecast {

    // Recursive method to calculate future value
    public static double forecastFutureValue(double initialAmount, double growthRate, int years) {
        // Base case: no growth
        if (years == 0) {
            return initialAmount;
        }

        // Recursive case: calculate future value for (years - 1) and apply growth
        return forecastFutureValue(initialAmount, growthRate, years - 1) * (1 + growthRate);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // User input
        System.out.print("Enter initial amount (e.g., 10000): ");
        double initialAmount = scanner.nextDouble();

        System.out.print("Enter annual growth rate (e.g., 0.05 for 5%): ");
        double growthRate = scanner.nextDouble();

        System.out.print("Enter number of years to forecast: ");
        int years = scanner.nextInt();

        // Call recursive function
        double futureValue = forecastFutureValue(initialAmount, growthRate, years);

        // Display result
        System.out.printf("Future value after %d years = %.2f\n", years, futureValue);

        scanner.close();
    }
}



