# vi: ai sw=2 ts=2 tw=0 et foldmethod=marker

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F

ipset destroy Tapmodo_Hosts
ipset create Tapmodo_Hosts hash:ip

ipset add Tapmodo_Hosts 127.0.0.1       #Name:  apps.tapmodo.net
ipset add Tapmodo_Hosts 107.170.243.51  #Name:  apps.tapmodo.net
ipset add Tapmodo_Hosts 192.241.225.252 #Name:  alum.tapmodo.net
ipset add Tapmodo_Hosts 162.243.149.132 #Name:  balti.tapmodo.net
ipset add Tapmodo_Hosts 192.241.213.102 #Name:  bay.tapmodo.net
ipset add Tapmodo_Hosts 198.199.104.233 #Name:  chili.tapmodo.net
ipset add Tapmodo_Hosts 192.241.234.61  #Name:  clove.tapmodo.net
ipset add Tapmodo_Hosts 198.199.96.77   #Name:  cress.tapmodo.net
ipset add Tapmodo_Hosts 50.57.43.175    #Name:  aji.tapmodo.net
ipset add Tapmodo_Hosts 192.241.221.81  #Name:  tikka.tapmodo.net
ipset add Tapmodo_Hosts 192.241.195.142 #Name:  contender-pbx.tapmodo.net
ipset add Tapmodo_Hosts 198.199.114.188 #Name:  poppy.tapmodo.net

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 3000 -j ACCEPT
iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -m set --match-set Tapmodo_Hosts src -j ACCEPT

iptables -P INPUT DROP
