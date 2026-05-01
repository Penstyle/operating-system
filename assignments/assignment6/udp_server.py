import socket

HOST = "127.0.0.1"
PORT = 8081

def main():
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server_socket.bind((HOST, PORT))

    print(f"[UDP SERVER] Listening on {HOST}:{PORT}")

    while True:
        data, addr = server_socket.recvfrom(1024)
        print(f"[UDP SERVER] From {addr} -> {data.decode()}")

if __name__ == "__main__":
    main()
