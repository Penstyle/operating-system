import socket

HOST = "127.0.0.1"
PORT = 8080

def main():
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((HOST, PORT))
    server_socket.listen(1)

    print(f"[TCP SERVER] Listening on {HOST}:{PORT}")

    while True:
        conn, addr = server_socket.accept()
        print(f"[TCP SERVER] Connection from {addr}")

        data = conn.recv(1024).decode()
        print(f"[TCP SERVER] Received: {data}")

        conn.sendall(b"ACK_FROM_TCP_SERVER")
        conn.close()

if __name__ == "__main__":
    main()
