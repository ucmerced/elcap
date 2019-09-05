with open('dhcpd.conf') as f:
    lines = f.readlines()

hostname=''
mac=''
ip=''
mac_host = {}
host_mac = {}
for line in lines:
    if 'host ' in line:
        hostname = line.split(' ')[-2]
    if "hardware" in line:
        mac = line.split(' ')[-1][:-2].replace(':', '-')
        #print(line.strip(), mac, hostname)
        mac_host[mac] = hostname
        host_mac[hostname] = mac

host_mac

import jinja2

e = jinja2.Environment()

tpl = e.from_string(open('centos7.tpl').read())

for i in range(1,62):
    hostname = f'c{i}'
    mac = host_mac[hostname]
    with open(f'confs/{hostname}-{mac}.cfg', 'w') as f:
        f.write(tpl.render(hostname=hostname))

tpl = e.from_string(open('pxemenu.tpl').read())

for mac in mac_host.keys():
    hostname = mac_host[mac]
    with open(f'pxelinux.cfg/{mac}', 'w') as f:
        f.write(tpl.render(mac=mac, hostname=hostname))
