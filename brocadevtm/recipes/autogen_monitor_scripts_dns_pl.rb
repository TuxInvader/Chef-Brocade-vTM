# === Recipe: Vtm_monitor_scripts_dns_pl

vtm_monitor_scripts 'dns.pl' do
	action = :create
	content 'monitor_scripts_dns_pl.data'
end
