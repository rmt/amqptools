
ifeq (${AMQPTOOLS_RABBITHOME},)
    AMQPTOOLS_RABBITHOME = "/usr/local/src/rabbitmq/rabbitmq-c"
endif

ifeq (${AMQPTOOLS_INSTALLROOT},)
    AMQPTOOLS_INSTALLROOT = "/usr/local/bin"
endif

LD_RUN_PATH = $(realpath $(AMQPTOOLS_RABBITHOME)/librabbitmq/.libs)
export LD_RUN_PATH

all: clean build

build: amqpspawn amqpsend

install: bin/amqpspawn bin/amqpsend
	install -D -m0755 bin/amqpspawn $(AMQPTOOLS_INSTALLROOT)/amqpspawn
	install -D -m0755 bin/amqpsend $(AMQPTOOLS_INSTALLROOT)/amqpsend

uninstall:
	rm -f $(AMQPTOOLS_INSTALLROOT)/amqpspawn
	rm -f $(AMQPTOOLS_INSTALLROOT)/amqpsend

amqpspawn: amqpspawn.c
	gcc -o bin/amqpspawn amqpspawn.c -I$(AMQPTOOLS_RABBITHOME)/librabbitmq $(AMQPTOOLS_RABBITHOME)/librabbitmq/.libs/librabbitmq.so

amqpsend: amqpsend.c
	gcc -o bin/amqpsend amqpsend.c -I$(AMQPTOOLS_RABBITHOME)/librabbitmq $(AMQPTOOLS_RABBITHOME)/librabbitmq/.libs/librabbitmq.so

clean:
	rm -f bin/amqpsend bin/amqpspawn
