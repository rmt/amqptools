Installation notes under debian wheezy


1. Install additional packages:

apt-get install python-simplejson libtool autoconf automake gcc pkg-config

2. Download and compile supporting code:
    git clone git://github.com/alanxz/rabbitmq-c.git
    cd rabbitmq-c
    git submodule init
    git submodule update
    autoreconf -i
    ./configure
    make

No need to actually install the supporting packages; the compiled packages
just need to be available for amqptools.

3. Compile amqptools:
    cd ..
    git clone git@github.com:rmt/amqptools.git
    cd amqptools
    make AMQPTOOLS_RABBITHOME=../rabbitmq-c

This assumes the rabbitmq-c` path is parallel to the amqptools directory:
  parent/
  ├── amqptools/
  ├── rabbitmq-c/
  └── rabbitmq-codegen/
    
4. add rabbitmq libs to the LD_LIBRARY_PATH
    if you get: `bin/amqpsend: error while loading shared libraries: librabbitmq.so.1: cannot open shared object file: No such file or directory`
    you need to set the LD_LIBRARY_PATH environment variable so that amqptools finds the rabbitmq libs
    
    put this path into the env variable LD_LIBRARY_PATH. Or set it before running amqpsend or amqpspawn:
    (in folder amqptools)
    ```
    LD_LIBRARY_PATH=`pwd`/../rabbitmq-c/librabbitmq/.libs bin/amqpsend
    ```

