# === Recipe: Vtm_user_groups_admin
#
# This class is a direct implementation of brocadvtm, Vtm_user_groups
#
# Please refer to the documentation in that module for more information
#
vtm_user_groups 'admin' do
	action = :create
	basic__description 'Full access to all pages'
	basic__password_expire_time 0
	basic__permissions '[{"name":"all","access_level":"full"}]'
	basic__timeout 30
end
