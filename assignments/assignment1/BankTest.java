class BankAccount {
    private int balance = 1000;

    public void updateBalance(int amount) {
        int current = balance;          // read
        try { Thread.sleep(10); } catch (Exception e) {}
        balance = current + amount;     // write
    }

    public int getBalance() {
        return balance;
    }
}

public class BankTest {
    public static void main(String[] args) {
        BankAccount account = new BankAccount();

        Thread[] threads = new Thread[10];

        // 5 deposits, 5 withdrawals
        for (int i = 0; i < 5; i++) {
            threads[i] = new Thread(() -> account.updateBalance(100));
        }
        for (int i = 5; i < 10; i++) {
            threads[i] = new Thread(() -> account.updateBalance(-100));
        }

        for (Thread t : threads) t.start();
        for (Thread t : threads) {
            try { t.join(); } catch (Exception e) {}
        }

        System.out.println("Final Balance: " + account.getBalance());
    }
}
