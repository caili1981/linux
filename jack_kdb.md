
1.  远程(被调试机)上进入kgdb的调试模式。
    > echo g > /proc/sysrq-trigger 
    > 可以写一个debug的alias：   alias debug = 'echo g > /proc/sysrq-trigger'
    > 在virtualbox上调试，需要在/boot/grub/grub.cfg加上: kgdboc=ttyS0,115200 kgdbwait sysrq_always_enabled nokaslr  
    > nokaslr很重要，否则会导致内存出错.
    
2.  符号表的问题.
    [kgdb用法说明](https://landlock.io/linux-doc/landlock-v8/dev-tools/kgdb.html)
