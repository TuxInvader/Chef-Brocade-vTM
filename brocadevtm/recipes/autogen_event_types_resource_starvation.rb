# === Recipe: Vtm_event_types_resource_starvation
#
# This class is a direct implementation of brocadvtm, Vtm_event_types
#
# Please refer to the documentation in that module for more information
#
vtm_event_types 'Resource%20Starvation' do
	action = :create
	basic__actions '[]'
	basic__built_in true
	basic__note 'Events triggered when we have run out of system resources or hit a configured limit in the Virtual Traffic Manager.'
	cloudcredentials__event_tags '[]'
	cloudcredentials__objects '[]'
	config__event_tags '[]'
	faulttolerance__event_tags '[]'
	general__event_tags '["fewfreefds"]'
	glb__event_tags '[]'
	glb__objects '[]'
	java__event_tags '[]'
	licensekeys__event_tags '[]'
	licensekeys__objects '[]'
	locations__event_tags '[]'
	locations__objects '[]'
	monitors__event_tags '[]'
	monitors__objects '[]'
	pools__event_tags '[]'
	pools__objects '[]'
	protection__event_tags '[]'
	protection__objects '[]'
	rules__event_tags '["rulebufferlarge"]'
	rules__objects '["*"]'
	slm__event_tags '[]'
	slm__objects '[]'
	ssl__event_tags '[]'
	sslhw__event_tags '[]'
	trafficscript__event_tags '[]'
	vservers__event_tags '["maxclientbufferdrop","responsetoolarge","rtspstreamnoports","sipstreamnoports"]'
	vservers__objects '["*"]'
	zxtms__event_tags '[]'
	zxtms__objects '[]'
end
