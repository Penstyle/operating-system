public class CounterTest {
    public static void main(String[] args) throws Exception {

        testCounter(new LockCounter(), "LockCounter");
        testCounter(new AtomicCounter(), "AtomicCounter");
    }

    private static void testCounter(Counter counter, String name) throws Exception {
        Thread[] threads = new Thread[4];

        long start = System.nanoTime();

        for (int i = 0; i < 4; i++) {
            threads[i] = new Thread(() -> {
                for (int j = 0; j < 100_000; j++) {
                    counter.increment();
                }
            });
        }

        for (Thread t : threads) t.start();
        for (Thread t : threads) t.join();

        long end = System.nanoTime();

        System.out.println(name + " final count: " + counter.getCount());
        System.out.println(name + " time (ns): " + (end - start));
        System.out.println();
    }
}
