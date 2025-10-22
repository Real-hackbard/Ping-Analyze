# Ping-Analyze:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) : ![Ping Analyze](https://github.com/user-attachments/assets/9d6199a3-8c0f-4b8e-921e-4629e7eec45b)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) &nbsp;&nbsp;: ![Char Drawer](https://github.com/user-attachments/assets/14be320b-d6d6-4e3f-ac0e-5fb5a4fc4f31)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) &nbsp;: ![102025](https://github.com/user-attachments/assets/62cea8cc-bd7d-49bd-b920-5590016735c0)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>

Ping measures the [round-trip time](https://en.wikipedia.org/wiki/Round-trip_delay) for messages sent from the originating host to a destination computer that are echoed back to the source. The name comes from [active sonar terminology](https://en.wikipedia.org/wiki/Packet_loss) that sends a [pulse](https://en.wikipedia.org/wiki/Pulse_(signal_processing)) of sound and listens for the echo to detect objects under water.

### Features:
* Multi Host Ping
* Range Calculating
* Multi Thread Ping
* Tracert Host
* Ping Analyze

</br>

![Ping Analyze](https://github.com/user-attachments/assets/bd0293b9-c71f-45af-8191-638e46bafe1d)

</br>

Ping operates by means of [Internet Control Message Protocol](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol) (ICMP) [packets](https://en.wikipedia.org/wiki/Network_packet). Pinging involves sending an ICMP echo request to the target host and waiting for an ICMP echo reply. The program reports errors, packet loss, and a statistical summary of the results, typically including the minimum, maximum, the mean round-trip times, and standard deviation of the mean.

[Command-line](https://en.wikipedia.org/wiki/Command-line_interface#Command-line_option) options and [terminal](https://en.wikipedia.org/wiki/Computer_terminal) output vary by implementation. Options may include the size of the payload, count of tests, limits for the number of network hops ([TTL](https://en.wikipedia.org/wiki/Time_to_live#IP_packets)) that probes traverse, interval between the requests and time to wait for a response. Many systems provide a companion utility ping6, for testing on [Internet Protocol version](https://en.wikipedia.org/wiki/IPv6) 6 (IPv6) networks, which implement [ICMPv6](https://en.wikipedia.org/wiki/ICMPv6).

### Error indications:
In cases of no response from the target host, most implementations display either nothing or periodically print notifications about timing out. Possible ping results indicating a problem include the following:
* H, !N or !P – host, network or protocol unreachable
* S – source route failed
* F – fragmentation needed
* U or !W – destination network/host unknown
* I – source host is isolated
* A – communication with destination network administratively prohibited
* Z – communication with destination host administratively prohibited
* Q – for this ToS the destination network is unreachable
* T – for this ToS the destination host is unreachable
* X – communication administratively prohibited
* V – host precedence violation
* C – precedence cutoff in effect

In case of error, the target host or an intermediate router sends back an ICMP error message, for example host unreachable or TTL exceeded in transit. In addition, these messages include the first eight bytes of the original message (in this case, the header of the ICMP echo request, including the quench value), so the ping utility can match responses to originating queries.

### ICMP:
The Internet Control Message Protocol (ICMP) is a supporting protocol in the [Internet protocol suite](https://en.wikipedia.org/wiki/Internet_protocol_suite). It is used by [network devices](https://en.wikipedia.org/wiki/Networking_hardware), including routers, to send error messages and operational information indicating success or failure when communicating with another IP address. For example, an error is indicated when a requested service is not available or that a host or router could not be reached. ICMP differs from [transport protocols](https://en.wikipedia.org/wiki/Transport_layer) such as TCP and UDP in that it is not typically used to exchange data between systems, nor is it regularly employed by end-user network applications (with the exception of some diagnostic tools like ping and [traceroute](https://en.wikipedia.org/wiki/Traceroute)).

### Tracert:
The command reports the round-trip times of the packets received from each successive host (remote node) along the route to a destination. The sum of the mean times in each [hop](https://en.wikipedia.org/wiki/Hop_(networking)) is a measure of the total time spent to establish the connection. The command aborts if all (usually three) sent packets are lost more than twice.

Ping, however, only computes the final round-trip times from the destination point.

### Network packet:
In telecommunications and computer networking, a network packet is a formatted unit of data carried by a [packet-switched network](https://en.wikipedia.org/wiki/Packet_switching). A packet consists of control information and user data; the latter is also known as the payload. Control information provides data for delivering the payload (e.g., source and destination network addresses, error detection codes, or sequencing information). Typically, control information is found in packet [headers](https://en.wikipedia.org/wiki/Header_(computing)) and [trailers](https://en.wikipedia.org/wiki/Trailer_(computing)).

In packet switching, the [bandwidth](https://en.wikipedia.org/wiki/Bandwidth_(computing)) of the transmission medium is shared between multiple communication sessions, in contrast to [circuit switching](https://en.wikipedia.org/wiki/Circuit_switching), in which circuits are preallocated for the duration of one session and data is typically transmitted as a continuous [bit stream](https://en.wikipedia.org/wiki/Bitstream).
