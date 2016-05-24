# === Recipe: Vtm_rules_application_firewall_enforcer

vtm_rules 'Application%20Firewall%20Enforcer' do
	action = :create
	content 'rules_application_firewall_enforcer.data'
end
