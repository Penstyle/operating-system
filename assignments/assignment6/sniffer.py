from scapy.all import sniff, IP, TCP, UDP

TCP_PORT = 8080
UDP_PORT = 8081

def process_packet(packet):
    if IP in packet:
        ip_layer = packet[IP]
        src_ip = ip_layer.src
        dst_ip = ip_layer.dst

        if packet.haslayer(TCP):
            tcp_layer = packet[TCP]
            sport = tcp_layer.sport
            dport = tcp_layer.dport

            if sport == TCP_PORT or dport == TCP_PORT:
                print("\n[DETECTED TCP PACKAGE]")
                print(f"Source IP: {src_ip}")
                print(f"Destination IP: {dst_ip}")
                print(f"Source Port: {sport}")
                print(f"Destination Port: {dport}")

        elif packet.haslayer(UDP):
            udp_layer = packet[UDP]
            sport = udp_layer.sport
            dport = udp_layer.dport

            if sport == UDP_PORT or dport == UDP_PORT:
                print("\n[DETECTED UDP DATAGRAM]")
                print(f"Source IP: {src_ip}")
                print(f"Destination IP: {dst_ip}")
                print(f"Source Port: {sport}")
                print(f"Destination Port: {dport}")

def main():
    print("[SNIFFER] Listening on loopback interface (lo)...")
    sniff(iface="lo", prn=process_packet, store=False)

if __name__ == "__main__":
    main()

