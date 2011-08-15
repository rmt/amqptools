
ifeq (${AMQPTOOLS_RABBITHOME},)
    AMQPTOOLS_RABBITHOME = "/usr/local/src/rabbitmq/rabbitmq-c"
endif

ifeq (${AMQPTOOLS_INSTALLROOT},)
    AMQPTOOLS_INSTALLROOT = "/usr/local/bin"
endif


all: clean build

build: amqpspawn amqpsend

install: bin/amqpspawn bin/amqpsend
	cp -f bin/amqpspawn $(AMQPTOOLS_INSTALLROOT)/
	cp -f bin/amqpsend $(AMQPTOOLS_INSTALLROOT)/

uninstall:
	rm -f $(AMQPTOOLS_INSTALLROOT)/amqpspawn
	rm -f $(AMQPTOOLS_INSTALLROOT)/amqpsend

amqpspawn: amqpspawn.c
	gcc -o bin/amqpspawn amqpspawn.c -I$(AMQPTOOLS_RABBITHOME)/librabbitmq $(AMQPTOOLS_RABBITHOME)/librabbitmq/.libs/librabbitmq.a

amqpsend: amqpsend.c
	gcc -o bin/amqpsend amqpsend.c -I$(AMQPTOOLS_RABBITHOME)/librabbitmq $(AMQPTOOLS_RABBITHOME)/librabbitmq/.libs/librabbitmq.a

clean:
	rm -f bin/amqpsend bin/amqpspawn
