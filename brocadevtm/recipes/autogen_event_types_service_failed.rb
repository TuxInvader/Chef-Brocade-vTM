# === Recipe: Vtm_event_types_service_failed
#
# This class is a direct implementation of brocadvtm, Vtm_event_types
#
# Please refer to the documentation in that module for more information
#
vtm_event_types 'Service%20Failed' do
	action = :create
	basic__actions '[]'
	basic__built_in true
	basic__note 'Problems with services (virtual servers, pools, GLB services, classes and related files).'
	cloudcredentials__event_tags '[]'
	cloudcredentials__objects '[]'
	config__event_tags '[]'
	faulttolerance__event_tags '[]'
	general__event_tags '[]'
	glb__event_tags '["glbmissingips","glbnolocations","glbtoomanylocations","glblogwritefail","glbservicedied"]'
	glb__objects '["*"]'
	java__event_tags '["javanotfound","servleterror"]'
	licensekeys__event_tags '[]'
	licensekeys__objects '[]'
	locations__event_tags '["locationunavailable","locempty","locationmonitorfail","locationsoapfail","locationfail"]'
	locations__objects '["*"]'
	monitors__event_tags '["monitorfail"]'
	monitors__objects '["*"]'
	pools__event_tags '["pooldied","noderesolvefailure","noderesolvemultiple","nodefail","ehloinvalid","starttlsinvalid","nostarttls"]'
	pools__objects '["*"]'
	protection__event_tags '["triggersummary"]'
	protection__objects '["*"]'
	rules__event_tags '["datastorefull","ruleabort","rulexmlerr","rulebodycomperror","rulebufferlarge","rulelogmsgwarn","poolactivenodesunknown","pooluseunknown","norate","rulenopersistence","forwardproxybadhost","invalidemit","rulelogmsgserious"]'
	rules__objects '["*"]'
	slm__event_tags '["slmfallenbelowserious","slmnodeinfo"]'
	slm__objects '["*"]'
	ssl__event_tags '[]'
	sslhw__event_tags '[]'
	trafficscript__event_tags '[]'
	vservers__event_tags '["vslogwritefail","respcompfail","responsetoolarge","rtspstreamnoports","sipstreamnoports","vscacertexpired","vscacerttoexpire","vscrloutofdate","vssslcertexpired","vssslcerttoexpire"]'
	vservers__objects '["*"]'
	zxtms__event_tags '[]'
	zxtms__objects '[]'
end
