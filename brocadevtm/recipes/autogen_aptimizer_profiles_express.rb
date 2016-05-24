# === Recipe: Vtm_aptimizer_profiles_express
#
# This class is a direct implementation of brocadvtm, Vtm_aptimizer_profiles
#
# Please refer to the documentation in that module for more information
#
vtm_aptimizer_profiles 'Express' do
	action = :create
	basic__background_after 0
	basic__background_on_additional_resources false
	basic__mode 'active'
	basic__show_info_bar true
end
