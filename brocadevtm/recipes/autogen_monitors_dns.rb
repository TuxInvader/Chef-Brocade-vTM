# === Recipe: Vtm_monitors_dns
#
# This class is a direct implementation of brocadvtm, Vtm_monitors
#
# Please refer to the documentation in that module for more information
#
vtm_monitors 'DNS' do
	action = :create
	basic__back_off true
	basic__delay 5
	basic__failures 3
	basic__scope 'pernode'
	basic__timeout 5
	basic__type 'program'
	basic__use_ssl false
	basic__verbose false
	http__path '/'
	http__status_regex '^[234][0-9][0-9]$'
	rtsp__path '/'
	rtsp__status_regex '^[234][0-9][0-9]$'
	script__arguments '[{"name":"response_addr","description":"Address to expect in DNS response","value":""},{"name":"request_host","description":"The DNS monitor sends a DNS query to the DNS server running on port 53 on the monitored node.<br>Hostname to look up in DNS:","value":""}]'
	script__program 'dns.pl'
	sip__status_regex '^[234][0-9][0-9]$'
	sip__transport 'udp'
	tcp__max_response_len 2048
	tcp__response_regex '.+'
	udp__accept_all false
end
