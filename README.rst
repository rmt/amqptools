Command line AMQP clients
=========================

amqpspawn and amqpsend allow the simple use of AMQP brokers from the command
line.

They use rabbitmq-c (http://hg.rabbitmq.com/rabbitmq-c/), and the rabbitmq
library can be statically compiled-in so as to only leave standard libc
dependencies.  The resident memory footprint is under one megabyte, making them
perfect for low resource environments.

amqpspawn
---------

amqpspawn binds to an exchange and queue using a binding key, and can
spawn a program on message retrieval, or send the same information to stdout.

$ ./amqpspawn --help::

  Usage: ./amqpspawn [options] exchange bindingkey
  Options:
    --host/-h host         specify the host (default: "amqpbroker")
    --port/-P port         specify AMQP port (default: 5672)
    --vhost/-v vhost       specify vhost (default: "/")
    --queue/-q queue       specify queue name (default: auto-generated)
    --execute/-e program   program to execute
    --user/-u username     specify username (default: "guest")
    --password/-p password specify password (default: "guest")
  
  
  The following environment variables may also be set:
    AMQP_HOST, AMQP_PORT, AMQP_VHOST, AMQP_USER, AMQP_PASSWORD
  
  Program will be called like "program "tempfile" "routing_key"
     where tempfile contains the raw bytestream of the message
  
  If program is not supplied, the above format will be printed to stdout
  
  Example: amqp_listen amqp.example.com 5672 amq.fanout '' ./onmessage.sh


amqpsend
--------

amqpsend sends a message to an exchange using the specified routing key.
You may also pass a filename as input.

$ ./amqpsend --help::

  Usage: ./amqpsend [options] exchange routingkey [msg]
  Options:
    --host/-h host         specify the host (default: "amqpbroker")
    --port/-P port         specify AMQP port (default: 5672)
    --vhost/-v vhost       specify vhost (default: "/")
    --file/-f filename     send contents of file as message
    --user/-u username     specify username (default: "guest")
    --password/-p password specify password (default: "guest")
    --persistent           mark message as persistent
  
  
  The following environment variables may also be set:
    AMQP_HOST, AMQP_PORT, AMQP_VHOST, AMQP_USER, AMQP_PASSWORD
  
  Program will be called like "program "tempfile" "routing_key"
     where tempfile contains the raw bytestream of the message
  
  If program is not supplied, the above format will be printed to stdout
  
  Example: amqp_listen amqp.example.com 5672 amq.fanout '' ./onmessage.sh
