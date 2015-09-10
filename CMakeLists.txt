# To do an out-of-source build using CMAKE
# create a build folder, cd into it, generate Makefile and run make e.g.
#   mkdir build 
# 	cd build
#   cmake ..
#   make
# 	make install

cmake_minimum_required (VERSION 2.6)
project (AMQPTools)
set(EXECUTABLE_OUTPUT_PATH bin)
set(RMQ_LIBRARY RMQ_LIBRARY-NOTFOUND)
find_library(RMQ_LIBRARY rabbitmq)
if(RMQ_LIBRARY)
	MESSAGE( STATUS "Using RMQ_LIBRARY found in: " ${RMQ_LIBRARY} )
else(RMQ_LIBRARY)
	MESSAGE( FATAL_ERROR "RMQ_LIBRARY not found!")
endif(RMQ_LIBRARY)	
add_executable(amqpspawn amqpspawn.c)
target_link_libraries(amqpspawn ${RMQ_LIBRARY})
add_executable(amqpsend amqpsend.c)
target_link_libraries(amqpsend ${RMQ_LIBRARY})
install (TARGETS amqpsend amqpspawn DESTINATION bin)
