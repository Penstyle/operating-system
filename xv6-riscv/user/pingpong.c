#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int
main()
{
    int p2c[2];  // parent → child
    int c2p[2];  // child → parent

    pipe(p2c);
    pipe(c2p);

    char byte = 'x';

    int pid = fork();
    if(pid < 0){
        printf("fork failed\n");
        exit(1);
    }

    if(pid == 0){
        // Child
        for(;;){
            read(p2c[0], &byte, 1);
            write(c2p[1], &byte, 1);
        }
        exit(0);
    }

    // Parent
    int exchanges = 10000;  // xv6 is slower than Linux
    int i;

    uint64 start = uptime();  // xv6 timer ticks
    for(i = 0; i < exchanges; i++){
        write(p2c[1], &byte, 1);
        read(c2p[0], &byte, 1);
    }
    uint64 end = uptime();

    int ticks = end - start;
    printf("Exchanges: %d, Ticks: %d, Exchanges/sec: %d\n",
           exchanges, ticks, (exchanges * 100) / ticks);

    exit(0);
}
