# === Recipe: Vtm_monitors_ftp
#
# This class is a direct implementation of brocadvtm, Vtm_monitors
#
# Please refer to the documentation in that module for more information
#
vtm_monitors 'FTP' do
	action = :create
	basic__back_off true
	basic__delay 5
	basic__failures 3
	basic__scope 'pernode'
	basic__timeout 5
	basic__type 'tcp_transaction'
	basic__use_ssl false
	basic__verbose false
	http__path '/'
	http__status_regex '^[234][0-9][0-9]$'
	rtsp__path '/'
	rtsp__status_regex '^[234][0-9][0-9]$'
	script__arguments '[]'
	sip__status_regex '^[234][0-9][0-9]$'
	sip__transport 'udp'
	tcp__close_string 'QUIT\\r\\n'
	tcp__max_response_len 2048
	tcp__response_regex '(^|\\n)220 [^\\n]+\\n'
	udp__accept_all false
end
