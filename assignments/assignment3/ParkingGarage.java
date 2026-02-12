import java.util.concurrent.Semaphore;
import java.util.Random;

public class ParkingGarage {
    private final Semaphore semaphore;
    private final Random random = new Random();

    public ParkingGarage(int capacity) {
        this.semaphore = new Semaphore(capacity, true); // Fair semaphore
    }

    public void park(String carName) {
        try {
            System.out.println(carName + " is trying to enter.");
            semaphore.acquire();
            int slotsUsed = semaphore.availablePermits() + 1; // +1 since we just acquired
            System.out.println(carName + " has entered. Slots used: " + slotsUsed);

            // Simulate parking time (1-3 seconds)
            Thread.sleep(1000 + random.nextInt(2000));

            System.out.println(carName + " left. Slots freed.");
            semaphore.release();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ParkingGarage garage = new ParkingGarage(3);

        // Spawn 10 car threads
        Thread[] cars = new Thread[10];
        for (int i = 0; i < 10; i++) {
            String carName = "Car " + (i + 1);
            cars[i] = new Thread(() -> garage.park(carName));
            cars[i].start();
        }

        // Wait for all to finish (optional for observation)
        try {
            for (Thread t : cars) t.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
