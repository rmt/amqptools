RABBITHOME=$(HOME)/opt

all: amqpspawn amqpsend

amqpspawn: amqpspawn.c
	gcc -o amqpspawn amqpspawn.c -I$(RABBITHOME)/include $(RABBITHOME)/lib/librabbitmq.a

amqpsend: amqpsend.c
	gcc -o amqpsend amqpsend.c -I$(RABBITHOME)/include $(RABBITHOME)/lib/librabbitmq.a

clean:
	rm -f amqpsend amqpspawn
