# === Recipe: Vtm_monitor_scripts_dns_port_pl

vtm_monitor_scripts 'dns_port.pl' do
	action = :create
	content 'monitor_scripts_dns_port_pl.data'
end
