import time
import zmq

context = zmq.Context()
socket = context.socket(zmq.REP)
socket.bind("tcp://127.0.0.1:5555")

while True:
    message = socket.recv()
    print 'received request: %s' % message

    time.sleep(1)

    socket.send(b'World')
