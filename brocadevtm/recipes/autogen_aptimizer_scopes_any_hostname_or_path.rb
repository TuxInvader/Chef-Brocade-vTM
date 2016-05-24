# === Recipe: Vtm_aptimizer_scopes_any_hostname_or_path
#
# This class is a direct implementation of brocadvtm, Vtm_aptimizer_scopes
#
# Please refer to the documentation in that module for more information
#
vtm_aptimizer_scopes 'Any%20hostname%20or%20path' do
	action = :create
	basic__hostnames '[]'
	basic__root '/'
end
