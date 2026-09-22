semaphore in sv is a built-in class for synchronization and resource sharing between multiple parallel processes(threads).sv provides a built
in semaphore class with three primary methods.

1.new():- use for initialization
creat a semaphore and allocate a specific number of initial keys(default is 0).
semaphore key_bucket=new(1);//creat a semaphore with 1 key(mutex)

2.get():- (blocking allocation)
procures a specified number of keys (default is 1)
-if key available it takes them and thread continue
-if key are not available,the thread blocks(wait) untill enough key are returned to the bucket
key_bucket.get(1); //request 1 key.block if empty

3.put():- (returning keys)
-return a specified number of keys to the bucket (default is 1)
-this immediately unblock any threads waiting for keys.
key_bucket.put(1); //put 1 key back into the bucket

try_get() (nonblocking allocation)
attempts to procure keys without blocking
-return 1 if the keys were successfully acquired
-return 0 if the keys were not available (does not wait:moveon)
if(key_bucket.try_get(1)) begin
//got the key! do work
end else beign
//bucket was empty,do something else insted of waiting 
end

-when a semaphore is initialized with exactly one key,it act as a mutex (mutual exclusion object).this ensure that only one thread can access
a shared resource (like memory bus or file) at a time.
