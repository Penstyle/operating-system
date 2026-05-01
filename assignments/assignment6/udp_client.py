import socket

HOST = "127.0.0.1"
PORT = 8081

def main():
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    payload = "UDP_TEST_DATAGRAM"
    client_socket.sendto(payload.encode(), (HOST, PORT))

    print("[UDP CLIENT] Datagram sent.")

if __name__ == "__main__":
    main()

