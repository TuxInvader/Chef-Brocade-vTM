# === Recipe: Vtm_event_types_critical_problem_occurred
#
# This class is a direct implementation of brocadvtm, Vtm_event_types
#
# Please refer to the documentation in that module for more information
#
vtm_event_types 'Critical%20Problem%20Occurred' do
	action = :create
	basic__actions '[]'
	basic__built_in true
	basic__note 'Every critical problem that might occur with the Virtual Traffic Manager or your services.'
	cloudcredentials__event_tags '[]'
	cloudcredentials__objects '[]'
	config__event_tags '[]'
	faulttolerance__event_tags '["machinetimeout","pingfrontendfail","pinggwfail","flipperipexists","machinefail","pingbackendfail","routingswfailurelimitreached","routingswstartfailed"]'
	general__event_tags '["appliance","zxtmswerror"]'
	glb__event_tags '["glbservicedied"]'
	glb__objects '["*"]'
	java__event_tags '["javaterminatefail","javastartfail","javadied"]'
	licensekeys__event_tags '["expired","unlicensed","licensecorrupt","license-unauthorized","licenseclustertoobig"]'
	licensekeys__objects '["*"]'
	locations__event_tags '[]'
	locations__objects '[]'
	monitors__event_tags '["monitorfail"]'
	monitors__objects '["*"]'
	pools__event_tags '["pooldied","nodefail"]'
	pools__objects '["*"]'
	protection__event_tags '[]'
	protection__objects '[]'
	rules__event_tags '[]'
	rules__objects '[]'
	slm__event_tags '["slmclasslimitexceeded","slmfallenbelowserious"]'
	slm__objects '["*"]'
	ssl__event_tags '[]'
	sslhw__event_tags '["sslhwfail"]'
	trafficscript__event_tags '[]'
	vservers__event_tags '[]'
	vservers__objects '[]'
	zxtms__event_tags '[]'
	zxtms__objects '[]'
end
