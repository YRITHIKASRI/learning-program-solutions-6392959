package Week1.Design_Principles_Patterns.Exersice1;

public class SingletonPatternExample {

    
    static class Logger {
       
        private static Logger instance;

        
        private Logger() {
            System.out.println("Logger initialized.");
        }

        
        public static Logger getInstance() {
            if (instance == null) {
                instance = new Logger(); 
            }
            return instance;
        }

        
        public void log(String message) {
            System.out.println("[LOG]: " + message);
        }
    }

    
    public static void main(String[] args) {
        Logger logger1 = Logger.getInstance();
        logger1.log("Application started.");

        Logger logger2 = Logger.getInstance();
        logger2.log("Performing some operation...");

        if (logger1 == logger2) {
            System.out.println("Both logger instances are the same. Singleton confirmed.");
        } else {
            System.out.println("Different instances. Singleton pattern failed.");
        }
    }
}

