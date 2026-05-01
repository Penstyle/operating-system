import socket

HOST = "127.0.0.1"
PORT = 8080

def main():
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((HOST, PORT))

    payload = "TCP_TEST_PACKET"
    client_socket.sendall(payload.encode())

    ack = client_socket.recv(1024).decode()
    print(f"[TCP CLIENT] Received ACK: {ack}")

    client_socket.close()

if __name__ == "__main__":
    main()
