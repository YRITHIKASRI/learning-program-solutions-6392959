public class FinancialForecast {

    // Recursive method to calculate future value
    public static double forecastFutureValue(double amount, double growthRate, int years) {
        if (years == 0) {
            return amount; // Base case: No growth after 0 years
        }
        // Recursive call
        return forecastFutureValue(amount, growthRate, years - 1) * (1 + growthRate);
    }

    public static void main(String[] args) {
        double initialAmount = 10000;   // Starting value
        double annualGrowthRate = 0.07; // 7% growth rate
        int forecastYears = 5;

        double futureValue = forecastFutureValue(initialAmount, annualGrowthRate, forecastYears);
        System.out.printf("Future value after %d years = %.2f\n", forecastYears, futureValue);
    }
}
