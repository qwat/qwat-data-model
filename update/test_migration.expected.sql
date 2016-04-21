"public","geography_columns"
"public","geometry_columns"
"public","raster_columns"
"public","raster_overviews"
"public","spatial_ref_sys"
"qwat_dr","annotationline"
"qwat_dr","annotationpoint"
"qwat_dr","constructionpoint"
"qwat_dr","dimension_distance"
"qwat_dr","dimension_orientation"
"qwat_od","chamber"
"qwat_od","consumptionzone"
"qwat_od","cover"
"qwat_od","crossing"
"qwat_od","distributor"
"qwat_od","district"
"qwat_od","folder"
"qwat_od","hydrant"
"qwat_od","installation"
"qwat_od","leak"
"qwat_od","meter"
"qwat_od","meter_reference"
"qwat_od","network_element"
"qwat_od","node"
"qwat_od","part"
"qwat_od","pipe"
"qwat_od","pressurecontrol"
"qwat_od","pressurezone"
"qwat_od","printmap"
"qwat_od","protectionzone"
"qwat_od","pump"
"qwat_od","remote"
"qwat_od","samplingpoint"
"qwat_od","source"
"qwat_od","subscriber"
"qwat_od","subscriber_reference"
"qwat_od","surveypoint"
"qwat_od","tank"
"qwat_od","treatment"
"qwat_od","valve"
"qwat_od","vw_consumptionzone"
"qwat_od","vw_element_hydrant"
"qwat_od","vw_element_installation"
"qwat_od","vw_element_meter"
"qwat_od","vw_element_part"
"qwat_od","vw_element_samplingpoint"
"qwat_od","vw_element_subscriber"
"qwat_od","vw_element_valve"
"qwat_od","vw_export_hydrant"
"qwat_od","vw_export_installation"
"qwat_od","vw_export_meter"
"qwat_od","vw_export_part"
"qwat_od","vw_export_subscriber"
"qwat_od","vw_export_valve"
"qwat_od","vw_installation_chamber"
"qwat_od","vw_installation_pressurecontrol"
"qwat_od","vw_installation_pump"
"qwat_od","vw_installation_source"
"qwat_od","vw_installation_tank"
"qwat_od","vw_installation_treatment"
"qwat_od","vw_leak"
"qwat_od","vw_node_element"
"qwat_od","vw_pipe"
"qwat_od","vw_pipe_child_parent"
"qwat_od","vw_pipe_schema"
"qwat_od","vw_pipe_schema_error"
"qwat_od","vw_pipe_schema_merged"
"qwat_od","vw_pipe_schema_visibleitems"
"qwat_od","vw_printmap"
"qwat_od","vw_protectionzone"
"qwat_od","vw_qwat_installation"
"qwat_od","vw_qwat_network_element"
"qwat_od","vw_qwat_node"
"qwat_od","vw_remote"
"qwat_od","vw_search_view"
"qwat_od","vw_subscriber_pipe_relation"
"qwat_od","vw_valve_lines"
"qwat_od","worker"
"qwat_sys","logged_actions"
"qwat_sys","settings"
"qwat_sys","versions"
"qwat_vl","bedding"
"qwat_vl","cistern"
"qwat_vl","cover_type"
"qwat_vl","hydrant_material"
"qwat_vl","hydrant_model_inf"
"qwat_vl","hydrant_model_sup"
"qwat_vl","hydrant_output"
"qwat_vl","hydrant_provider"
"qwat_vl","leak_cause"
"qwat_vl","locationtype"
"qwat_vl","object_reference"
"qwat_vl","overflow"
"qwat_vl","part_type"
"qwat_vl","pipe_function"
"qwat_vl","pipe_installmethod"
"qwat_vl","pipe_material"
"qwat_vl","pipe_protection"
"qwat_vl","precision"
"qwat_vl","precisionalti"
"qwat_vl","pressurecontrol_type"
"qwat_vl","protectionzone_type"
"qwat_vl","pump_operating"
"qwat_vl","pump_type"
"qwat_vl","remote_type"
"qwat_vl","source_quality"
"qwat_vl","source_type"
"qwat_vl","status"
"qwat_vl","subscriber_type"
"qwat_vl","survey_type"
"qwat_vl","tank_firestorage"
"qwat_vl","value_list_base"
"qwat_vl","valve_actuation"
"qwat_vl","valve_function"
"qwat_vl","valve_maintenance"
"qwat_vl","valve_type"
"qwat_vl","visible"
"qwat_vl","watertype"
"qwat_vl","worker_type"
"qwat_sys","settings","name",,"YES","character varying","30",,,
"qwat_sys","settings","type",,"YES","regtype",,,,
"qwat_sys","settings","value",,"YES","text",,,,
"qwat_sys","settings","v_min",,"YES","double precision",,"53","2",
"qwat_sys","settings","v_max",,"YES","double precision",,"53","2",
"qwat_sys","settings","description",,"YES","text",,,,
"qwat_sys","settings","id","nextval('qwat_sys.settings_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_sys","settings","v_not_null","true","YES","boolean",,,,
"qwat_sys","versions","module",,"YES","character varying",,,,
"qwat_sys","versions","version",,"YES","character varying",,,,
"qwat_sys","versions","id","nextval('qwat_sys.versions_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_sys","logged_actions","schema_name",,"NO","text",,,,
"qwat_sys","logged_actions","table_name",,"NO","text",,,,
"qwat_sys","logged_actions","relid",,"NO","oid",,,,
"qwat_sys","logged_actions","session_user_name",,"YES","text",,,,
"qwat_sys","logged_actions","action_tstamp_tx",,"NO","timestamp with time zone",,,,"6"
"qwat_sys","logged_actions","action_tstamp_stm",,"NO","timestamp with time zone",,,,"6"
"qwat_sys","logged_actions","action_tstamp_clk",,"NO","timestamp with time zone",,,,"6"
"qwat_sys","logged_actions","transaction_id",,"YES","bigint",,"64","2",
"qwat_sys","logged_actions","application_name",,"YES","text",,,,
"qwat_sys","logged_actions","client_addr",,"YES","inet",,,,
"qwat_sys","logged_actions","client_port",,"YES","integer",,"32","2",
"qwat_sys","logged_actions","client_query",,"NO","text",,,,
"qwat_sys","logged_actions","action",,"NO","text",,,,
"qwat_sys","logged_actions","row_data",,"YES","USER-DEFINED",,,,
"qwat_sys","logged_actions","changed_fields",,"YES","USER-DEFINED",,,,
"qwat_sys","logged_actions","statement_only",,"NO","boolean",,,,
"qwat_sys","logged_actions","event_id","nextval('qwat_sys.logged_actions_event_id_seq'::regclass)","NO","bigint",,"64","2",
"qwat_vl","value_list_base","id",,"NO","integer",,"32","2",
"qwat_vl","value_list_base","vl_active","true","YES","boolean",,,,
"qwat_vl","value_list_base","short_fr",,"YES","character varying","10",,,
"qwat_vl","value_list_base","short_en",,"YES","character varying","10",,,
"qwat_vl","value_list_base","short_ro",,"YES","character varying","10",,,
"qwat_vl","value_list_base","value_fr",,"YES","character varying","50",,,
"qwat_vl","value_list_base","value_en",,"YES","character varying","50",,,
"qwat_vl","value_list_base","value_ro",,"YES","character varying","50",,,
"qwat_vl","value_list_base","description_fr",,"YES","text",,,,
"qwat_vl","value_list_base","description_en",,"YES","text",,,,
"qwat_vl","value_list_base","description_ro",,"YES","text",,,,
"qwat_vl","object_reference","id",,"NO","integer",,"32","2",
"qwat_vl","object_reference","short_fr",,"YES","character varying","10",,,
"qwat_vl","object_reference","short_en",,"YES","character varying","10",,,
"qwat_vl","object_reference","short_ro",,"YES","character varying","10",,,
"qwat_vl","object_reference","value_fr",,"YES","character varying","50",,,
"qwat_vl","object_reference","value_en",,"YES","character varying","50",,,
"qwat_vl","object_reference","value_ro",,"YES","character varying","50",,,
"qwat_vl","object_reference","description_fr",,"YES","text",,,,
"qwat_vl","object_reference","description_en",,"YES","text",,,,
"qwat_vl","object_reference","description_ro",,"YES","text",,,,
"qwat_vl","object_reference","vl_active","true","YES","boolean",,,,
"qwat_vl","bedding","id",,"NO","integer",,"32","2",
"qwat_vl","bedding","short_fr",,"YES","character varying","10",,,
"qwat_vl","bedding","short_en",,"YES","character varying","10",,,
"qwat_vl","bedding","short_ro",,"YES","character varying","10",,,
"qwat_vl","bedding","value_fr",,"YES","character varying","50",,,
"qwat_vl","bedding","value_en",,"YES","character varying","50",,,
"qwat_vl","bedding","value_ro",,"YES","character varying","50",,,
"qwat_vl","bedding","description_fr",,"YES","text",,,,
"qwat_vl","bedding","description_en",,"YES","text",,,,
"qwat_vl","bedding","description_ro",,"YES","text",,,,
"qwat_vl","bedding","vl_active","true","YES","boolean",,,,
"qwat_vl","cistern","id",,"NO","integer",,"32","2",
"qwat_vl","cistern","short_fr",,"YES","character varying","10",,,
"qwat_vl","cistern","short_en",,"YES","character varying","10",,,
"qwat_vl","cistern","short_ro",,"YES","character varying","10",,,
"qwat_vl","cistern","value_fr",,"YES","character varying","50",,,
"qwat_vl","cistern","value_en",,"YES","character varying","50",,,
"qwat_vl","cistern","value_ro",,"YES","character varying","50",,,
"qwat_vl","cistern","description_fr",,"YES","text",,,,
"qwat_vl","cistern","description_en",,"YES","text",,,,
"qwat_vl","cistern","description_ro",,"YES","text",,,,
"qwat_vl","cistern","vl_active","true","YES","boolean",,,,
"qwat_vl","cover_type","id",,"NO","integer",,"32","2",
"qwat_vl","cover_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","cover_type","short_en",,"YES","character varying","10",,,
"qwat_vl","cover_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","cover_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","cover_type","value_en",,"YES","character varying","50",,,
"qwat_vl","cover_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","cover_type","description_fr",,"YES","text",,,,
"qwat_vl","cover_type","description_en",,"YES","text",,,,
"qwat_vl","cover_type","description_ro",,"YES","text",,,,
"qwat_vl","cover_type","vl_active","true","YES","boolean",,,,
"qwat_vl","hydrant_model_sup","id",,"NO","integer",,"32","2",
"qwat_vl","hydrant_model_sup","short_fr",,"YES","character varying","10",,,
"qwat_vl","hydrant_model_sup","short_en",,"YES","character varying","10",,,
"qwat_vl","hydrant_model_sup","short_ro",,"YES","character varying","10",,,
"qwat_vl","hydrant_model_sup","value_fr",,"YES","character varying","50",,,
"qwat_vl","hydrant_model_sup","value_en",,"YES","character varying","50",,,
"qwat_vl","hydrant_model_sup","value_ro",,"YES","character varying","50",,,
"qwat_vl","hydrant_model_sup","description_fr",,"YES","text",,,,
"qwat_vl","hydrant_model_sup","description_en",,"YES","text",,,,
"qwat_vl","hydrant_model_sup","description_ro",,"YES","text",,,,
"qwat_vl","hydrant_model_sup","vl_active","true","YES","boolean",,,,
"qwat_vl","hydrant_model_inf","id",,"NO","integer",,"32","2",
"qwat_vl","hydrant_model_inf","short_fr",,"YES","character varying","10",,,
"qwat_vl","hydrant_model_inf","short_en",,"YES","character varying","10",,,
"qwat_vl","hydrant_model_inf","short_ro",,"YES","character varying","10",,,
"qwat_vl","hydrant_model_inf","value_fr",,"YES","character varying","50",,,
"qwat_vl","hydrant_model_inf","value_en",,"YES","character varying","50",,,
"qwat_vl","hydrant_model_inf","value_ro",,"YES","character varying","50",,,
"qwat_vl","hydrant_model_inf","description_fr",,"YES","text",,,,
"qwat_vl","hydrant_model_inf","description_en",,"YES","text",,,,
"qwat_vl","hydrant_model_inf","description_ro",,"YES","text",,,,
"qwat_vl","hydrant_model_inf","vl_active","true","YES","boolean",,,,
"qwat_vl","hydrant_material","id",,"NO","integer",,"32","2",
"qwat_vl","hydrant_material","short_fr",,"YES","character varying","10",,,
"qwat_vl","hydrant_material","short_en",,"YES","character varying","10",,,
"qwat_vl","hydrant_material","short_ro",,"YES","character varying","10",,,
"qwat_vl","hydrant_material","value_fr",,"YES","character varying","50",,,
"qwat_vl","hydrant_material","value_en",,"YES","character varying","50",,,
"qwat_vl","hydrant_material","value_ro",,"YES","character varying","50",,,
"qwat_vl","hydrant_material","description_fr",,"YES","text",,,,
"qwat_vl","hydrant_material","description_en",,"YES","text",,,,
"qwat_vl","hydrant_material","description_ro",,"YES","text",,,,
"qwat_vl","hydrant_material","vl_active","true","YES","boolean",,,,
"qwat_vl","hydrant_material","pressure_nominal",,"YES","smallint",,"16","2",
"qwat_vl","hydrant_output","id",,"NO","integer",,"32","2",
"qwat_vl","hydrant_output","short_fr",,"YES","character varying","10",,,
"qwat_vl","hydrant_output","short_en",,"YES","character varying","10",,,
"qwat_vl","hydrant_output","short_ro",,"YES","character varying","10",,,
"qwat_vl","hydrant_output","value_fr",,"YES","character varying","50",,,
"qwat_vl","hydrant_output","value_en",,"YES","character varying","50",,,
"qwat_vl","hydrant_output","value_ro",,"YES","character varying","50",,,
"qwat_vl","hydrant_output","description_fr",,"YES","text",,,,
"qwat_vl","hydrant_output","description_en",,"YES","text",,,,
"qwat_vl","hydrant_output","description_ro",,"YES","text",,,,
"qwat_vl","hydrant_output","vl_active","true","YES","boolean",,,,
"qwat_vl","hydrant_provider","id",,"NO","integer",,"32","2",
"qwat_vl","hydrant_provider","short_fr",,"YES","character varying","10",,,
"qwat_vl","hydrant_provider","short_en",,"YES","character varying","10",,,
"qwat_vl","hydrant_provider","short_ro",,"YES","character varying","10",,,
"qwat_vl","hydrant_provider","value_fr",,"YES","character varying","50",,,
"qwat_vl","hydrant_provider","value_en",,"YES","character varying","50",,,
"qwat_vl","hydrant_provider","value_ro",,"YES","character varying","50",,,
"qwat_vl","hydrant_provider","description_fr",,"YES","text",,,,
"qwat_vl","hydrant_provider","description_en",,"YES","text",,,,
"qwat_vl","hydrant_provider","description_ro",,"YES","text",,,,
"qwat_vl","hydrant_provider","vl_active","true","YES","boolean",,,,
"qwat_vl","leak_cause","id",,"NO","integer",,"32","2",
"qwat_vl","leak_cause","short_fr",,"YES","character varying","10",,,
"qwat_vl","leak_cause","short_en",,"YES","character varying","10",,,
"qwat_vl","leak_cause","short_ro",,"YES","character varying","10",,,
"qwat_vl","leak_cause","value_fr",,"YES","character varying","50",,,
"qwat_vl","leak_cause","value_en",,"YES","character varying","50",,,
"qwat_vl","leak_cause","value_ro",,"YES","character varying","50",,,
"qwat_vl","leak_cause","description_fr",,"YES","text",,,,
"qwat_vl","leak_cause","description_en",,"YES","text",,,,
"qwat_vl","leak_cause","description_ro",,"YES","text",,,,
"qwat_vl","leak_cause","vl_active","true","YES","boolean",,,,
"qwat_vl","locationtype","id",,"NO","integer",,"32","2",
"qwat_vl","locationtype","short_fr",,"YES","character varying","10",,,
"qwat_vl","locationtype","short_en",,"YES","character varying","10",,,
"qwat_vl","locationtype","short_ro",,"YES","character varying","10",,,
"qwat_vl","locationtype","value_fr",,"YES","character varying","50",,,
"qwat_vl","locationtype","value_en",,"YES","character varying","50",,,
"qwat_vl","locationtype","value_ro",,"YES","character varying","50",,,
"qwat_vl","locationtype","description_fr",,"YES","text",,,,
"qwat_vl","locationtype","description_en",,"YES","text",,,,
"qwat_vl","locationtype","description_ro",,"YES","text",,,,
"qwat_vl","locationtype","vl_active","true","YES","boolean",,,,
"qwat_vl","overflow","id",,"NO","integer",,"32","2",
"qwat_vl","overflow","short_fr",,"YES","character varying","10",,,
"qwat_vl","overflow","short_en",,"YES","character varying","10",,,
"qwat_vl","overflow","short_ro",,"YES","character varying","10",,,
"qwat_vl","overflow","value_fr",,"YES","character varying","50",,,
"qwat_vl","overflow","value_en",,"YES","character varying","50",,,
"qwat_vl","overflow","value_ro",,"YES","character varying","50",,,
"qwat_vl","overflow","description_fr",,"YES","text",,,,
"qwat_vl","overflow","description_en",,"YES","text",,,,
"qwat_vl","overflow","vl_active","true","YES","boolean",,,,
"qwat_vl","overflow","description_ro",,"YES","text",,,,
"qwat_vl","part_type","id",,"NO","integer",,"32","2",
"qwat_vl","part_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","part_type","short_en",,"YES","character varying","10",,,
"qwat_vl","part_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","part_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","part_type","value_en",,"YES","character varying","50",,,
"qwat_vl","part_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","part_type","description_fr",,"YES","text",,,,
"qwat_vl","part_type","description_en",,"YES","text",,,,
"qwat_vl","part_type","description_ro",,"YES","text",,,,
"qwat_vl","part_type","vl_active","true","YES","boolean",,,,
"qwat_vl","pipe_function","id",,"NO","integer",,"32","2",
"qwat_vl","pipe_function","short_fr",,"YES","character varying","10",,,
"qwat_vl","pipe_function","short_en",,"YES","character varying","10",,,
"qwat_vl","pipe_function","short_ro",,"YES","character varying","10",,,
"qwat_vl","pipe_function","value_fr",,"YES","character varying","50",,,
"qwat_vl","pipe_function","vl_active","true","YES","boolean",,,,
"qwat_vl","pipe_function","value_en",,"YES","character varying","50",,,
"qwat_vl","pipe_function","value_ro",,"YES","character varying","50",,,
"qwat_vl","pipe_function","description_fr",,"YES","text",,,,
"qwat_vl","pipe_function","description_en",,"YES","text",,,,
"qwat_vl","pipe_function","description_ro",,"YES","text",,,,
"qwat_vl","pipe_function","schema_visible","true","NO","boolean",,,,
"qwat_vl","pipe_function","major","true","NO","boolean",,,,
"qwat_vl","pipe_function","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","pipe_installmethod","id",,"NO","integer",,"32","2",
"qwat_vl","pipe_installmethod","short_fr",,"YES","character varying","10",,,
"qwat_vl","pipe_installmethod","short_en",,"YES","character varying","10",,,
"qwat_vl","pipe_installmethod","short_ro",,"YES","character varying","10",,,
"qwat_vl","pipe_installmethod","value_fr",,"YES","character varying","50",,,
"qwat_vl","pipe_installmethod","value_en",,"YES","character varying","50",,,
"qwat_vl","pipe_installmethod","value_ro",,"YES","character varying","50",,,
"qwat_vl","pipe_installmethod","description_fr",,"YES","text",,,,
"qwat_vl","pipe_installmethod","description_en",,"YES","text",,,,
"qwat_vl","pipe_installmethod","description_ro",,"YES","text",,,,
"qwat_vl","pipe_installmethod","vl_active","true","YES","boolean",,,,
"qwat_vl","pipe_material","id",,"NO","integer",,"32","2",
"qwat_vl","pipe_material","short_fr",,"YES","character varying","10",,,
"qwat_vl","pipe_material","short_en",,"YES","character varying","10",,,
"qwat_vl","pipe_material","short_ro",,"YES","character varying","10",,,
"qwat_vl","pipe_material","value_fr",,"YES","character varying","50",,,
"qwat_vl","pipe_material","value_en",,"YES","character varying","50",,,
"qwat_vl","pipe_material","value_ro",,"YES","character varying","50",,,
"qwat_vl","pipe_material","description_fr",,"YES","text",,,,
"qwat_vl","pipe_material","description_en",,"YES","text",,,,
"qwat_vl","pipe_material","description_ro",,"YES","text",,,,
"qwat_vl","pipe_material","vl_active","true","YES","boolean",,,,
"qwat_vl","pipe_material","_displayname_fr",,"YES","character varying","30",,,
"qwat_vl","pipe_material","_displayname_en",,"YES","character varying","30",,,
"qwat_vl","pipe_material","_displayname_ro",,"YES","character varying","30",,,
"qwat_vl","pipe_material","diameter",,"YES","character varying","10",,,
"qwat_vl","pipe_material","diameter_nominal",,"YES","smallint",,"16","2",
"qwat_vl","pipe_material","diameter_internal",,"YES","numeric",,"7","10",
"qwat_vl","pipe_material","diameter_external",,"YES","numeric",,"7","10",
"qwat_vl","pipe_material","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","pipe_material","pressure_nominal",,"YES","double precision",,"53","2",
"qwat_vl","pipe_material","sdr",,"YES","double precision",,"53","2",
"qwat_vl","pipe_material","wall_thickness",,"YES","numeric",,"4","10",
"qwat_vl","pipe_material","sn",,"YES","integer",,"32","2",
"qwat_vl","pipe_protection","id",,"NO","integer",,"32","2",
"qwat_vl","pipe_protection","short_fr",,"YES","character varying","10",,,
"qwat_vl","pipe_protection","short_en",,"YES","character varying","10",,,
"qwat_vl","pipe_protection","short_ro",,"YES","character varying","10",,,
"qwat_vl","pipe_protection","value_fr",,"YES","character varying","50",,,
"qwat_vl","pipe_protection","value_en",,"YES","character varying","50",,,
"qwat_vl","pipe_protection","value_ro",,"YES","character varying","50",,,
"qwat_vl","pipe_protection","description_fr",,"YES","text",,,,
"qwat_vl","pipe_protection","description_en",,"YES","text",,,,
"qwat_vl","pipe_protection","description_ro",,"YES","text",,,,
"qwat_vl","pipe_protection","vl_active","true","YES","boolean",,,,
"qwat_vl","precisionalti","id",,"NO","integer",,"32","2",
"qwat_vl","precisionalti","short_fr",,"YES","character varying","10",,,
"qwat_vl","precisionalti","short_en",,"YES","character varying","10",,,
"qwat_vl","precisionalti","short_ro",,"YES","character varying","10",,,
"qwat_vl","precisionalti","value_fr",,"YES","character varying","50",,,
"qwat_vl","precisionalti","vl_active","true","YES","boolean",,,,
"qwat_vl","precisionalti","value_en",,"YES","character varying","50",,,
"qwat_vl","precisionalti","value_ro",,"YES","character varying","50",,,
"qwat_vl","precisionalti","description_fr",,"YES","text",,,,
"qwat_vl","precisionalti","description_en",,"YES","text",,,,
"qwat_vl","precisionalti","description_ro",,"YES","text",,,,
"qwat_vl","precisionalti","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","precision","id",,"NO","integer",,"32","2",
"qwat_vl","precision","short_fr",,"YES","character varying","10",,,
"qwat_vl","precision","short_en",,"YES","character varying","10",,,
"qwat_vl","precision","short_ro",,"YES","character varying","10",,,
"qwat_vl","precision","value_fr",,"YES","character varying","50",,,
"qwat_vl","precision","value_en",,"YES","character varying","50",,,
"qwat_vl","precision","value_ro",,"YES","character varying","50",,,
"qwat_vl","precision","description_fr",,"YES","text",,,,
"qwat_vl","precision","description_en",,"YES","text",,,,
"qwat_vl","precision","description_ro",,"YES","text",,,,
"qwat_vl","precision","vl_active","true","YES","boolean",,,,
"qwat_vl","precision","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","pressurecontrol_type","id",,"NO","integer",,"32","2",
"qwat_vl","pressurecontrol_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","pressurecontrol_type","short_en",,"YES","character varying","10",,,
"qwat_vl","pressurecontrol_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","pressurecontrol_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","pressurecontrol_type","value_en",,"YES","character varying","50",,,
"qwat_vl","pressurecontrol_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","pressurecontrol_type","description_fr",,"YES","text",,,,
"qwat_vl","pressurecontrol_type","description_en",,"YES","text",,,,
"qwat_vl","pressurecontrol_type","description_ro",,"YES","text",,,,
"qwat_vl","pressurecontrol_type","vl_active","true","YES","boolean",,,,
"qwat_vl","protectionzone_type","id",,"NO","integer",,"32","2",
"qwat_vl","protectionzone_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","protectionzone_type","short_en",,"YES","character varying","10",,,
"qwat_vl","protectionzone_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","protectionzone_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","protectionzone_type","value_en",,"YES","character varying","50",,,
"qwat_vl","protectionzone_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","protectionzone_type","description_fr",,"YES","text",,,,
"qwat_vl","protectionzone_type","description_en",,"YES","text",,,,
"qwat_vl","protectionzone_type","description_ro",,"YES","text",,,,
"qwat_vl","protectionzone_type","vl_active","true","YES","boolean",,,,
"qwat_vl","pump_operating","id",,"NO","integer",,"32","2",
"qwat_vl","pump_operating","short_fr",,"YES","character varying","10",,,
"qwat_vl","pump_operating","short_en",,"YES","character varying","10",,,
"qwat_vl","pump_operating","short_ro",,"YES","character varying","10",,,
"qwat_vl","pump_operating","value_fr",,"YES","character varying","50",,,
"qwat_vl","pump_operating","value_en",,"YES","character varying","50",,,
"qwat_vl","pump_operating","value_ro",,"YES","character varying","50",,,
"qwat_vl","pump_operating","description_fr",,"YES","text",,,,
"qwat_vl","pump_operating","description_en",,"YES","text",,,,
"qwat_vl","pump_operating","description_ro",,"YES","text",,,,
"qwat_vl","pump_operating","vl_active","true","YES","boolean",,,,
"qwat_vl","pump_operating","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","pump_type","id",,"NO","integer",,"32","2",
"qwat_vl","pump_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","pump_type","short_en",,"YES","character varying","10",,,
"qwat_vl","pump_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","pump_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","pump_type","value_en",,"YES","character varying","50",,,
"qwat_vl","pump_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","pump_type","description_fr",,"YES","text",,,,
"qwat_vl","pump_type","description_en",,"YES","text",,,,
"qwat_vl","pump_type","description_ro",,"YES","text",,,,
"qwat_vl","pump_type","vl_active","true","YES","boolean",,,,
"qwat_vl","pump_type","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","remote_type","id",,"NO","integer",,"32","2",
"qwat_vl","remote_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","remote_type","short_en",,"YES","character varying","10",,,
"qwat_vl","remote_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","remote_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","remote_type","value_en",,"YES","character varying","50",,,
"qwat_vl","remote_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","remote_type","description_fr",,"YES","text",,,,
"qwat_vl","remote_type","description_en",,"YES","text",,,,
"qwat_vl","remote_type","description_ro",,"YES","text",,,,
"qwat_vl","remote_type","vl_active","true","YES","boolean",,,,
"qwat_vl","source_quality","id",,"NO","integer",,"32","2",
"qwat_vl","source_quality","short_fr",,"YES","character varying","10",,,
"qwat_vl","source_quality","short_en",,"YES","character varying","10",,,
"qwat_vl","source_quality","short_ro",,"YES","character varying","10",,,
"qwat_vl","source_quality","value_fr",,"YES","character varying","50",,,
"qwat_vl","source_quality","value_en",,"YES","character varying","50",,,
"qwat_vl","source_quality","value_ro",,"YES","character varying","50",,,
"qwat_vl","source_quality","description_fr",,"YES","text",,,,
"qwat_vl","source_quality","description_en",,"YES","text",,,,
"qwat_vl","source_quality","description_ro",,"YES","text",,,,
"qwat_vl","source_quality","vl_active","true","YES","boolean",,,,
"qwat_vl","source_quality","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","source_type","id",,"NO","integer",,"32","2",
"qwat_vl","source_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","source_type","short_en",,"YES","character varying","10",,,
"qwat_vl","source_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","source_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","source_type","value_en",,"YES","character varying","50",,,
"qwat_vl","source_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","source_type","description_fr",,"YES","text",,,,
"qwat_vl","source_type","description_en",,"YES","text",,,,
"qwat_vl","source_type","description_ro",,"YES","text",,,,
"qwat_vl","source_type","vl_active","true","YES","boolean",,,,
"qwat_vl","source_type","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","status","id",,"NO","integer",,"32","2",
"qwat_vl","status","short_fr",,"YES","character varying","10",,,
"qwat_vl","status","short_en",,"YES","character varying","10",,,
"qwat_vl","status","short_ro",,"YES","character varying","10",,,
"qwat_vl","status","value_fr",,"YES","character varying","50",,,
"qwat_vl","status","value_en",,"YES","character varying","50",,,
"qwat_vl","status","value_ro",,"YES","character varying","50",,,
"qwat_vl","status","description_fr",,"YES","text",,,,
"qwat_vl","status","vl_active","true","YES","boolean",,,,
"qwat_vl","status","description_en",,"YES","text",,,,
"qwat_vl","status","description_ro",,"YES","text",,,,
"qwat_vl","status","active","true","YES","boolean",,,,
"qwat_vl","status","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","subscriber_type","id",,"NO","integer",,"32","2",
"qwat_vl","subscriber_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","subscriber_type","short_en",,"YES","character varying","10",,,
"qwat_vl","subscriber_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","subscriber_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","subscriber_type","value_en",,"YES","character varying","50",,,
"qwat_vl","subscriber_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","subscriber_type","description_fr",,"YES","text",,,,
"qwat_vl","subscriber_type","description_en",,"YES","text",,,,
"qwat_vl","subscriber_type","description_ro",,"YES","text",,,,
"qwat_vl","subscriber_type","vl_active","true","YES","boolean",,,,
"qwat_vl","survey_type","id",,"NO","integer",,"32","2",
"qwat_vl","survey_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","survey_type","short_en",,"YES","character varying","10",,,
"qwat_vl","survey_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","survey_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","survey_type","value_en",,"YES","character varying","50",,,
"qwat_vl","survey_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","survey_type","description_fr",,"YES","text",,,,
"qwat_vl","survey_type","description_en",,"YES","text",,,,
"qwat_vl","survey_type","description_ro",,"YES","text",,,,
"qwat_vl","survey_type","vl_active","true","YES","boolean",,,,
"qwat_vl","survey_type","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","tank_firestorage","id",,"NO","integer",,"32","2",
"qwat_vl","tank_firestorage","short_fr",,"YES","character varying","10",,,
"qwat_vl","tank_firestorage","short_en",,"YES","character varying","10",,,
"qwat_vl","tank_firestorage","short_ro",,"YES","character varying","10",,,
"qwat_vl","tank_firestorage","value_fr",,"YES","character varying","50",,,
"qwat_vl","tank_firestorage","value_en",,"YES","character varying","50",,,
"qwat_vl","tank_firestorage","value_ro",,"YES","character varying","50",,,
"qwat_vl","tank_firestorage","description_fr",,"YES","text",,,,
"qwat_vl","tank_firestorage","description_en",,"YES","text",,,,
"qwat_vl","tank_firestorage","description_ro",,"YES","text",,,,
"qwat_vl","tank_firestorage","vl_active","true","YES","boolean",,,,
"qwat_vl","valve_actuation","id",,"NO","integer",,"32","2",
"qwat_vl","valve_actuation","short_fr",,"YES","character varying","10",,,
"qwat_vl","valve_actuation","short_en",,"YES","character varying","10",,,
"qwat_vl","valve_actuation","short_ro",,"YES","character varying","10",,,
"qwat_vl","valve_actuation","value_fr",,"YES","character varying","50",,,
"qwat_vl","valve_actuation","value_en",,"YES","character varying","50",,,
"qwat_vl","valve_actuation","value_ro",,"YES","character varying","50",,,
"qwat_vl","valve_actuation","description_fr",,"YES","text",,,,
"qwat_vl","valve_actuation","description_en",,"YES","text",,,,
"qwat_vl","valve_actuation","description_ro",,"YES","text",,,,
"qwat_vl","valve_actuation","vl_active","true","YES","boolean",,,,
"qwat_vl","valve_actuation","schema_visible","true","NO","boolean",,,,
"qwat_vl","valve_function","id",,"NO","integer",,"32","2",
"qwat_vl","valve_function","short_fr",,"YES","character varying","10",,,
"qwat_vl","valve_function","short_en",,"YES","character varying","10",,,
"qwat_vl","valve_function","short_ro",,"YES","character varying","10",,,
"qwat_vl","valve_function","value_fr",,"YES","character varying","50",,,
"qwat_vl","valve_function","value_en",,"YES","character varying","50",,,
"qwat_vl","valve_function","value_ro",,"YES","character varying","50",,,
"qwat_vl","valve_function","description_fr",,"YES","text",,,,
"qwat_vl","valve_function","description_en",,"YES","text",,,,
"qwat_vl","valve_function","description_ro",,"YES","text",,,,
"qwat_vl","valve_function","vl_active","true","YES","boolean",,,,
"qwat_vl","valve_function","schema_visible","true","NO","boolean",,,,
"qwat_vl","valve_maintenance","id",,"NO","integer",,"32","2",
"qwat_vl","valve_maintenance","short_fr",,"YES","character varying","10",,,
"qwat_vl","valve_maintenance","short_en",,"YES","character varying","10",,,
"qwat_vl","valve_maintenance","short_ro",,"YES","character varying","10",,,
"qwat_vl","valve_maintenance","value_fr",,"YES","character varying","50",,,
"qwat_vl","valve_maintenance","value_en",,"YES","character varying","50",,,
"qwat_vl","valve_maintenance","value_ro",,"YES","character varying","50",,,
"qwat_vl","valve_maintenance","description_fr",,"YES","text",,,,
"qwat_vl","valve_maintenance","description_en",,"YES","text",,,,
"qwat_vl","valve_maintenance","description_ro",,"YES","text",,,,
"qwat_vl","valve_maintenance","vl_active","true","YES","boolean",,,,
"qwat_vl","valve_maintenance","priority",,"YES","smallint",,"16","2",
"qwat_vl","valve_type","id",,"NO","integer",,"32","2",
"qwat_vl","valve_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","valve_type","short_en",,"YES","character varying","10",,,
"qwat_vl","valve_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","valve_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","valve_type","value_en",,"YES","character varying","50",,,
"qwat_vl","valve_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","valve_type","description_fr",,"YES","text",,,,
"qwat_vl","valve_type","description_en",,"YES","text",,,,
"qwat_vl","valve_type","vl_active","true","YES","boolean",,,,
"qwat_vl","valve_type","description_ro",,"YES","text",,,,
"qwat_vl","visible","id",,"NO","integer",,"32","2",
"qwat_vl","visible","short_fr",,"YES","character varying","10",,,
"qwat_vl","visible","short_en",,"YES","character varying","10",,,
"qwat_vl","visible","short_ro",,"YES","character varying","10",,,
"qwat_vl","visible","value_fr",,"YES","character varying","50",,,
"qwat_vl","visible","value_en",,"YES","character varying","50",,,
"qwat_vl","visible","value_ro",,"YES","character varying","50",,,
"qwat_vl","visible","description_fr",,"YES","text",,,,
"qwat_vl","visible","description_en",,"YES","text",,,,
"qwat_vl","visible","description_ro",,"YES","text",,,,
"qwat_vl","visible","vl_active","true","YES","boolean",,,,
"qwat_vl","visible","vl_code",,"YES","boolean",,,,
"qwat_vl","visible","vl_code_int",,"YES","smallint",,"16","2",
"qwat_vl","watertype","id",,"NO","integer",,"32","2",
"qwat_vl","watertype","short_fr",,"YES","character varying","10",,,
"qwat_vl","watertype","short_en",,"YES","character varying","10",,,
"qwat_vl","watertype","short_ro",,"YES","character varying","10",,,
"qwat_vl","watertype","value_fr",,"YES","character varying","50",,,
"qwat_vl","watertype","value_en",,"YES","character varying","50",,,
"qwat_vl","watertype","value_ro",,"YES","character varying","50",,,
"qwat_vl","watertype","description_fr",,"YES","text",,,,
"qwat_vl","watertype","description_en",,"YES","text",,,,
"qwat_vl","watertype","description_ro",,"YES","text",,,,
"qwat_vl","watertype","vl_active","true","YES","boolean",,,,
"qwat_vl","watertype","code_sire",,"YES","smallint",,"16","2",
"qwat_vl","worker_type","id",,"NO","integer",,"32","2",
"qwat_vl","worker_type","short_fr",,"YES","character varying","10",,,
"qwat_vl","worker_type","short_en",,"YES","character varying","10",,,
"qwat_vl","worker_type","short_ro",,"YES","character varying","10",,,
"qwat_vl","worker_type","value_fr",,"YES","character varying","50",,,
"qwat_vl","worker_type","value_en",,"YES","character varying","50",,,
"qwat_vl","worker_type","value_ro",,"YES","character varying","50",,,
"qwat_vl","worker_type","description_fr",,"YES","text",,,,
"qwat_vl","worker_type","description_en",,"YES","text",,,,
"qwat_vl","worker_type","description_ro",,"YES","text",,,,
"qwat_vl","worker_type","vl_active","true","YES","boolean",,,,
"qwat_dr","annotationline","id","nextval('qwat_dr.annotationline_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_dr","annotationline","labelvisible","true","NO","boolean",,,,
"qwat_dr","annotationline","text_size",,"YES","numeric",,"7","10",
"qwat_dr","annotationline","text_orientation",,"YES","numeric",,"7","10",
"qwat_dr","annotationline","annotation",,"YES","text",,,,
"qwat_dr","annotationline","scale_1","true","YES","boolean",,,,
"qwat_dr","annotationline","scale_2","true","YES","boolean",,,,
"qwat_dr","annotationline","geometry",,"YES","USER-DEFINED",,,,
"qwat_dr","annotationpoint","id","nextval('qwat_dr.annotationpoint_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_dr","annotationpoint","text_size",,"YES","numeric",,"7","10",
"qwat_dr","annotationpoint","text_orientation",,"YES","numeric",,"7","10",
"qwat_dr","annotationpoint","annotation",,"YES","text",,,,
"qwat_dr","annotationpoint","scale_1","true","YES","boolean",,,,
"qwat_dr","annotationpoint","scale_2","true","YES","boolean",,,,
"qwat_dr","annotationpoint","geometry",,"YES","USER-DEFINED",,,,
"qwat_dr","constructionpoint","id","nextval('qwat_dr.constructionpoint_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_dr","constructionpoint","altitude",,"YES","numeric",,"10","10",
"qwat_dr","constructionpoint","fk_object_reference",,"YES","integer",,"32","2",
"qwat_dr","constructionpoint","code",,"YES","character varying","15",,,
"qwat_dr","constructionpoint","measurement_campaign",,"YES","character varying","200",,,
"qwat_dr","constructionpoint","remark",,"YES","text",,,,
"qwat_dr","constructionpoint","geometry",,"YES","USER-DEFINED",,,,
"qwat_dr","dimension_distance","id","nextval('qwat_dr.dimension_distance_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_dr","dimension_distance","observation",,"YES","character varying","120",,,
"qwat_dr","dimension_distance","_calculation",,"YES","double precision",,"53","2",
"qwat_dr","dimension_distance","remark",,"YES","text",,,,
"qwat_dr","dimension_distance","geometry",,"YES","USER-DEFINED",,,,
"qwat_dr","dimension_orientation","id","nextval('qwat_dr.dimension_orientation_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_dr","dimension_orientation","observation",,"YES","character varying","120",,,
"qwat_dr","dimension_orientation","remark",,"YES","text",,,,
"qwat_dr","dimension_orientation","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","worker","id","nextval('qwat_od.worker_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","worker","last_name",,"YES","text",,,,
"qwat_od","worker","first_name",,"YES","text",,,,
"qwat_od","worker","date_entry",,"YES","date",,,,"0"
"qwat_od","worker","date_end",,"YES","date",,,,"0"
"qwat_od","worker","fk_type",,"YES","ARRAY",,,,
"qwat_od","consumptionzone","id","nextval('qwat_od.consumptionzone_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","consumptionzone","name",,"YES","character varying","50",,,
"qwat_od","consumptionzone","population","0","YES","integer",,"32","2",
"qwat_od","consumptionzone","colorcode",,"YES","smallint",,"16","2",
"qwat_od","distributor","id","nextval('qwat_od.distributor_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","distributor","name",,"YES","character varying","30",,,
"qwat_od","pressurezone","id","nextval('qwat_od.pressurezone_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","pressurezone","fk_distributor",,"NO","integer",,"32","2",
"qwat_od","pressurezone","fk_consumptionzone",,"YES","integer",,"32","2",
"qwat_od","pressurezone","name",,"NO","character varying","50",,,
"qwat_od","pressurezone","population",,"YES","integer",,"32","2",
"qwat_od","pressurezone","subscriber",,"YES","integer",,"32","2",
"qwat_od","pressurezone","colorcode",,"YES","smallint",,"16","2",
"qwat_od","pressurezone","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","pressurezone","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","pressurezone","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","pressurezone","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","pressurezone","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","pressurezone","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","pressurezone","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","pressurezone","label_1_visible","1","YES","smallint",,"16","2",
"qwat_od","pressurezone","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","pressurezone","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","pressurezone","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","pressurezone","label_1_text",,"YES","character varying","120",,,
"qwat_od","pressurezone","label_2_visible","1","YES","smallint",,"16","2",
"qwat_od","pressurezone","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","pressurezone","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","pressurezone","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","pressurezone","label_2_text",,"YES","character varying","120",,,
"qwat_od","district","id","nextval('qwat_od.district_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","district","name",,"NO","character varying","40",,,
"qwat_od","district","shortname",,"YES","character varying","12",,,
"qwat_od","district","zip",,"YES","character varying","12",,,
"qwat_od","district","land_registry",,"YES","character varying","12",,,
"qwat_od","district","prefix",,"YES","character varying","12",,,
"qwat_od","district","colorcode","1","YES","smallint",,"16","2",
"qwat_od","district","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","district","label_1_visible","1","YES","smallint",,"16","2",
"qwat_od","district","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","district","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","district","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","district","label_1_text",,"YES","character varying","120",,,
"qwat_od","district","label_2_visible","1","YES","smallint",,"16","2",
"qwat_od","district","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","district","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","district","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","district","label_2_text",,"YES","character varying","120",,,
"qwat_od","folder","id","nextval('qwat_od.folder_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","folder","identification",,"NO","character varying","50",,,
"qwat_od","folder","description",,"YES","text",,,,
"qwat_od","folder","date_start",,"YES","date",,,,"0"
"qwat_od","folder","date_end",,"YES","date",,,,"0"
"qwat_od","folder","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","folder","geometry_line",,"YES","USER-DEFINED",,,,
"qwat_od","printmap","id","nextval('qwat_od.printmap_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","printmap","name",,"YES","character varying","20",,,
"qwat_od","printmap","fk_district",,"YES","smallint",,"16","2",
"qwat_od","printmap","remark",,"YES","text",,,,
"qwat_od","printmap","version_date",,"YES","date",,,,"0"
"qwat_od","printmap","x_min",,"YES","double precision",,"53","2",
"qwat_od","printmap","y_min",,"YES","double precision",,"53","2",
"qwat_od","printmap","x_max",,"YES","double precision",,"53","2",
"qwat_od","printmap","y_max",,"YES","double precision",,"53","2",
"qwat_od","printmap","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","printmap","label_1_visible","1","YES","smallint",,"16","2",
"qwat_od","printmap","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","printmap","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","printmap","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","printmap","label_1_text",,"YES","character varying","120",,,
"qwat_od","printmap","label_2_visible","1","YES","smallint",,"16","2",
"qwat_od","printmap","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","printmap","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","printmap","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","printmap","label_2_text",,"YES","character varying","120",,,
"qwat_od","protectionzone","id","nextval('qwat_od.protectionzone_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","protectionzone","fk_type",,"YES","integer",,"32","2",
"qwat_od","protectionzone","name",,"YES","character varying","40",,,
"qwat_od","protectionzone","validated","true","YES","boolean",,,,
"qwat_od","protectionzone","date",,"YES","date",,,,"0"
"qwat_od","protectionzone","agent",,"YES","character varying","40",,,
"qwat_od","protectionzone","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","node","id","nextval('qwat_od.node_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","node","fk_district",,"YES","integer",,"32","2",
"qwat_od","node","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","node","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","node","_printmaps",,"YES","text",,,,
"qwat_od","node","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","node","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","node","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","node","_pipe_orientation","0","YES","double precision",,"53","2",
"qwat_od","node","_pipe_schema_visible","false","YES","boolean",,,,
"qwat_od","node","geometry",,"NO","USER-DEFINED",,,,
"qwat_od","node","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","node","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","node","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","node","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","network_element","id",,"NO","integer",,"32","2",
"qwat_od","network_element","identification",,"YES","character varying","50",,,
"qwat_od","network_element","fk_distributor",,"NO","integer",,"32","2",
"qwat_od","network_element","fk_status",,"NO","integer",,"32","2",
"qwat_od","network_element","fk_folder",,"YES","integer",,"32","2",
"qwat_od","network_element","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","network_element","fk_precision",,"NO","integer",,"32","2",
"qwat_od","network_element","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","network_element","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","network_element","altitude","NULL::numeric","YES","numeric",,"10","10",
"qwat_od","network_element","year",,"YES","smallint",,"16","2",
"qwat_od","network_element","year_end",,"YES","smallint",,"16","2",
"qwat_od","network_element","orientation",,"YES","double precision",,"53","2",
"qwat_od","network_element","remark",,"YES","text",,,,
"qwat_od","network_element","schema_force_visible",,"YES","boolean",,,,
"qwat_od","network_element","label_1_visible","1","YES","smallint",,"16","2",
"qwat_od","network_element","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","network_element","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","network_element","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","network_element","label_1_text",,"YES","character varying","120",,,
"qwat_od","network_element","label_2_visible","1","YES","smallint",,"16","2",
"qwat_od","network_element","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","network_element","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","network_element","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","network_element","label_2_text",,"YES","character varying","120",,,
"qwat_od","hydrant","id",,"NO","integer",,"32","2",
"qwat_od","hydrant","fk_provider",,"YES","integer",,"32","2",
"qwat_od","hydrant","fk_model_sup",,"NO","integer",,"32","2",
"qwat_od","hydrant","fk_model_inf",,"NO","integer",,"32","2",
"qwat_od","hydrant","fk_material",,"NO","integer",,"32","2",
"qwat_od","hydrant","fk_output",,"NO","integer",,"32","2",
"qwat_od","hydrant","underground","false","YES","boolean",,,,
"qwat_od","hydrant","marked","false","YES","boolean",,,,
"qwat_od","hydrant","pressure_static",,"YES","numeric",,"5","10",
"qwat_od","hydrant","pressure_dynamic",,"YES","numeric",,"5","10",
"qwat_od","hydrant","flow",,"YES","numeric",,"8","10",
"qwat_od","hydrant","observation_date",,"YES","date",,,,"0"
"qwat_od","hydrant","observation_source",,"YES","character varying","45",,,
"qwat_od","pipe","id","nextval('qwat_od.pipe_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","pipe","fk_parent",,"YES","integer",,"32","2",
"qwat_od","pipe","fk_function",,"NO","integer",,"32","2",
"qwat_od","pipe","fk_installmethod",,"NO","integer",,"32","2",
"qwat_od","pipe","fk_material",,"NO","integer",,"32","2",
"qwat_od","pipe","fk_distributor",,"NO","integer",,"32","2",
"qwat_od","pipe","fk_precision",,"NO","integer",,"32","2",
"qwat_od","pipe","fk_bedding",,"NO","integer",,"32","2",
"qwat_od","pipe","fk_protection",,"YES","integer",,"32","2",
"qwat_od","pipe","fk_status",,"NO","integer",,"32","2",
"qwat_od","pipe","fk_watertype",,"NO","integer",,"32","2",
"qwat_od","pipe","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","pipe","fk_folder",,"YES","integer",,"32","2",
"qwat_od","pipe","year",,"YES","smallint",,"16","2",
"qwat_od","pipe","year_rehabilitation",,"YES","smallint",,"16","2",
"qwat_od","pipe","year_end",,"YES","smallint",,"16","2",
"qwat_od","pipe","tunnel_or_bridge","false","YES","boolean",,,,
"qwat_od","pipe","pressure_nominal","16","YES","smallint",,"16","2",
"qwat_od","pipe","remark",,"YES","text",,,,
"qwat_od","pipe","_valve_count",,"YES","smallint",,"16","2",
"qwat_od","pipe","_valve_closed",,"YES","boolean",,,,
"qwat_od","pipe","schema_force_visible",,"YES","boolean",,,,
"qwat_od","pipe","label_1_visible","1","YES","smallint",,"16","2",
"qwat_od","pipe","label_1_text",,"YES","character varying","120",,,
"qwat_od","pipe","label_2_visible","1","YES","smallint",,"16","2",
"qwat_od","pipe","label_2_text",,"YES","character varying","120",,,
"qwat_od","pipe","fk_node_a",,"NO","integer",,"32","2",
"qwat_od","pipe","fk_node_b",,"NO","integer",,"32","2",
"qwat_od","pipe","fk_district",,"YES","integer",,"32","2",
"qwat_od","pipe","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","pipe","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","pipe","_length2d",,"YES","numeric",,"8","10",
"qwat_od","pipe","_length3d",,"YES","numeric",,"8","10",
"qwat_od","pipe","_diff_elevation",,"YES","numeric",,"8","10",
"qwat_od","pipe","_printmaps",,"YES","character varying","100",,,
"qwat_od","pipe","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","pipe","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","pipe","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","pipe","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","pipe","geometry",,"NO","USER-DEFINED",,,,
"qwat_od","pipe","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","pipe","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","crossing","_pipe1_id",,"YES","integer",,"32","2",
"qwat_od","crossing","_pipe2_id",,"YES","integer",,"32","2",
"qwat_od","crossing","_pipe1_angle",,"YES","double precision",,"53","2",
"qwat_od","crossing","_pipe2_angle",,"YES","double precision",,"53","2",
"qwat_od","crossing","id","nextval('qwat_od.crossing_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","crossing","disabled","false","NO","boolean",,,,
"qwat_od","crossing","controled","false","NO","boolean",,,,
"qwat_od","crossing","hide_pipe","1","NO","smallint",,"16","2",
"qwat_od","crossing","geometry",,"NO","USER-DEFINED",,,,
"qwat_od","part","id",,"NO","integer",,"32","2",
"qwat_od","part","fk_part_type",,"NO","integer",,"32","2",
"qwat_od","part","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","valve","id",,"NO","integer",,"32","2",
"qwat_od","valve","fk_valve_type",,"NO","integer",,"32","2",
"qwat_od","valve","fk_valve_function",,"NO","integer",,"32","2",
"qwat_od","valve","fk_valve_actuation",,"NO","integer",,"32","2",
"qwat_od","valve","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","valve","fk_handle_precision",,"YES","integer",,"32","2",
"qwat_od","valve","fk_handle_precisionalti",,"YES","integer",,"32","2",
"qwat_od","valve","fk_maintenance",,"YES","ARRAY",,,,
"qwat_od","valve","diameter_nominal",,"YES","character varying","10",,,
"qwat_od","valve","closed","false","YES","boolean",,,,
"qwat_od","valve","networkseparation","false","YES","boolean",,,,
"qwat_od","valve","handle_altitude",,"YES","numeric",,"10","10",
"qwat_od","valve","handle_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","meter","id",,"NO","integer",,"32","2",
"qwat_od","meter","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","meter","parcel",,"YES","character varying","50",,,
"qwat_od","meter_reference","id","nextval('qwat_od.meter_reference_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","meter_reference","fk_meter",,"NO","integer",,"32","2",
"qwat_od","meter_reference","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","subscriber","id",,"NO","integer",,"32","2",
"qwat_od","subscriber","fk_subscriber_type",,"NO","integer",,"32","2",
"qwat_od","subscriber","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","subscriber","parcel",,"YES","character varying","12",,,
"qwat_od","subscriber","flow_current",,"YES","numeric",,"8","10",
"qwat_od","subscriber","flow_planned",,"YES","numeric",,"8","10",
"qwat_od","subscriber_reference","id","nextval('qwat_od.subscriber_reference_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","subscriber_reference","fk_subscriber",,"NO","integer",,"32","2",
"qwat_od","subscriber_reference","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","installation","id",,"NO","integer",,"32","2",
"qwat_od","installation","name",,"YES","character varying","60",,,
"qwat_od","installation","fk_parent",,"YES","integer",,"32","2",
"qwat_od","installation","fk_remote",,"YES","integer",,"32","2",
"qwat_od","installation","fk_watertype",,"NO","integer",,"32","2",
"qwat_od","installation","parcel",,"YES","character varying","30",,,
"qwat_od","installation","eca",,"YES","character varying","30",,,
"qwat_od","installation","open_water_surface","false","YES","boolean",,,,
"qwat_od","installation","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","cover","id","nextval('qwat_od.cover_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","cover","identification",,"YES","character varying","50",,,
"qwat_od","cover","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","cover","fk_status",,"YES","integer",,"32","2",
"qwat_od","cover","fk_cover_type",,"YES","integer",,"32","2",
"qwat_od","cover","fk_installation",,"YES","integer",,"32","2",
"qwat_od","cover","year",,"YES","smallint",,"16","2",
"qwat_od","cover","altitude",,"YES","numeric",,"8","10",
"qwat_od","cover","circular","true","YES","boolean",,,,
"qwat_od","cover","form_dimension",,"YES","numeric",,"10","10",
"qwat_od","cover","remark",,"YES","text",,,,
"qwat_od","cover","geometry",,"NO","USER-DEFINED",,,,
"qwat_od","cover","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","cover","label_1_visible","1","YES","smallint",,"16","2",
"qwat_od","cover","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","cover","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","cover","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","cover","label_1_text",,"YES","character varying","120",,,
"qwat_od","cover","label_2_visible","1","YES","smallint",,"16","2",
"qwat_od","cover","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","cover","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","cover","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","cover","label_2_text",,"YES","character varying","120",,,
"qwat_od","chamber","id",,"NO","integer",,"32","2",
"qwat_od","chamber","networkseparation",,"YES","boolean",,,,
"qwat_od","chamber","flow_meter",,"YES","boolean",,,,
"qwat_od","chamber","water_meter",,"YES","boolean",,,,
"qwat_od","chamber","manometer",,"YES","boolean",,,,
"qwat_od","chamber","depth",,"YES","numeric",,"10","10",
"qwat_od","chamber","no_valves",,"YES","smallint",,"16","2",
"qwat_od","pressurecontrol","id",,"NO","integer",,"32","2",
"qwat_od","pressurecontrol","fk_pressurecontrol_type",,"NO","integer",,"32","2",
"qwat_od","pump","id",,"NO","integer",,"32","2",
"qwat_od","pump","fk_pump_type",,"YES","smallint",,"16","2",
"qwat_od","pump","fk_pipe_in",,"YES","integer",,"32","2",
"qwat_od","pump","fk_pipe_out",,"YES","integer",,"32","2",
"qwat_od","pump","fk_pump_operating",,"YES","smallint",,"16","2",
"qwat_od","pump","no_pumps",,"YES","smallint",,"16","2",
"qwat_od","pump","rejected_flow",,"YES","numeric",,"10","10",
"qwat_od","pump","manometric_height",,"YES","numeric",,"10","10",
"qwat_od","source","id",,"NO","integer",,"32","2",
"qwat_od","source","fk_source_type",,"YES","smallint",,"16","2",
"qwat_od","source","fk_source_quality",,"YES","smallint",,"16","2",
"qwat_od","source","flow_lowest",,"YES","numeric",,"10","10",
"qwat_od","source","flow_average",,"YES","numeric",,"10","10",
"qwat_od","source","flow_concession",,"YES","numeric",,"10","10",
"qwat_od","source","contract_end",,"YES","date",,,,"0"
"qwat_od","source","gathering_chamber",,"YES","boolean",,,,
"qwat_od","tank","id",,"NO","integer",,"32","2",
"qwat_od","tank","fk_overflow",,"YES","integer",,"32","2",
"qwat_od","tank","fk_tank_firestorage",,"YES","integer",,"32","2",
"qwat_od","tank","storage_total",,"YES","numeric",,"10","10",
"qwat_od","tank","storage_supply",,"YES","numeric",,"10","10",
"qwat_od","tank","storage_fire",,"YES","numeric",,"10","10",
"qwat_od","tank","altitude_overflow",,"YES","numeric",,"7","10",
"qwat_od","tank","altitude_apron",,"YES","numeric",,"7","10",
"qwat_od","tank","height_max",,"YES","numeric",,"7","10",
"qwat_od","tank","fire_valve",,"YES","boolean",,,,
"qwat_od","tank","fire_remote",,"YES","boolean",,,,
"qwat_od","tank","_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","tank","cistern1_fk_type",,"YES","integer",,"32","2",
"qwat_od","tank","cistern1_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","tank","cistern1_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","tank","cistern1_storage",,"YES","numeric",,"10","10",
"qwat_od","tank","_cistern1_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","tank","cistern2_fk_type",,"YES","integer",,"32","2",
"qwat_od","tank","cistern2_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","tank","cistern2_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","tank","cistern2_storage",,"YES","numeric",,"10","10",
"qwat_od","tank","_cistern2_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","treatment","id",,"NO","integer",,"32","2",
"qwat_od","treatment","sanitization_uv",,"YES","boolean",,,,
"qwat_od","treatment","sanitization_chlorine_liquid",,"YES","boolean",,,,
"qwat_od","treatment","sanitization_chlorine_gazeous",,"YES","boolean",,,,
"qwat_od","treatment","sanitization_ozone",,"YES","boolean",,,,
"qwat_od","treatment","filtration_membrane",,"YES","boolean",,,,
"qwat_od","treatment","filtration_sandorgravel",,"YES","boolean",,,,
"qwat_od","treatment","flocculation",,"YES","boolean",,,,
"qwat_od","treatment","activatedcharcoal",,"YES","boolean",,,,
"qwat_od","treatment","settling",,"YES","boolean",,,,
"qwat_od","treatment","treatment_capacity",,"YES","numeric",,"10","10",
"qwat_od","remote","id","nextval('qwat_od.remote_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","remote","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","remote","fk_status",,"YES","integer",,"32","2",
"qwat_od","remote","fk_precision",,"YES","integer",,"32","2",
"qwat_od","remote","fk_material",,"YES","integer",,"32","2",
"qwat_od","remote","identification",,"YES","character varying","15",,,
"qwat_od","remote","year",,"YES","smallint",,"16","2",
"qwat_od","remote","origin",,"YES","character varying","150",,,
"qwat_od","remote","destination",,"YES","character varying","150",,,
"qwat_od","remote","folder",,"YES","character varying","50",,,
"qwat_od","remote","plan",,"YES","character varying","50",,,
"qwat_od","remote","remark",,"YES","text",,,,
"qwat_od","remote","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","remote","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","remote","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","remote","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","remote","geometry",,"NO","USER-DEFINED",,,,
"qwat_od","remote","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","remote","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","remote","label_1_visible","1","YES","smallint",,"16","2",
"qwat_od","remote","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","remote","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","remote","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","remote","label_1_text",,"YES","character varying","120",,,
"qwat_od","remote","label_2_visible","1","YES","smallint",,"16","2",
"qwat_od","remote","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","remote","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","remote","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","remote","label_2_text",,"YES","character varying","120",,,
"qwat_od","samplingpoint","id",,"NO","integer",,"32","2",
"qwat_od","surveypoint","id",,"NO","integer",,"32","2",
"qwat_od","surveypoint","fk_survey_type",,"NO","integer",,"32","2",
"qwat_od","surveypoint","fk_worker",,"YES","integer",,"32","2",
"qwat_od","surveypoint","code",,"YES","character varying","50",,,
"qwat_od","surveypoint","description",,"YES","text",,,,
"qwat_od","surveypoint","date",,"YES","date",,,,"0"
"qwat_od","surveypoint","fk_folder",,"YES","integer",,"32","2",
"qwat_od","surveypoint","altitude","NULL::numeric","YES","numeric",,"10","10",
"qwat_od","surveypoint","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","leak","id","nextval('qwat_od.leak_id_seq'::regclass)","NO","integer",,"32","2",
"qwat_od","leak","fk_cause",,"NO","integer",,"32","2",
"qwat_od","leak","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","leak","widespread_damage",,"NO","boolean",,,,
"qwat_od","leak","detection_date",,"YES","date",,,,"0"
"qwat_od","leak","repair_date",,"YES","date",,,,"0"
"qwat_od","leak","_repaired",,"YES","boolean",,,,
"qwat_od","leak","address",,"YES","text",,,,
"qwat_od","leak","pipe_replaced",,"YES","boolean",,,,
"qwat_od","leak","description",,"YES","text",,,,
"qwat_od","leak","repair",,"YES","text",,,,
"qwat_od","leak","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","leak","label_1_visible","1","YES","smallint",,"16","2",
"qwat_od","leak","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","leak","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","leak","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","leak","label_1_text",,"YES","character varying","120",,,
"qwat_od","leak","label_2_visible","1","YES","smallint",,"16","2",
"qwat_od","leak","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","leak","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","leak","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","leak","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_pipe_schema_visibleitems","id",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema_visibleitems","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema_visibleitems","fk_material",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema_visibleitems","_length2d",,"YES","numeric",,"8","10",
"qwat_od","vw_pipe_schema_visibleitems","_length3d",,"YES","numeric",,"8","10",
"qwat_od","vw_pipe_schema_visibleitems","tunnel_or_bridge",,"YES","boolean",,,,
"qwat_od","vw_pipe_schema_visibleitems","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_pipe_schema_visibleitems","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_pipe_schema_visibleitems","_valve_count",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe_schema_visibleitems","_valve_closed",,"YES","boolean",,,,
"qwat_od","vw_pipe_schema_merged","id",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema_merged","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_pipe_schema_merged","number_of_pipe",,"YES","bigint",,"64","2",
"qwat_od","vw_pipe_schema_merged","_length2d",,"YES","numeric",,,"10",
"qwat_od","vw_pipe_schema_merged","_length3d",,"YES","numeric",,,"10",
"qwat_od","vw_pipe_schema_merged","tunnel_or_bridge",,"YES","boolean",,,,
"qwat_od","vw_pipe_schema_merged","_valve_count",,"YES","bigint",,"64","2",
"qwat_od","vw_pipe_schema_merged","_valve_closed",,"YES","boolean",,,,
"qwat_od","vw_pipe_schema","id",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","fk_function",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","fk_installmethod",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","fk_material",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","fk_protection",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","year",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe_schema","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe_schema","pressure_nominal",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe_schema","remark",,"YES","text",,,,
"qwat_od","vw_pipe_schema","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_pipe_schema","_printmaps",,"YES","character varying","100",,,
"qwat_od","vw_pipe_schema","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe_schema","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_pipe_schema","_length2d",,"YES","numeric",,,"10",
"qwat_od","vw_pipe_schema","_length3d",,"YES","numeric",,,"10",
"qwat_od","vw_pipe_schema","number_of_pipe",,"YES","bigint",,"64","2",
"qwat_od","vw_pipe_schema","tunnel_or_bridge",,"YES","boolean",,,,
"qwat_od","vw_pipe_schema","_valve_count",,"YES","bigint",,"64","2",
"qwat_od","vw_pipe_schema","_valve_closed",,"YES","boolean",,,,
"qwat_od","vw_pipe_schema","_pressurezone",,"YES","character varying","50",,,
"qwat_od","vw_pipe_schema","_pressurezone_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe_schema","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_pipe_schema_error","groupid",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_schema_error","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_pipe_schema_error","error_desc",,"YES","character varying",,,,
"qwat_od","vw_installation_source","id",,"YES","integer",,"32","2",
"qwat_od","vw_installation_source","name",,"YES","character varying","60",,,
"qwat_od","vw_installation_source","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_installation_source","fk_remote",,"YES","integer",,"32","2",
"qwat_od","vw_installation_source","fk_watertype",,"YES","integer",,"32","2",
"qwat_od","vw_installation_source","parcel",,"YES","character varying","30",,,
"qwat_od","vw_installation_source","eca",,"YES","character varying","30",,,
"qwat_od","vw_installation_source","open_water_surface",,"YES","boolean",,,,
"qwat_od","vw_installation_source","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_installation_source","fk_source_type",,"YES","smallint",,"16","2",
"qwat_od","vw_installation_source","fk_source_quality",,"YES","smallint",,"16","2",
"qwat_od","vw_installation_source","flow_lowest",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_source","flow_average",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_source","flow_concession",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_source","contract_end",,"YES","date",,,,"0"
"qwat_od","vw_installation_source","gathering_chamber",,"YES","boolean",,,,
"qwat_od","vw_installation_pump","id",,"YES","integer",,"32","2",
"qwat_od","vw_installation_pump","name",,"YES","character varying","60",,,
"qwat_od","vw_installation_pump","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_installation_pump","fk_remote",,"YES","integer",,"32","2",
"qwat_od","vw_installation_pump","fk_watertype",,"YES","integer",,"32","2",
"qwat_od","vw_installation_pump","parcel",,"YES","character varying","30",,,
"qwat_od","vw_installation_pump","eca",,"YES","character varying","30",,,
"qwat_od","vw_installation_pump","open_water_surface",,"YES","boolean",,,,
"qwat_od","vw_installation_pump","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_installation_pump","fk_pump_type",,"YES","smallint",,"16","2",
"qwat_od","vw_installation_pump","fk_pipe_in",,"YES","integer",,"32","2",
"qwat_od","vw_installation_pump","fk_pipe_out",,"YES","integer",,"32","2",
"qwat_od","vw_installation_pump","fk_pump_operating",,"YES","smallint",,"16","2",
"qwat_od","vw_installation_pump","no_pumps",,"YES","smallint",,"16","2",
"qwat_od","vw_installation_pump","rejected_flow",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_pump","manometric_height",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_tank","id",,"YES","integer",,"32","2",
"qwat_od","vw_installation_tank","name",,"YES","character varying","60",,,
"qwat_od","vw_installation_tank","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_installation_tank","fk_remote",,"YES","integer",,"32","2",
"qwat_od","vw_installation_tank","fk_watertype",,"YES","integer",,"32","2",
"qwat_od","vw_installation_tank","parcel",,"YES","character varying","30",,,
"qwat_od","vw_installation_tank","eca",,"YES","character varying","30",,,
"qwat_od","vw_installation_tank","open_water_surface",,"YES","boolean",,,,
"qwat_od","vw_installation_tank","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_installation_tank","fk_overflow",,"YES","integer",,"32","2",
"qwat_od","vw_installation_tank","fk_tank_firestorage",,"YES","integer",,"32","2",
"qwat_od","vw_installation_tank","storage_total",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_tank","storage_supply",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_tank","storage_fire",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_tank","altitude_overflow",,"YES","numeric",,"7","10",
"qwat_od","vw_installation_tank","altitude_apron",,"YES","numeric",,"7","10",
"qwat_od","vw_installation_tank","height_max",,"YES","numeric",,"7","10",
"qwat_od","vw_installation_tank","fire_valve",,"YES","boolean",,,,
"qwat_od","vw_installation_tank","fire_remote",,"YES","boolean",,,,
"qwat_od","vw_installation_tank","_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_installation_tank","cistern1_fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_installation_tank","cistern1_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_tank","cistern1_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_tank","cistern1_storage",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_tank","_cistern1_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_installation_tank","cistern2_fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_installation_tank","cistern2_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_tank","cistern2_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_tank","cistern2_storage",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_tank","_cistern2_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_installation_treatment","id",,"YES","integer",,"32","2",
"qwat_od","vw_installation_treatment","name",,"YES","character varying","60",,,
"qwat_od","vw_installation_treatment","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_installation_treatment","fk_remote",,"YES","integer",,"32","2",
"qwat_od","vw_installation_treatment","fk_watertype",,"YES","integer",,"32","2",
"qwat_od","vw_installation_treatment","parcel",,"YES","character varying","30",,,
"qwat_od","vw_installation_treatment","eca",,"YES","character varying","30",,,
"qwat_od","vw_installation_treatment","open_water_surface",,"YES","boolean",,,,
"qwat_od","vw_installation_treatment","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_installation_treatment","sanitization_uv",,"YES","boolean",,,,
"qwat_od","vw_installation_treatment","sanitization_chlorine_liquid",,"YES","boolean",,,,
"qwat_od","vw_installation_treatment","sanitization_chlorine_gazeous",,"YES","boolean",,,,
"qwat_od","vw_installation_treatment","sanitization_ozone",,"YES","boolean",,,,
"qwat_od","vw_installation_treatment","filtration_membrane",,"YES","boolean",,,,
"qwat_od","vw_installation_treatment","filtration_sandorgravel",,"YES","boolean",,,,
"qwat_od","vw_installation_treatment","flocculation",,"YES","boolean",,,,
"qwat_od","vw_installation_treatment","activatedcharcoal",,"YES","boolean",,,,
"qwat_od","vw_installation_treatment","settling",,"YES","boolean",,,,
"qwat_od","vw_installation_treatment","treatment_capacity",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_chamber","id",,"YES","integer",,"32","2",
"qwat_od","vw_installation_chamber","name",,"YES","character varying","60",,,
"qwat_od","vw_installation_chamber","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_installation_chamber","fk_remote",,"YES","integer",,"32","2",
"qwat_od","vw_installation_chamber","fk_watertype",,"YES","integer",,"32","2",
"qwat_od","vw_installation_chamber","parcel",,"YES","character varying","30",,,
"qwat_od","vw_installation_chamber","eca",,"YES","character varying","30",,,
"qwat_od","vw_installation_chamber","open_water_surface",,"YES","boolean",,,,
"qwat_od","vw_installation_chamber","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_installation_chamber","networkseparation",,"YES","boolean",,,,
"qwat_od","vw_installation_chamber","flow_meter",,"YES","boolean",,,,
"qwat_od","vw_installation_chamber","water_meter",,"YES","boolean",,,,
"qwat_od","vw_installation_chamber","manometer",,"YES","boolean",,,,
"qwat_od","vw_installation_chamber","depth",,"YES","numeric",,"10","10",
"qwat_od","vw_installation_chamber","no_valves",,"YES","smallint",,"16","2",
"qwat_od","vw_installation_pressurecontrol","id",,"YES","integer",,"32","2",
"qwat_od","vw_installation_pressurecontrol","name",,"YES","character varying","60",,,
"qwat_od","vw_installation_pressurecontrol","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_installation_pressurecontrol","fk_remote",,"YES","integer",,"32","2",
"qwat_od","vw_installation_pressurecontrol","fk_watertype",,"YES","integer",,"32","2",
"qwat_od","vw_installation_pressurecontrol","parcel",,"YES","character varying","30",,,
"qwat_od","vw_installation_pressurecontrol","eca",,"YES","character varying","30",,,
"qwat_od","vw_installation_pressurecontrol","open_water_surface",,"YES","boolean",,,,
"qwat_od","vw_installation_pressurecontrol","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_installation_pressurecontrol","fk_pressurecontrol_type",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","installation_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_installation","id",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","name",,"YES","character varying","60",,,
"qwat_od","vw_qwat_installation","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","fk_remote",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","fk_watertype",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","parcel",,"YES","character varying","30",,,
"qwat_od","vw_qwat_installation","eca",,"YES","character varying","30",,,
"qwat_od","vw_qwat_installation","open_water_surface",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_installation","fk_source_type",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_installation","fk_source_quality",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_installation","flow_lowest",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","flow_average",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","flow_concession",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","contract_end",,"YES","date",,,,"0"
"qwat_od","vw_qwat_installation","gathering_chamber",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","fk_pump_type",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_installation","fk_pipe_in",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","fk_pipe_out",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","fk_pump_operating",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_installation","no_pumps",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_installation","rejected_flow",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","manometric_height",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","fk_overflow",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","fk_tank_firestorage",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","storage_total",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","storage_supply",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","storage_fire",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","altitude_overflow",,"YES","numeric",,"7","10",
"qwat_od","vw_qwat_installation","altitude_apron",,"YES","numeric",,"7","10",
"qwat_od","vw_qwat_installation","height_max",,"YES","numeric",,"7","10",
"qwat_od","vw_qwat_installation","fire_valve",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","fire_remote",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_qwat_installation","cistern1_fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","cistern1_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","cistern1_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","cistern1_storage",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","_cistern1_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_qwat_installation","cistern2_fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_installation","cistern2_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","cistern2_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","cistern2_storage",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","_cistern2_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_qwat_installation","sanitization_uv",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","sanitization_chlorine_liquid",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","sanitization_chlorine_gazeous",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","sanitization_ozone",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","filtration_membrane",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","filtration_sandorgravel",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","flocculation",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","activatedcharcoal",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","settling",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","treatment_capacity",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","networkseparation",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","flow_meter",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","water_meter",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","manometer",,"YES","boolean",,,,
"qwat_od","vw_qwat_installation","depth",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_installation","no_valves",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_installation","fk_pressurecontrol_type",,"YES","integer",,"32","2",
"qwat_od","vw_node_element","id",,"YES","integer",,"32","2",
"qwat_od","vw_node_element","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_node_element","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_node_element","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_node_element","_printmaps",,"YES","text",,,,
"qwat_od","vw_node_element","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_node_element","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_node_element","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_node_element","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_node_element","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_node_element","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_node_element","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_node_element","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_node_element","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_node_element","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_node_element","identification",,"YES","character varying","50",,,
"qwat_od","vw_node_element","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_node_element","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_node_element","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_node_element","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_node_element","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_node_element","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_node_element","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_node_element","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_node_element","year",,"YES","smallint",,"16","2",
"qwat_od","vw_node_element","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_node_element","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_node_element","remark",,"YES","text",,,,
"qwat_od","vw_node_element","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_node_element","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_node_element","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_node_element","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_node_element","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_node_element","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_node_element","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_node_element","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_node_element","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_node_element","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_node_element","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_qwat_node","node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_node","id",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_node","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_node","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_node","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_qwat_node","_printmaps",,"YES","text",,,,
"qwat_od","vw_qwat_node","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_qwat_node","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_qwat_node","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_node","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_node","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_qwat_node","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_node","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_node","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_node","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_qwat_node","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_qwat_node","identification",,"YES","character varying","50",,,
"qwat_od","vw_qwat_node","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_node","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_node","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_node","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_qwat_node","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_node","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_node","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_node","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_node","year",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_node","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_node","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_node","remark",,"YES","text",,,,
"qwat_od","vw_qwat_node","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_qwat_node","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_node","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_node","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_node","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_node","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_qwat_node","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_node","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_node","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_node","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_node","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_element_subscriber","id",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_element_subscriber","_printmaps",,"YES","text",,,,
"qwat_od","vw_element_subscriber","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_element_subscriber","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_element_subscriber","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_subscriber","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_subscriber","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_element_subscriber","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_subscriber","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_subscriber","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_subscriber","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_element_subscriber","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_element_subscriber","identification",,"YES","character varying","50",,,
"qwat_od","vw_element_subscriber","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_element_subscriber","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_element_subscriber","year",,"YES","smallint",,"16","2",
"qwat_od","vw_element_subscriber","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_element_subscriber","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_subscriber","remark",,"YES","text",,,,
"qwat_od","vw_element_subscriber","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_element_subscriber","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_subscriber","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_subscriber","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_subscriber","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_subscriber","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_element_subscriber","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_subscriber","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_subscriber","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_subscriber","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_subscriber","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_element_subscriber","fk_subscriber_type",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","vw_element_subscriber","parcel",,"YES","character varying","12",,,
"qwat_od","vw_element_subscriber","flow_current",,"YES","numeric",,"8","10",
"qwat_od","vw_element_subscriber","flow_planned",,"YES","numeric",,"8","10",
"qwat_od","vw_element_part","id",,"YES","integer",,"32","2",
"qwat_od","vw_element_part","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_element_part","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_element_part","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_element_part","_printmaps",,"YES","text",,,,
"qwat_od","vw_element_part","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_element_part","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_element_part","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_part","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_part","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_element_part","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_part","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_part","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_part","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_element_part","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_element_part","identification",,"YES","character varying","50",,,
"qwat_od","vw_element_part","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_element_part","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_element_part","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_element_part","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_element_part","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_element_part","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_element_part","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_element_part","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_element_part","year",,"YES","smallint",,"16","2",
"qwat_od","vw_element_part","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_element_part","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_part","remark",,"YES","text",,,,
"qwat_od","vw_element_part","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_element_part","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_part","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_part","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_part","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_part","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_element_part","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_part","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_part","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_part","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_part","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_element_part","fk_part_type",,"YES","integer",,"32","2",
"qwat_od","vw_element_part","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","id",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_element_installation","_printmaps",,"YES","text",,,,
"qwat_od","vw_element_installation","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_element_installation","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_element_installation","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_installation","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_installation","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_element_installation","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_installation","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_installation","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_installation","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_element_installation","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_element_installation","identification",,"YES","character varying","50",,,
"qwat_od","vw_element_installation","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_element_installation","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","year",,"YES","smallint",,"16","2",
"qwat_od","vw_element_installation","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_element_installation","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_installation","remark",,"YES","text",,,,
"qwat_od","vw_element_installation","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_element_installation","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_installation","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_installation","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_installation","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_installation","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_element_installation","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_installation","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_installation","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_installation","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_installation","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_element_installation","installation_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_installation","name",,"YES","character varying","60",,,
"qwat_od","vw_element_installation","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_remote",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_watertype",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","parcel",,"YES","character varying","30",,,
"qwat_od","vw_element_installation","eca",,"YES","character varying","30",,,
"qwat_od","vw_element_installation","open_water_surface",,"YES","boolean",,,,
"qwat_od","vw_element_installation","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_installation","fk_source_type",,"YES","smallint",,"16","2",
"qwat_od","vw_element_installation","fk_source_quality",,"YES","smallint",,"16","2",
"qwat_od","vw_element_installation","flow_lowest",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","flow_average",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","flow_concession",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","contract_end",,"YES","date",,,,"0"
"qwat_od","vw_element_installation","gathering_chamber",,"YES","boolean",,,,
"qwat_od","vw_element_installation","fk_pump_type",,"YES","smallint",,"16","2",
"qwat_od","vw_element_installation","fk_pipe_in",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_pipe_out",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_pump_operating",,"YES","smallint",,"16","2",
"qwat_od","vw_element_installation","no_pumps",,"YES","smallint",,"16","2",
"qwat_od","vw_element_installation","rejected_flow",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","manometric_height",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","fk_overflow",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","fk_tank_firestorage",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","storage_total",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","storage_supply",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","storage_fire",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","altitude_overflow",,"YES","numeric",,"7","10",
"qwat_od","vw_element_installation","altitude_apron",,"YES","numeric",,"7","10",
"qwat_od","vw_element_installation","height_max",,"YES","numeric",,"7","10",
"qwat_od","vw_element_installation","fire_valve",,"YES","boolean",,,,
"qwat_od","vw_element_installation","fire_remote",,"YES","boolean",,,,
"qwat_od","vw_element_installation","_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_element_installation","cistern1_fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","cistern1_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","cistern1_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","cistern1_storage",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","_cistern1_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_element_installation","cistern2_fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_element_installation","cistern2_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","cistern2_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","cistern2_storage",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","_cistern2_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_element_installation","sanitization_uv",,"YES","boolean",,,,
"qwat_od","vw_element_installation","sanitization_chlorine_liquid",,"YES","boolean",,,,
"qwat_od","vw_element_installation","sanitization_chlorine_gazeous",,"YES","boolean",,,,
"qwat_od","vw_element_installation","sanitization_ozone",,"YES","boolean",,,,
"qwat_od","vw_element_installation","filtration_membrane",,"YES","boolean",,,,
"qwat_od","vw_element_installation","filtration_sandorgravel",,"YES","boolean",,,,
"qwat_od","vw_element_installation","flocculation",,"YES","boolean",,,,
"qwat_od","vw_element_installation","activatedcharcoal",,"YES","boolean",,,,
"qwat_od","vw_element_installation","settling",,"YES","boolean",,,,
"qwat_od","vw_element_installation","treatment_capacity",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","networkseparation",,"YES","boolean",,,,
"qwat_od","vw_element_installation","flow_meter",,"YES","boolean",,,,
"qwat_od","vw_element_installation","water_meter",,"YES","boolean",,,,
"qwat_od","vw_element_installation","manometer",,"YES","boolean",,,,
"qwat_od","vw_element_installation","depth",,"YES","numeric",,"10","10",
"qwat_od","vw_element_installation","no_valves",,"YES","smallint",,"16","2",
"qwat_od","vw_element_installation","fk_pressurecontrol_type",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","id",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_element_hydrant","_printmaps",,"YES","text",,,,
"qwat_od","vw_element_hydrant","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_element_hydrant","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_element_hydrant","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_hydrant","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_hydrant","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_element_hydrant","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_hydrant","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_hydrant","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_hydrant","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_element_hydrant","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_element_hydrant","identification",,"YES","character varying","50",,,
"qwat_od","vw_element_hydrant","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_element_hydrant","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_element_hydrant","year",,"YES","smallint",,"16","2",
"qwat_od","vw_element_hydrant","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_element_hydrant","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_hydrant","remark",,"YES","text",,,,
"qwat_od","vw_element_hydrant","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_element_hydrant","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_hydrant","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_hydrant","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_hydrant","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_hydrant","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_element_hydrant","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_hydrant","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_hydrant","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_hydrant","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_hydrant","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_element_hydrant","fk_provider",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_model_sup",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_model_inf",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_material",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","fk_output",,"YES","integer",,"32","2",
"qwat_od","vw_element_hydrant","underground",,"YES","boolean",,,,
"qwat_od","vw_element_hydrant","marked",,"YES","boolean",,,,
"qwat_od","vw_element_hydrant","pressure_static",,"YES","numeric",,"5","10",
"qwat_od","vw_element_hydrant","pressure_dynamic",,"YES","numeric",,"5","10",
"qwat_od","vw_element_hydrant","flow",,"YES","numeric",,"8","10",
"qwat_od","vw_element_hydrant","observation_date",,"YES","date",,,,"0"
"qwat_od","vw_element_hydrant","observation_source",,"YES","character varying","45",,,
"qwat_od","vw_element_samplingpoint","id",,"YES","integer",,"32","2",
"qwat_od","vw_element_samplingpoint","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_element_samplingpoint","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_element_samplingpoint","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_element_samplingpoint","_printmaps",,"YES","text",,,,
"qwat_od","vw_element_samplingpoint","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_element_samplingpoint","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_element_samplingpoint","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_samplingpoint","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_samplingpoint","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_element_samplingpoint","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_samplingpoint","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_samplingpoint","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_samplingpoint","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_element_samplingpoint","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_element_samplingpoint","identification",,"YES","character varying","50",,,
"qwat_od","vw_element_samplingpoint","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_element_samplingpoint","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_element_samplingpoint","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_element_samplingpoint","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_element_samplingpoint","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_element_samplingpoint","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_element_samplingpoint","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_element_samplingpoint","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_element_samplingpoint","year",,"YES","smallint",,"16","2",
"qwat_od","vw_element_samplingpoint","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_element_samplingpoint","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_samplingpoint","remark",,"YES","text",,,,
"qwat_od","vw_element_samplingpoint","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_element_samplingpoint","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_samplingpoint","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_samplingpoint","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_samplingpoint","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_samplingpoint","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_element_samplingpoint","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_samplingpoint","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_samplingpoint","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_samplingpoint","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_samplingpoint","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_element_valve","id",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_element_valve","_printmaps",,"YES","text",,,,
"qwat_od","vw_element_valve","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_element_valve","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_element_valve","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_valve","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_valve","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_element_valve","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_valve","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_valve","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_valve","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_element_valve","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_element_valve","identification",,"YES","character varying","50",,,
"qwat_od","vw_element_valve","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_element_valve","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_element_valve","year",,"YES","smallint",,"16","2",
"qwat_od","vw_element_valve","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_element_valve","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_valve","remark",,"YES","text",,,,
"qwat_od","vw_element_valve","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_element_valve","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_valve","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_valve","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_valve","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_valve","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_element_valve","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_valve","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_valve","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_valve","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_valve","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_element_valve","fk_valve_type",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_valve_function",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_valve_actuation",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_handle_precision",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_handle_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_element_valve","fk_maintenance",,"YES","ARRAY",,,,
"qwat_od","vw_element_valve","diameter_nominal",,"YES","character varying","10",,,
"qwat_od","vw_element_valve","closed",,"YES","boolean",,,,
"qwat_od","vw_element_valve","networkseparation",,"YES","boolean",,,,
"qwat_od","vw_element_valve","handle_altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_element_valve","handle_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_meter","id",,"YES","integer",,"32","2",
"qwat_od","vw_element_meter","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_element_meter","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_element_meter","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_element_meter","_printmaps",,"YES","text",,,,
"qwat_od","vw_element_meter","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_element_meter","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_element_meter","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_meter","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_meter","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_element_meter","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_meter","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_meter","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_element_meter","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_element_meter","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_element_meter","identification",,"YES","character varying","50",,,
"qwat_od","vw_element_meter","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_element_meter","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_element_meter","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_element_meter","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_element_meter","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_element_meter","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_element_meter","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_element_meter","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_element_meter","year",,"YES","smallint",,"16","2",
"qwat_od","vw_element_meter","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_element_meter","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_meter","remark",,"YES","text",,,,
"qwat_od","vw_element_meter","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_element_meter","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_meter","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_meter","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_meter","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_meter","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_element_meter","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_element_meter","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_element_meter","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_element_meter","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_element_meter","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_element_meter","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","vw_element_meter","parcel",,"YES","character varying","50",,,
"qwat_od","vw_qwat_network_element","element_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_network_element","id",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_qwat_network_element","_printmaps",,"YES","text",,,,
"qwat_od","vw_qwat_network_element","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_network_element","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_network_element","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_network_element","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_network_element","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_network_element","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","identification",,"YES","character varying","50",,,
"qwat_od","vw_qwat_network_element","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_qwat_network_element","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","year",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_network_element","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_network_element","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_network_element","remark",,"YES","text",,,,
"qwat_od","vw_qwat_network_element","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_network_element","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_network_element","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_network_element","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_network_element","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_qwat_network_element","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_network_element","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_network_element","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_network_element","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_qwat_network_element","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_qwat_network_element","networkseparation",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","parcel",,"YES","character varying",,,,
"qwat_od","vw_qwat_network_element","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_subscriber_type",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","flow_current",,"YES","numeric",,"8","10",
"qwat_od","vw_qwat_network_element","flow_planned",,"YES","numeric",,"8","10",
"qwat_od","vw_qwat_network_element","fk_part_type",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","installation_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_network_element","name",,"YES","character varying","60",,,
"qwat_od","vw_qwat_network_element","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_remote",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_watertype",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","eca",,"YES","character varying","30",,,
"qwat_od","vw_qwat_network_element","open_water_surface",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_qwat_network_element","fk_source_type",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_network_element","fk_source_quality",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_network_element","flow_lowest",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","flow_average",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","flow_concession",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","contract_end",,"YES","date",,,,"0"
"qwat_od","vw_qwat_network_element","gathering_chamber",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","fk_pump_type",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_network_element","fk_pipe_in",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_pipe_out",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_pump_operating",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_network_element","no_pumps",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_network_element","rejected_flow",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","manometric_height",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","fk_overflow",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_tank_firestorage",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","storage_total",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","storage_supply",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","storage_fire",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","altitude_overflow",,"YES","numeric",,"7","10",
"qwat_od","vw_qwat_network_element","altitude_apron",,"YES","numeric",,"7","10",
"qwat_od","vw_qwat_network_element","height_max",,"YES","numeric",,"7","10",
"qwat_od","vw_qwat_network_element","fire_valve",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","fire_remote",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_qwat_network_element","cistern1_fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","cistern1_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","cistern1_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","cistern1_storage",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","_cistern1_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_qwat_network_element","cistern2_fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","cistern2_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","cistern2_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","cistern2_storage",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","_cistern2_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_qwat_network_element","sanitization_uv",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","sanitization_chlorine_liquid",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","sanitization_chlorine_gazeous",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","sanitization_ozone",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","filtration_membrane",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","filtration_sandorgravel",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","flocculation",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","activatedcharcoal",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","settling",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","treatment_capacity",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","flow_meter",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","water_meter",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","manometer",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","depth",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","no_valves",,"YES","smallint",,"16","2",
"qwat_od","vw_qwat_network_element","fk_pressurecontrol_type",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_provider",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_model_sup",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_model_inf",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_material",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_output",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","underground",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","marked",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","pressure_static",,"YES","numeric",,"5","10",
"qwat_od","vw_qwat_network_element","pressure_dynamic",,"YES","numeric",,"5","10",
"qwat_od","vw_qwat_network_element","flow",,"YES","numeric",,"8","10",
"qwat_od","vw_qwat_network_element","observation_date",,"YES","date",,,,"0"
"qwat_od","vw_qwat_network_element","observation_source",,"YES","character varying","45",,,
"qwat_od","vw_qwat_network_element","fk_valve_type",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_valve_function",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_valve_actuation",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_handle_precision",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_handle_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_qwat_network_element","fk_maintenance",,"YES","ARRAY",,,,
"qwat_od","vw_qwat_network_element","diameter_nominal",,"YES","character varying","10",,,
"qwat_od","vw_qwat_network_element","closed",,"YES","boolean",,,,
"qwat_od","vw_qwat_network_element","handle_altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_qwat_network_element","handle_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_remote","distributor",,"YES","character varying","30",,,
"qwat_od","vw_remote","status",,"YES","character varying","50",,,
"qwat_od","vw_remote","precision",,"YES","character varying","50",,,
"qwat_od","vw_remote","material",,"YES","character varying","30",,,
"qwat_od","vw_remote","identification",,"YES","character varying","15",,,
"qwat_od","vw_remote","year",,"YES","smallint",,"16","2",
"qwat_od","vw_remote","origin",,"YES","character varying","150",,,
"qwat_od","vw_remote","destination",,"YES","character varying","150",,,
"qwat_od","vw_remote","folder",,"YES","character varying","50",,,
"qwat_od","vw_remote","plan",,"YES","character varying","50",,,
"qwat_od","vw_remote","remark",,"YES","text",,,,
"qwat_od","vw_remote","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_remote","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_remote","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_remote","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_remote","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_remote","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_remote","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_remote","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_remote","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_remote","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_remote","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_pipe","id",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_function",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_installmethod",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_material",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_protection",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_pipe","year",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe","tunnel_or_bridge",,"YES","boolean",,,,
"qwat_od","vw_pipe","pressure_nominal",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_pipe","remark",,"YES","text",,,,
"qwat_od","vw_pipe","_valve_count",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe","_valve_closed",,"YES","boolean",,,,
"qwat_od","vw_pipe","fk_node_a",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_node_b",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_pipe","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_pipe","_length2d",,"YES","numeric",,"8","10",
"qwat_od","vw_pipe","_length3d",,"YES","numeric",,"8","10",
"qwat_od","vw_pipe","_diff_elevation",,"YES","numeric",,"8","10",
"qwat_od","vw_pipe","_printmaps",,"YES","character varying","100",,,
"qwat_od","vw_pipe","st_force2d",,"YES","USER-DEFINED",,,,
"qwat_od","vw_pipe","_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_pipe","_function",,"YES","character varying","50",,,
"qwat_od","vw_pipe","_function_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe","_installmethod",,"YES","character varying","50",,,
"qwat_od","vw_pipe","_material_name",,"YES","character varying","30",,,
"qwat_od","vw_pipe","_material_longname",,"YES","character varying","50",,,
"qwat_od","vw_pipe","_material_diameter",,"YES","character varying","10",,,
"qwat_od","vw_pipe","_material_diameter_internal",,"YES","numeric",,"7","10",
"qwat_od","vw_pipe","_material_diameter_external",,"YES","numeric",,"7","10",
"qwat_od","vw_pipe","_material_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe","_distributor",,"YES","character varying","30",,,
"qwat_od","vw_pipe","_precision",,"YES","character varying","50",,,
"qwat_od","vw_pipe","_protection",,"YES","character varying","50",,,
"qwat_od","vw_pipe","_status",,"YES","character varying","50",,,
"qwat_od","vw_pipe","_status_active",,"YES","boolean",,,,
"qwat_od","vw_pipe","_pressurezone",,"YES","character varying","50",,,
"qwat_od","vw_pipe","_pressurezone_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_pipe","folder",,"YES","character varying","50",,,
"qwat_od","vw_leak","cause",,"YES","character varying","50",,,
"qwat_od","vw_leak","widespread_damage",,"YES","boolean",,,,
"qwat_od","vw_leak","detection_date",,"YES","date",,,,"0"
"qwat_od","vw_leak","repair_date",,"YES","date",,,,"0"
"qwat_od","vw_leak","_repaired",,"YES","boolean",,,,
"qwat_od","vw_leak","address",,"YES","text",,,,
"qwat_od","vw_leak","pipe_replaced",,"YES","boolean",,,,
"qwat_od","vw_leak","description",,"YES","text",,,,
"qwat_od","vw_leak","repair",,"YES","text",,,,
"qwat_od","vw_leak","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_consumptionzone","id",,"YES","integer",,"32","2",
"qwat_od","vw_consumptionzone","name",,"YES","character varying","50",,,
"qwat_od","vw_consumptionzone","population",,"YES","integer",,"32","2",
"qwat_od","vw_consumptionzone","colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_consumptionzone","_sum_population",,"YES","bigint",,"64","2",
"qwat_od","vw_consumptionzone","_sum_subscriber",,"YES","bigint",,"64","2",
"qwat_od","vw_consumptionzone","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_printmap","id",,"YES","integer",,"32","2",
"qwat_od","vw_printmap","name",,"YES","character varying","20",,,
"qwat_od","vw_printmap","fk_district",,"YES","smallint",,"16","2",
"qwat_od","vw_printmap","remark",,"YES","text",,,,
"qwat_od","vw_printmap","version_date",,"YES","date",,,,"0"
"qwat_od","vw_printmap","x_min",,"YES","double precision",,"53","2",
"qwat_od","vw_printmap","y_min",,"YES","double precision",,"53","2",
"qwat_od","vw_printmap","x_max",,"YES","double precision",,"53","2",
"qwat_od","vw_printmap","y_max",,"YES","double precision",,"53","2",
"qwat_od","vw_printmap","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_printmap","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_printmap","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_printmap","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_printmap","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_printmap","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_printmap","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_printmap","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_printmap","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_printmap","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_printmap","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_printmap","_longname",,"YES","text",,,,
"qwat_od","vw_printmap","_district",,"YES","character varying","40",,,
"qwat_od","vw_printmap","_district_short",,"YES","character varying","12",,,
"qwat_od","vw_protectionzone","id",,"YES","integer",,"32","2",
"qwat_od","vw_protectionzone","fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_protectionzone","name",,"YES","character varying","40",,,
"qwat_od","vw_protectionzone","validated",,"YES","boolean",,,,
"qwat_od","vw_protectionzone","date",,"YES","date",,,,"0"
"qwat_od","vw_protectionzone","agent",,"YES","character varying","40",,,
"qwat_od","vw_protectionzone","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_protectionzone","_type_long",,"YES","character varying","50",,,
"qwat_od","vw_protectionzone","_type",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","id",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_export_installation","_printmaps",,"YES","text",,,,
"qwat_od","vw_export_installation","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_installation","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_installation","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_export_installation","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_installation","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_installation","identification",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_export_installation","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","year",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","remark",,"YES","text",,,,
"qwat_od","vw_export_installation","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_export_installation","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_installation","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_installation","installation_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","name",,"YES","character varying","60",,,
"qwat_od","vw_export_installation","fk_parent",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_remote",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_watertype",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","parcel",,"YES","character varying","30",,,
"qwat_od","vw_export_installation","eca",,"YES","character varying","30",,,
"qwat_od","vw_export_installation","open_water_surface",,"YES","boolean",,,,
"qwat_od","vw_export_installation","geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","fk_source_type",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","fk_source_quality",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","flow_lowest",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","flow_average",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","flow_concession",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","contract_end",,"YES","date",,,,"0"
"qwat_od","vw_export_installation","gathering_chamber",,"YES","boolean",,,,
"qwat_od","vw_export_installation","fk_pump_type",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","fk_pipe_in",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_pipe_out",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_pump_operating",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","no_pumps",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","rejected_flow",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","manometric_height",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","fk_overflow",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","fk_tank_firestorage",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","storage_total",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","storage_supply",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","storage_fire",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","altitude_overflow",,"YES","numeric",,"7","10",
"qwat_od","vw_export_installation","altitude_apron",,"YES","numeric",,"7","10",
"qwat_od","vw_export_installation","height_max",,"YES","numeric",,"7","10",
"qwat_od","vw_export_installation","fire_valve",,"YES","boolean",,,,
"qwat_od","vw_export_installation","fire_remote",,"YES","boolean",,,,
"qwat_od","vw_export_installation","_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_export_installation","cistern1_fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","cistern1_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","cistern1_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","cistern1_storage",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","_cistern1_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_export_installation","cistern2_fk_type",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","cistern2_dimension_1",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","cistern2_dimension_2",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","cistern2_storage",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","_cistern2_litrepercm",,"YES","numeric",,"9","10",
"qwat_od","vw_export_installation","sanitization_uv",,"YES","boolean",,,,
"qwat_od","vw_export_installation","sanitization_chlorine_liquid",,"YES","boolean",,,,
"qwat_od","vw_export_installation","sanitization_chlorine_gazeous",,"YES","boolean",,,,
"qwat_od","vw_export_installation","sanitization_ozone",,"YES","boolean",,,,
"qwat_od","vw_export_installation","filtration_membrane",,"YES","boolean",,,,
"qwat_od","vw_export_installation","filtration_sandorgravel",,"YES","boolean",,,,
"qwat_od","vw_export_installation","flocculation",,"YES","boolean",,,,
"qwat_od","vw_export_installation","activatedcharcoal",,"YES","boolean",,,,
"qwat_od","vw_export_installation","settling",,"YES","boolean",,,,
"qwat_od","vw_export_installation","treatment_capacity",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","networkseparation",,"YES","boolean",,,,
"qwat_od","vw_export_installation","flow_meter",,"YES","boolean",,,,
"qwat_od","vw_export_installation","water_meter",,"YES","boolean",,,,
"qwat_od","vw_export_installation","manometer",,"YES","boolean",,,,
"qwat_od","vw_export_installation","depth",,"YES","numeric",,"10","10",
"qwat_od","vw_export_installation","no_valves",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","fk_pressurecontrol_type",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","status_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","status_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","status_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","status_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","status_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","status_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","status_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","status_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","status_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","status_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","status_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","status_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","watertype_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","watertype_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","watertype_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","watertype_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","watertype_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","watertype_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","watertype_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","watertype_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","watertype_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","watertype_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","watertype_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","pump_type_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","pump_type_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","pump_type_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","pump_type_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","pump_type_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","pump_type_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","pump_type_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","pump_type_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","pump_type_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","pump_type_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","pump_type_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","object_reference_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","object_reference_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","object_reference_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","object_reference_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","object_reference_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","object_reference_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","object_reference_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","object_reference_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","object_reference_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","object_reference_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","cistern2_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","cistern2_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","cistern2_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","cistern2_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","cistern2_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","cistern2_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","cistern2_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","cistern2_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","cistern2_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","cistern2_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","precision_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","precision_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","precision_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","precision_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","precision_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","precision_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","precision_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","precision_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","precision_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","precision_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","precision_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","tank_firestorage_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","tank_firestorage_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","tank_firestorage_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","tank_firestorage_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","tank_firestorage_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","tank_firestorage_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","tank_firestorage_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","tank_firestorage_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","tank_firestorage_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","tank_firestorage_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","cistern1_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","cistern1_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","cistern1_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","cistern1_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","cistern1_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","cistern1_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","cistern1_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","cistern1_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","cistern1_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","cistern1_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","source_type_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","source_type_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","source_type_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","source_type_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","source_type_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","source_type_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","source_type_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","source_type_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","source_type_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","source_type_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","source_type_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","source_quality_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","source_quality_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","source_quality_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","source_quality_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","source_quality_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","source_quality_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","source_quality_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","source_quality_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","source_quality_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","source_quality_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","source_quality_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","distributor_name",,"YES","character varying","30",,,
"qwat_od","vw_export_installation","overflow_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","overflow_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","overflow_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","overflow_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","overflow_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","overflow_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","overflow_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","overflow_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","overflow_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","overflow_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","pressurecontrol_type_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","pressurecontrol_type_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","pressurecontrol_type_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","pressurecontrol_type_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","pressurecontrol_type_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","pressurecontrol_type_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","pressurecontrol_type_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","pressurecontrol_type_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","pressurecontrol_type_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","pressurecontrol_type_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","remote_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","remote_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","remote_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","remote_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","remote_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","remote_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","remote_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","remote_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","remote_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","remote_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","district_name",,"YES","character varying","40",,,
"qwat_od","vw_export_installation","district_shortname",,"YES","character varying","12",,,
"qwat_od","vw_export_installation","district_zip",,"YES","character varying","12",,,
"qwat_od","vw_export_installation","district_land_registry",,"YES","character varying","12",,,
"qwat_od","vw_export_installation","district_prefix",,"YES","character varying","12",,,
"qwat_od","vw_export_installation","district_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","district_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","district_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","district_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","district_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","district_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","district_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_installation","district_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","district_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","district_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","district_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","district_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_installation","pressurezone_fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","pressurezone_fk_consumptionzone",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","pressurezone_name",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","pressurezone_population",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","pressurezone_subscriber",,"YES","integer",,"32","2",
"qwat_od","vw_export_installation","pressurezone_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","pressurezone_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","pressurezone_geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","pressurezone_geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","pressurezone__geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_installation","pressurezone__geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_installation","pressurezone_update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_installation","pressurezone_update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_installation","pressurezone_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","pressurezone_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","pressurezone_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","pressurezone_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","pressurezone_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_installation","pressurezone_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","pressurezone_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","pressurezone_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","pressurezone_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_installation","pressurezone_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_installation","folder_identification",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","folder_description",,"YES","text",,,,
"qwat_od","vw_export_installation","folder_date_start",,"YES","date",,,,"0"
"qwat_od","vw_export_installation","folder_date_end",,"YES","date",,,,"0"
"qwat_od","vw_export_installation","folder_geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","folder_geometry_line",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_installation","precisionalti_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","precisionalti_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","precisionalti_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","precisionalti_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","precisionalti_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","precisionalti_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","precisionalti_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","precisionalti_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","precisionalti_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","precisionalti_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","precisionalti_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_installation","pump_operating_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_installation","pump_operating_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","pump_operating_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","pump_operating_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_installation","pump_operating_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","pump_operating_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","pump_operating_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_installation","pump_operating_description_fr",,"YES","text",,,,
"qwat_od","vw_export_installation","pump_operating_description_en",,"YES","text",,,,
"qwat_od","vw_export_installation","pump_operating_description_ro",,"YES","text",,,,
"qwat_od","vw_export_installation","pump_operating_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","id",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_export_valve","_printmaps",,"YES","text",,,,
"qwat_od","vw_export_valve","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_valve","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_valve","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_export_valve","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_valve","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_valve","identification",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_export_valve","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_export_valve","year",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","remark",,"YES","text",,,,
"qwat_od","vw_export_valve","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_export_valve","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_valve","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_valve","fk_valve_type",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_valve_function",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_valve_actuation",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_handle_precision",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_handle_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","fk_maintenance",,"YES","ARRAY",,,,
"qwat_od","vw_export_valve","diameter_nominal",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","closed",,"YES","boolean",,,,
"qwat_od","vw_export_valve","networkseparation",,"YES","boolean",,,,
"qwat_od","vw_export_valve","handle_altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_export_valve","handle_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","status_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_valve","status_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","status_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","status_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","status_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","status_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","status_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","status_description_fr",,"YES","text",,,,
"qwat_od","vw_export_valve","status_description_en",,"YES","text",,,,
"qwat_od","vw_export_valve","status_description_ro",,"YES","text",,,,
"qwat_od","vw_export_valve","status_active",,"YES","boolean",,,,
"qwat_od","vw_export_valve","status_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","district_name",,"YES","character varying","40",,,
"qwat_od","vw_export_valve","district_shortname",,"YES","character varying","12",,,
"qwat_od","vw_export_valve","district_zip",,"YES","character varying","12",,,
"qwat_od","vw_export_valve","district_land_registry",,"YES","character varying","12",,,
"qwat_od","vw_export_valve","district_prefix",,"YES","character varying","12",,,
"qwat_od","vw_export_valve","district_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","district_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","district_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","district_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","district_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","district_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","district_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_valve","district_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","district_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","district_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","district_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","district_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_valve","pressurezone_fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","pressurezone_fk_consumptionzone",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","pressurezone_name",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","pressurezone_population",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","pressurezone_subscriber",,"YES","integer",,"32","2",
"qwat_od","vw_export_valve","pressurezone_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","pressurezone_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","pressurezone_geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","pressurezone_geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","pressurezone__geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_valve","pressurezone__geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_valve","pressurezone_update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_valve","pressurezone_update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_valve","pressurezone_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","pressurezone_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","pressurezone_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","pressurezone_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","pressurezone_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_valve","pressurezone_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","pressurezone_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","pressurezone_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","pressurezone_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_valve","pressurezone_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_valve","valve_function_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_valve","valve_function_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","valve_function_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","valve_function_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","valve_function_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","valve_function_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","valve_function_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","valve_function_description_fr",,"YES","text",,,,
"qwat_od","vw_export_valve","valve_function_description_en",,"YES","text",,,,
"qwat_od","vw_export_valve","valve_function_description_ro",,"YES","text",,,,
"qwat_od","vw_export_valve","valve_function_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_export_valve","precision_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_valve","precision_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","precision_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","precision_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","precision_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","precision_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","precision_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","precision_description_fr",,"YES","text",,,,
"qwat_od","vw_export_valve","precision_description_en",,"YES","text",,,,
"qwat_od","vw_export_valve","precision_description_ro",,"YES","text",,,,
"qwat_od","vw_export_valve","precision_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_valve","distributor_name",,"YES","character varying","30",,,
"qwat_od","vw_export_valve","valve_type_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_valve","valve_type_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","valve_type_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","valve_type_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","valve_type_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","valve_type_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","valve_type_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","valve_type_description_fr",,"YES","text",,,,
"qwat_od","vw_export_valve","valve_type_description_en",,"YES","text",,,,
"qwat_od","vw_export_valve","valve_type_description_ro",,"YES","text",,,,
"qwat_od","vw_export_valve","object_reference_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_valve","object_reference_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","object_reference_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","object_reference_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","object_reference_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","object_reference_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","object_reference_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","object_reference_description_fr",,"YES","text",,,,
"qwat_od","vw_export_valve","object_reference_description_en",,"YES","text",,,,
"qwat_od","vw_export_valve","object_reference_description_ro",,"YES","text",,,,
"qwat_od","vw_export_valve","valve_actuation_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_valve","valve_actuation_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","valve_actuation_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","valve_actuation_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","valve_actuation_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","valve_actuation_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","valve_actuation_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","valve_actuation_description_fr",,"YES","text",,,,
"qwat_od","vw_export_valve","valve_actuation_description_en",,"YES","text",,,,
"qwat_od","vw_export_valve","valve_actuation_description_ro",,"YES","text",,,,
"qwat_od","vw_export_valve","valve_actuation_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_export_valve","folder_identification",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","folder_description",,"YES","text",,,,
"qwat_od","vw_export_valve","folder_date_start",,"YES","date",,,,"0"
"qwat_od","vw_export_valve","folder_date_end",,"YES","date",,,,"0"
"qwat_od","vw_export_valve","folder_geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","folder_geometry_line",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_valve","precisionalti_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_valve","precisionalti_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","precisionalti_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","precisionalti_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_valve","precisionalti_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","precisionalti_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","precisionalti_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_valve","precisionalti_description_fr",,"YES","text",,,,
"qwat_od","vw_export_valve","precisionalti_description_en",,"YES","text",,,,
"qwat_od","vw_export_valve","precisionalti_description_ro",,"YES","text",,,,
"qwat_od","vw_export_valve","precisionalti_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","id",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_export_hydrant","_printmaps",,"YES","text",,,,
"qwat_od","vw_export_hydrant","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_hydrant","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_hydrant","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_hydrant","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_hydrant","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","identification",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_export_hydrant","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_export_hydrant","year",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","remark",,"YES","text",,,,
"qwat_od","vw_export_hydrant","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_hydrant","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_hydrant","fk_provider",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_model_sup",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_model_inf",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_material",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","fk_output",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","underground",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","marked",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","pressure_static",,"YES","numeric",,"5","10",
"qwat_od","vw_export_hydrant","pressure_dynamic",,"YES","numeric",,"5","10",
"qwat_od","vw_export_hydrant","flow",,"YES","numeric",,"8","10",
"qwat_od","vw_export_hydrant","observation_date",,"YES","date",,,,"0"
"qwat_od","vw_export_hydrant","observation_source",,"YES","character varying","45",,,
"qwat_od","vw_export_hydrant","status_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","status_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","status_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","status_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","status_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","status_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","status_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","status_description_fr",,"YES","text",,,,
"qwat_od","vw_export_hydrant","status_description_en",,"YES","text",,,,
"qwat_od","vw_export_hydrant","status_description_ro",,"YES","text",,,,
"qwat_od","vw_export_hydrant","status_active",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","status_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","district_name",,"YES","character varying","40",,,
"qwat_od","vw_export_hydrant","district_shortname",,"YES","character varying","12",,,
"qwat_od","vw_export_hydrant","district_zip",,"YES","character varying","12",,,
"qwat_od","vw_export_hydrant","district_land_registry",,"YES","character varying","12",,,
"qwat_od","vw_export_hydrant","district_prefix",,"YES","character varying","12",,,
"qwat_od","vw_export_hydrant","district_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","district_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_hydrant","district_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","district_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","district_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","district_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","district_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_hydrant","district_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","district_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","district_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","district_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","district_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_hydrant","model_inf_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","model_inf_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","model_inf_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","model_inf_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","model_inf_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","model_inf_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","model_inf_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","model_inf_description_fr",,"YES","text",,,,
"qwat_od","vw_export_hydrant","model_inf_description_en",,"YES","text",,,,
"qwat_od","vw_export_hydrant","model_inf_description_ro",,"YES","text",,,,
"qwat_od","vw_export_hydrant","pressurezone_fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","pressurezone_fk_consumptionzone",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","pressurezone_name",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","pressurezone_population",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","pressurezone_subscriber",,"YES","integer",,"32","2",
"qwat_od","vw_export_hydrant","pressurezone_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","pressurezone_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_hydrant","pressurezone_geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_hydrant","pressurezone_geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_hydrant","pressurezone__geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","pressurezone__geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","pressurezone_update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","pressurezone_update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","pressurezone_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","pressurezone_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","pressurezone_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","pressurezone_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","pressurezone_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_hydrant","pressurezone_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","pressurezone_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","pressurezone_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","pressurezone_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_hydrant","pressurezone_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_hydrant","material_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","material_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","material_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","material_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","material_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","material_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","material_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","material_description_fr",,"YES","text",,,,
"qwat_od","vw_export_hydrant","material_description_en",,"YES","text",,,,
"qwat_od","vw_export_hydrant","material_description_ro",,"YES","text",,,,
"qwat_od","vw_export_hydrant","material_pressure_nominal",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","precision_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","precision_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","precision_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","precision_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","precision_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","precision_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","precision_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","precision_description_fr",,"YES","text",,,,
"qwat_od","vw_export_hydrant","precision_description_en",,"YES","text",,,,
"qwat_od","vw_export_hydrant","precision_description_ro",,"YES","text",,,,
"qwat_od","vw_export_hydrant","precision_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_hydrant","model_sup_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","model_sup_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","model_sup_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","model_sup_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","model_sup_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","model_sup_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","model_sup_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","model_sup_description_fr",,"YES","text",,,,
"qwat_od","vw_export_hydrant","model_sup_description_en",,"YES","text",,,,
"qwat_od","vw_export_hydrant","model_sup_description_ro",,"YES","text",,,,
"qwat_od","vw_export_hydrant","object_reference_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","object_reference_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","object_reference_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","object_reference_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","object_reference_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","object_reference_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","object_reference_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","object_reference_description_fr",,"YES","text",,,,
"qwat_od","vw_export_hydrant","object_reference_description_en",,"YES","text",,,,
"qwat_od","vw_export_hydrant","object_reference_description_ro",,"YES","text",,,,
"qwat_od","vw_export_hydrant","provider_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","provider_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","provider_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","provider_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","provider_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","provider_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","provider_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","provider_description_fr",,"YES","text",,,,
"qwat_od","vw_export_hydrant","provider_description_en",,"YES","text",,,,
"qwat_od","vw_export_hydrant","provider_description_ro",,"YES","text",,,,
"qwat_od","vw_export_hydrant","distributor_name",,"YES","character varying","30",,,
"qwat_od","vw_export_hydrant","output_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","output_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","output_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","output_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","output_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","output_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","output_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","output_description_fr",,"YES","text",,,,
"qwat_od","vw_export_hydrant","output_description_en",,"YES","text",,,,
"qwat_od","vw_export_hydrant","output_description_ro",,"YES","text",,,,
"qwat_od","vw_export_hydrant","folder_identification",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","folder_description",,"YES","text",,,,
"qwat_od","vw_export_hydrant","folder_date_start",,"YES","date",,,,"0"
"qwat_od","vw_export_hydrant","folder_date_end",,"YES","date",,,,"0"
"qwat_od","vw_export_hydrant","folder_geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_hydrant","folder_geometry_line",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_hydrant","precisionalti_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_hydrant","precisionalti_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","precisionalti_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","precisionalti_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_hydrant","precisionalti_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","precisionalti_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","precisionalti_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_hydrant","precisionalti_description_fr",,"YES","text",,,,
"qwat_od","vw_export_hydrant","precisionalti_description_en",,"YES","text",,,,
"qwat_od","vw_export_hydrant","precisionalti_description_ro",,"YES","text",,,,
"qwat_od","vw_export_hydrant","precisionalti_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","id",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_export_meter","_printmaps",,"YES","text",,,,
"qwat_od","vw_export_meter","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_meter","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_meter","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_meter","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_export_meter","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_meter","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_meter","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_meter","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_meter","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_meter","identification",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_export_meter","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_export_meter","year",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","remark",,"YES","text",,,,
"qwat_od","vw_export_meter","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_export_meter","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_meter","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_meter","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","parcel",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","status_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_meter","status_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","status_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","status_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","status_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","status_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","status_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","status_description_fr",,"YES","text",,,,
"qwat_od","vw_export_meter","status_description_en",,"YES","text",,,,
"qwat_od","vw_export_meter","status_description_ro",,"YES","text",,,,
"qwat_od","vw_export_meter","status_active",,"YES","boolean",,,,
"qwat_od","vw_export_meter","status_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","district_name",,"YES","character varying","40",,,
"qwat_od","vw_export_meter","district_shortname",,"YES","character varying","12",,,
"qwat_od","vw_export_meter","district_zip",,"YES","character varying","12",,,
"qwat_od","vw_export_meter","district_land_registry",,"YES","character varying","12",,,
"qwat_od","vw_export_meter","district_prefix",,"YES","character varying","12",,,
"qwat_od","vw_export_meter","district_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","district_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_meter","district_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","district_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","district_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","district_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","district_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_meter","district_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","district_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","district_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","district_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","district_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_meter","pressurezone_fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","pressurezone_fk_consumptionzone",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","pressurezone_name",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","pressurezone_population",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","pressurezone_subscriber",,"YES","integer",,"32","2",
"qwat_od","vw_export_meter","pressurezone_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","pressurezone_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_meter","pressurezone_geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_meter","pressurezone_geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_meter","pressurezone__geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_meter","pressurezone__geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_meter","pressurezone_update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_meter","pressurezone_update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_meter","pressurezone_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","pressurezone_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","pressurezone_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","pressurezone_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","pressurezone_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_meter","pressurezone_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","pressurezone_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","pressurezone_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","pressurezone_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_meter","pressurezone_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_meter","precision_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_meter","precision_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","precision_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","precision_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","precision_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","precision_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","precision_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","precision_description_fr",,"YES","text",,,,
"qwat_od","vw_export_meter","precision_description_en",,"YES","text",,,,
"qwat_od","vw_export_meter","precision_description_ro",,"YES","text",,,,
"qwat_od","vw_export_meter","precision_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_meter","object_reference_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_meter","object_reference_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","object_reference_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","object_reference_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","object_reference_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","object_reference_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","object_reference_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","object_reference_description_fr",,"YES","text",,,,
"qwat_od","vw_export_meter","object_reference_description_en",,"YES","text",,,,
"qwat_od","vw_export_meter","object_reference_description_ro",,"YES","text",,,,
"qwat_od","vw_export_meter","distributor_name",,"YES","character varying","30",,,
"qwat_od","vw_export_meter","folder_identification",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","folder_description",,"YES","text",,,,
"qwat_od","vw_export_meter","folder_date_start",,"YES","date",,,,"0"
"qwat_od","vw_export_meter","folder_date_end",,"YES","date",,,,"0"
"qwat_od","vw_export_meter","folder_geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_meter","folder_geometry_line",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_meter","precisionalti_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_meter","precisionalti_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","precisionalti_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","precisionalti_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_meter","precisionalti_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","precisionalti_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","precisionalti_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_meter","precisionalti_description_fr",,"YES","text",,,,
"qwat_od","vw_export_meter","precisionalti_description_en",,"YES","text",,,,
"qwat_od","vw_export_meter","precisionalti_description_ro",,"YES","text",,,,
"qwat_od","vw_export_meter","precisionalti_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","id",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_export_part","_printmaps",,"YES","text",,,,
"qwat_od","vw_export_part","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_part","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_part","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_part","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_export_part","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_part","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_part","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_part","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_part","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_part","identification",,"YES","character varying","50",,,
"qwat_od","vw_export_part","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_export_part","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_export_part","year",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","remark",,"YES","text",,,,
"qwat_od","vw_export_part","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_export_part","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_part","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_part","fk_part_type",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","status_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_part","status_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_part","status_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_part","status_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_part","status_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_part","status_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_part","status_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_part","status_description_fr",,"YES","text",,,,
"qwat_od","vw_export_part","status_description_en",,"YES","text",,,,
"qwat_od","vw_export_part","status_description_ro",,"YES","text",,,,
"qwat_od","vw_export_part","status_active",,"YES","boolean",,,,
"qwat_od","vw_export_part","status_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","district_name",,"YES","character varying","40",,,
"qwat_od","vw_export_part","district_shortname",,"YES","character varying","12",,,
"qwat_od","vw_export_part","district_zip",,"YES","character varying","12",,,
"qwat_od","vw_export_part","district_land_registry",,"YES","character varying","12",,,
"qwat_od","vw_export_part","district_prefix",,"YES","character varying","12",,,
"qwat_od","vw_export_part","district_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","district_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_part","district_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","district_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","district_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","district_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","district_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_part","district_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","district_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","district_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","district_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","district_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_part","pressurezone_fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","pressurezone_fk_consumptionzone",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","pressurezone_name",,"YES","character varying","50",,,
"qwat_od","vw_export_part","pressurezone_population",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","pressurezone_subscriber",,"YES","integer",,"32","2",
"qwat_od","vw_export_part","pressurezone_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","pressurezone_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_part","pressurezone_geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_part","pressurezone_geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_part","pressurezone__geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_part","pressurezone__geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_part","pressurezone_update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_part","pressurezone_update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_part","pressurezone_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","pressurezone_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","pressurezone_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","pressurezone_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","pressurezone_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_part","pressurezone_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","pressurezone_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","pressurezone_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","pressurezone_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_part","pressurezone_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_part","precision_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_part","precision_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_part","precision_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_part","precision_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_part","precision_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_part","precision_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_part","precision_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_part","precision_description_fr",,"YES","text",,,,
"qwat_od","vw_export_part","precision_description_en",,"YES","text",,,,
"qwat_od","vw_export_part","precision_description_ro",,"YES","text",,,,
"qwat_od","vw_export_part","precision_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_part","part_type_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_part","part_type_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_part","part_type_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_part","part_type_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_part","part_type_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_part","part_type_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_part","part_type_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_part","part_type_description_fr",,"YES","text",,,,
"qwat_od","vw_export_part","part_type_description_en",,"YES","text",,,,
"qwat_od","vw_export_part","part_type_description_ro",,"YES","text",,,,
"qwat_od","vw_export_part","object_reference_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_part","object_reference_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_part","object_reference_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_part","object_reference_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_part","object_reference_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_part","object_reference_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_part","object_reference_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_part","object_reference_description_fr",,"YES","text",,,,
"qwat_od","vw_export_part","object_reference_description_en",,"YES","text",,,,
"qwat_od","vw_export_part","object_reference_description_ro",,"YES","text",,,,
"qwat_od","vw_export_part","distributor_name",,"YES","character varying","30",,,
"qwat_od","vw_export_part","folder_identification",,"YES","character varying","50",,,
"qwat_od","vw_export_part","folder_description",,"YES","text",,,,
"qwat_od","vw_export_part","folder_date_start",,"YES","date",,,,"0"
"qwat_od","vw_export_part","folder_date_end",,"YES","date",,,,"0"
"qwat_od","vw_export_part","folder_geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_part","folder_geometry_line",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_part","precisionalti_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_part","precisionalti_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_part","precisionalti_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_part","precisionalti_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_part","precisionalti_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_part","precisionalti_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_part","precisionalti_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_part","precisionalti_description_fr",,"YES","text",,,,
"qwat_od","vw_export_part","precisionalti_description_en",,"YES","text",,,,
"qwat_od","vw_export_part","precisionalti_description_ro",,"YES","text",,,,
"qwat_od","vw_export_part","precisionalti_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","id",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","fk_district",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","fk_pressurezone",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","fk_printmap",,"YES","ARRAY",,,,
"qwat_od","vw_export_subscriber","_printmaps",,"YES","text",,,,
"qwat_od","vw_export_subscriber","_geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","_geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","_pipe_node_type",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_subscriber","_pipe_orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","_pipe_schema_visible",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_subscriber","geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_subscriber","geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_subscriber","update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","identification",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","fk_status",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","fk_folder",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","fk_locationtype",,"YES","ARRAY",,,,
"qwat_od","vw_export_subscriber","fk_precision",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","fk_precisionalti",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","fk_object_reference",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","altitude",,"YES","numeric",,"10","10",
"qwat_od","vw_export_subscriber","year",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","year_end",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","orientation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","remark",,"YES","text",,,,
"qwat_od","vw_export_subscriber","schema_force_visible",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_subscriber","label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_subscriber","fk_subscriber_type",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","fk_pipe",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","parcel",,"YES","character varying","12",,,
"qwat_od","vw_export_subscriber","flow_current",,"YES","numeric",,"8","10",
"qwat_od","vw_export_subscriber","flow_planned",,"YES","numeric",,"8","10",
"qwat_od","vw_export_subscriber","status_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","status_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","status_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","status_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","status_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","status_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","status_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","status_description_fr",,"YES","text",,,,
"qwat_od","vw_export_subscriber","status_description_en",,"YES","text",,,,
"qwat_od","vw_export_subscriber","status_description_ro",,"YES","text",,,,
"qwat_od","vw_export_subscriber","status_active",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","status_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","district_name",,"YES","character varying","40",,,
"qwat_od","vw_export_subscriber","district_shortname",,"YES","character varying","12",,,
"qwat_od","vw_export_subscriber","district_zip",,"YES","character varying","12",,,
"qwat_od","vw_export_subscriber","district_land_registry",,"YES","character varying","12",,,
"qwat_od","vw_export_subscriber","district_prefix",,"YES","character varying","12",,,
"qwat_od","vw_export_subscriber","district_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","district_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_subscriber","district_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","district_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","district_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","district_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","district_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_subscriber","district_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","district_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","district_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","district_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","district_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_subscriber","pressurezone_fk_distributor",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","pressurezone_fk_consumptionzone",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","pressurezone_name",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","pressurezone_population",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","pressurezone_subscriber",,"YES","integer",,"32","2",
"qwat_od","vw_export_subscriber","pressurezone_colorcode",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","pressurezone_geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_subscriber","pressurezone_geometry_alt1",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_subscriber","pressurezone_geometry_alt2",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_subscriber","pressurezone__geometry_alt1_used",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","pressurezone__geometry_alt2_used",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","pressurezone_update_geometry_alt1",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","pressurezone_update_geometry_alt2",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","pressurezone_label_1_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","pressurezone_label_1_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","pressurezone_label_1_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","pressurezone_label_1_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","pressurezone_label_1_text",,"YES","character varying","120",,,
"qwat_od","vw_export_subscriber","pressurezone_label_2_visible",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","pressurezone_label_2_x",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","pressurezone_label_2_y",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","pressurezone_label_2_rotation",,"YES","double precision",,"53","2",
"qwat_od","vw_export_subscriber","pressurezone_label_2_text",,"YES","character varying","120",,,
"qwat_od","vw_export_subscriber","precision_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","precision_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","precision_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","precision_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","precision_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","precision_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","precision_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","precision_description_fr",,"YES","text",,,,
"qwat_od","vw_export_subscriber","precision_description_en",,"YES","text",,,,
"qwat_od","vw_export_subscriber","precision_description_ro",,"YES","text",,,,
"qwat_od","vw_export_subscriber","precision_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_export_subscriber","subscriber_type_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","subscriber_type_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","subscriber_type_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","subscriber_type_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","subscriber_type_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","subscriber_type_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","subscriber_type_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","subscriber_type_description_fr",,"YES","text",,,,
"qwat_od","vw_export_subscriber","subscriber_type_description_en",,"YES","text",,,,
"qwat_od","vw_export_subscriber","subscriber_type_description_ro",,"YES","text",,,,
"qwat_od","vw_export_subscriber","object_reference_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","object_reference_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","object_reference_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","object_reference_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","object_reference_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","object_reference_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","object_reference_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","object_reference_description_fr",,"YES","text",,,,
"qwat_od","vw_export_subscriber","object_reference_description_en",,"YES","text",,,,
"qwat_od","vw_export_subscriber","object_reference_description_ro",,"YES","text",,,,
"qwat_od","vw_export_subscriber","distributor_name",,"YES","character varying","30",,,
"qwat_od","vw_export_subscriber","folder_identification",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","folder_description",,"YES","text",,,,
"qwat_od","vw_export_subscriber","folder_date_start",,"YES","date",,,,"0"
"qwat_od","vw_export_subscriber","folder_date_end",,"YES","date",,,,"0"
"qwat_od","vw_export_subscriber","folder_geometry_polygon",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_subscriber","folder_geometry_line",,"YES","USER-DEFINED",,,,
"qwat_od","vw_export_subscriber","precisionalti_vl_active",,"YES","boolean",,,,
"qwat_od","vw_export_subscriber","precisionalti_short_fr",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","precisionalti_short_en",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","precisionalti_short_ro",,"YES","character varying","10",,,
"qwat_od","vw_export_subscriber","precisionalti_value_fr",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","precisionalti_value_en",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","precisionalti_value_ro",,"YES","character varying","50",,,
"qwat_od","vw_export_subscriber","precisionalti_description_fr",,"YES","text",,,,
"qwat_od","vw_export_subscriber","precisionalti_description_en",,"YES","text",,,,
"qwat_od","vw_export_subscriber","precisionalti_description_ro",,"YES","text",,,,
"qwat_od","vw_export_subscriber","precisionalti_code_sire",,"YES","smallint",,"16","2",
"qwat_od","vw_search_view","layer_name",,"YES","text",,,,
"qwat_od","vw_search_view","search_text",,"YES","text",,,,
"qwat_od","vw_search_view","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_subscriber_pipe_relation","id",,"YES","integer",,"32","2",
"qwat_od","vw_subscriber_pipe_relation","identification",,"YES","character varying","50",,,
"qwat_od","vw_subscriber_pipe_relation","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_valve_lines","id",,"YES","integer",,"32","2",
"qwat_od","vw_valve_lines","geometry",,"YES","USER-DEFINED",,,,
"qwat_od","vw_pipe_child_parent","child",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_child_parent","parent",,"YES","integer",,"32","2",
"qwat_od","vw_pipe_child_parent","geometry",,"YES","USER-DEFINED",,,,
"setting_unique","qwat_sys.settings.name","qwat_sys","settings","name","settings","name","UNIQUE"
"settings_pkey","qwat_sys.settings.id","qwat_sys","settings","id","settings","id","PRIMARY KEY"
"module_unique","qwat_sys.versions.module","qwat_sys","versions","module","versions","module","UNIQUE"
"versions_pkey","qwat_sys.versions.id","qwat_sys","versions","id","versions","id","PRIMARY KEY"
"logged_actions_pkey","qwat_sys.logged_actions.event_id","qwat_sys","logged_actions","event_id","logged_actions","event_id","PRIMARY KEY"
"value_list_base_pk","qwat_vl.value_list_base.id","qwat_vl","value_list_base","id","value_list_base","id","PRIMARY KEY"
"vl_object_reference_pk","qwat_vl.object_reference.id","qwat_vl","object_reference","id","object_reference","id","PRIMARY KEY"
"constructionpoint_fk_object_reference","qwat_dr.constructionpoint.fk_object_reference","qwat_dr","constructionpoint","fk_object_reference","object_reference","id","FOREIGN KEY"
"element_fk_object_reference","qwat_od.network_element.fk_object_reference","qwat_od","network_element","fk_object_reference","object_reference","id","FOREIGN KEY"
"vl_bedding_pk","qwat_vl.bedding.id","qwat_vl","bedding","id","bedding","id","PRIMARY KEY"
"pipe_fk_bedding","qwat_od.pipe.fk_bedding","qwat_od","pipe","fk_bedding","bedding","id","FOREIGN KEY"
"vl_cistern_pk","qwat_vl.cistern.id","qwat_vl","cistern","id","cistern","id","PRIMARY KEY"
"tank_cistern1type","qwat_od.tank.cistern1_fk_type","qwat_od","tank","cistern1_fk_type","cistern","id","FOREIGN KEY"
"tank_cistern2type","qwat_od.tank.cistern2_fk_type","qwat_od","tank","cistern2_fk_type","cistern","id","FOREIGN KEY"
"vl_cover_type_pk","qwat_vl.cover_type.id","qwat_vl","cover_type","id","cover_type","id","PRIMARY KEY"
"cover_fk_type","qwat_od.cover.fk_cover_type","qwat_od","cover","fk_cover_type","cover_type","id","FOREIGN KEY"
"vl_hydrant_model_sup_pk","qwat_vl.hydrant_model_sup.id","qwat_vl","hydrant_model_sup","id","hydrant_model_sup","id","PRIMARY KEY"
"hydrant_fk_model_sup","qwat_od.hydrant.fk_model_sup","qwat_od","hydrant","fk_model_sup","hydrant_model_sup","id","FOREIGN KEY"
"vl_hydrant_model_inf_pk","qwat_vl.hydrant_model_inf.id","qwat_vl","hydrant_model_inf","id","hydrant_model_inf","id","PRIMARY KEY"
"hydrant_fk_model_inf","qwat_od.hydrant.fk_model_inf","qwat_od","hydrant","fk_model_inf","hydrant_model_inf","id","FOREIGN KEY"
"vl_hydrant_material_pk","qwat_vl.hydrant_material.id","qwat_vl","hydrant_material","id","hydrant_material","id","PRIMARY KEY"
"hydrant_fk_material","qwat_od.hydrant.fk_material","qwat_od","hydrant","fk_material","hydrant_material","id","FOREIGN KEY"
"vl_hydrant_output_pk","qwat_vl.hydrant_output.id","qwat_vl","hydrant_output","id","hydrant_output","id","PRIMARY KEY"
"hydrant_fk_output","qwat_od.hydrant.fk_output","qwat_od","hydrant","fk_output","hydrant_output","id","FOREIGN KEY"
"vl_hydrant_provider_pk","qwat_vl.hydrant_provider.id","qwat_vl","hydrant_provider","id","hydrant_provider","id","PRIMARY KEY"
"hydrant_fk_provider","qwat_od.hydrant.fk_provider","qwat_od","hydrant","fk_provider","hydrant_provider","id","FOREIGN KEY"
"vl_leak_cause_pk","qwat_vl.leak_cause.id","qwat_vl","leak_cause","id","leak_cause","id","PRIMARY KEY"
"leak_fk_cause","qwat_od.leak.fk_cause","qwat_od","leak","fk_cause","leak_cause","id","FOREIGN KEY"
"vl_location_pk","qwat_vl.locationtype.id","qwat_vl","locationtype","id","locationtype","id","PRIMARY KEY"
"vl_overflow_pk","qwat_vl.overflow.id","qwat_vl","overflow","id","overflow","id","PRIMARY KEY"
"tank_fk_overflow","qwat_od.tank.fk_overflow","qwat_od","tank","fk_overflow","overflow","id","FOREIGN KEY"
"vl_part_type_pk","qwat_vl.part_type.id","qwat_vl","part_type","id","part_type","id","PRIMARY KEY"
"part_fk_type","qwat_od.part.fk_part_type","qwat_od","part","fk_part_type","part_type","id","FOREIGN KEY"
"vl_pipe_function_pk","qwat_vl.pipe_function.id","qwat_vl","pipe_function","id","pipe_function","id","PRIMARY KEY"
"pipe_fk_function","qwat_od.pipe.fk_function","qwat_od","pipe","fk_function","pipe_function","id","FOREIGN KEY"
"vl_pipe_installmethod_pk","qwat_vl.pipe_installmethod.id","qwat_vl","pipe_installmethod","id","pipe_installmethod","id","PRIMARY KEY"
"pipe_fk_installmethod","qwat_od.pipe.fk_installmethod","qwat_od","pipe","fk_installmethod","pipe_installmethod","id","FOREIGN KEY"
"vl_pipe_material_pk","qwat_vl.pipe_material.id","qwat_vl","pipe_material","id","pipe_material","id","PRIMARY KEY"
"pipe_fk_material","qwat_od.pipe.fk_material","qwat_od","pipe","fk_material","pipe_material","id","FOREIGN KEY"
"remote_fk_material","qwat_od.remote.fk_material","qwat_od","remote","fk_material","pipe_material","id","FOREIGN KEY"
"vl_pipe_protection_pk","qwat_vl.pipe_protection.id","qwat_vl","pipe_protection","id","pipe_protection","id","PRIMARY KEY"
"pipe_fk_protection","qwat_od.pipe.fk_protection","qwat_od","pipe","fk_protection","pipe_protection","id","FOREIGN KEY"
"vl_precisionalti_pk","qwat_vl.precisionalti.id","qwat_vl","precisionalti","id","precisionalti","id","PRIMARY KEY"
"element_fk_precisionalti","qwat_od.network_element.fk_precisionalti","qwat_od","network_element","fk_precisionalti","precisionalti","id","FOREIGN KEY"
"valve_fk_handle_precisionalti","qwat_od.valve.fk_handle_precisionalti","qwat_od","valve","fk_handle_precisionalti","precisionalti","id","FOREIGN KEY"
"vl_precision_pk","qwat_vl.precision.id","qwat_vl","precision","id","precision","id","PRIMARY KEY"
"element_fk_precision","qwat_od.network_element.fk_precision","qwat_od","network_element","fk_precision","precision","id","FOREIGN KEY"
"pipe_fk_precision","qwat_od.pipe.fk_precision","qwat_od","pipe","fk_precision","precision","id","FOREIGN KEY"
"valve_fk_handle_precision","qwat_od.valve.fk_handle_precision","qwat_od","valve","fk_handle_precision","precision","id","FOREIGN KEY"
"remote_fk_precision","qwat_od.remote.fk_precision","qwat_od","remote","fk_precision","precision","id","FOREIGN KEY"
"vl_pressurecontrol_type_pk","qwat_vl.pressurecontrol_type.id","qwat_vl","pressurecontrol_type","id","pressurecontrol_type","id","PRIMARY KEY"
"pressurecontrol_fk_type","qwat_od.pressurecontrol.fk_pressurecontrol_type","qwat_od","pressurecontrol","fk_pressurecontrol_type","pressurecontrol_type","id","FOREIGN KEY"
"vl_protectionzone_type_pk","qwat_vl.protectionzone_type.id","qwat_vl","protectionzone_type","id","protectionzone_type","id","PRIMARY KEY"
"protectionzone_fk_type","qwat_od.protectionzone.fk_type","qwat_od","protectionzone","fk_type","protectionzone_type","id","FOREIGN KEY"
"vl_pump_operating_pk","qwat_vl.pump_operating.id","qwat_vl","pump_operating","id","pump_operating","id","PRIMARY KEY"
"pump_fk_pump_operating","qwat_od.pump.fk_pump_operating","qwat_od","pump","fk_pump_operating","pump_operating","id","FOREIGN KEY"
"vl_pump_type_pk","qwat_vl.pump_type.id","qwat_vl","pump_type","id","pump_type","id","PRIMARY KEY"
"pump_fk_type","qwat_od.pump.fk_pump_type","qwat_od","pump","fk_pump_type","pump_type","id","FOREIGN KEY"
"vl_remote_type_pk","qwat_vl.remote_type.id","qwat_vl","remote_type","id","remote_type","id","PRIMARY KEY"
"installation_fk_remote","qwat_od.installation.fk_remote","qwat_od","installation","fk_remote","remote_type","id","FOREIGN KEY"
"vl_source_quality_pk","qwat_vl.source_quality.id","qwat_vl","source_quality","id","source_quality","id","PRIMARY KEY"
"source_fk_source_quality","qwat_od.source.fk_source_quality","qwat_od","source","fk_source_quality","source_quality","id","FOREIGN KEY"
"vl_source_type_pk","qwat_vl.source_type.id","qwat_vl","source_type","id","source_type","id","PRIMARY KEY"
"source_fk_type","qwat_od.source.fk_source_type","qwat_od","source","fk_source_type","source_type","id","FOREIGN KEY"
"vl_status_pk","qwat_vl.status.id","qwat_vl","status","id","status","id","PRIMARY KEY"
"element_fk_status","qwat_od.network_element.fk_status","qwat_od","network_element","fk_status","status","id","FOREIGN KEY"
"pipe_fk_status","qwat_od.pipe.fk_status","qwat_od","pipe","fk_status","status","id","FOREIGN KEY"
"remote_fk_status","qwat_od.remote.fk_status","qwat_od","remote","fk_status","status","id","FOREIGN KEY"
"vl_subscriber_type_pk","qwat_vl.subscriber_type.id","qwat_vl","subscriber_type","id","subscriber_type","id","PRIMARY KEY"
"subscriber_fk_type","qwat_od.subscriber.fk_subscriber_type","qwat_od","subscriber","fk_subscriber_type","subscriber_type","id","FOREIGN KEY"
"vl_survey_type_pk","qwat_vl.survey_type.id","qwat_vl","survey_type","id","survey_type","id","PRIMARY KEY"
"surveypoint_fk_type","qwat_od.surveypoint.fk_survey_type","qwat_od","surveypoint","fk_survey_type","survey_type","id","FOREIGN KEY"
"vl_tank_firestorage_pk","qwat_vl.tank_firestorage.id","qwat_vl","tank_firestorage","id","tank_firestorage","id","PRIMARY KEY"
"tank_fk_tank_firestorage","qwat_od.tank.fk_tank_firestorage","qwat_od","tank","fk_tank_firestorage","tank_firestorage","id","FOREIGN KEY"
"vl_valve_actuation_pk","qwat_vl.valve_actuation.id","qwat_vl","valve_actuation","id","valve_actuation","id","PRIMARY KEY"
"valve_fk_valve_actuation","qwat_od.valve.fk_valve_actuation","qwat_od","valve","fk_valve_actuation","valve_actuation","id","FOREIGN KEY"
"vl_valve_function_pk","qwat_vl.valve_function.id","qwat_vl","valve_function","id","valve_function","id","PRIMARY KEY"
"valve_fk_function","qwat_od.valve.fk_valve_function","qwat_od","valve","fk_valve_function","valve_function","id","FOREIGN KEY"
"vlvalve_maintenance_pk","qwat_vl.valve_maintenance.id","qwat_vl","valve_maintenance","id","valve_maintenance","id","PRIMARY KEY"
"vl_valve_type_pk","qwat_vl.valve_type.id","qwat_vl","valve_type","id","valve_type","id","PRIMARY KEY"
"valve_fk_type","qwat_od.valve.fk_valve_type","qwat_od","valve","fk_valve_type","valve_type","id","FOREIGN KEY"
"vl_visible_pk","qwat_vl.visible.id","qwat_vl","visible","id","visible","id","PRIMARY KEY"
"visible_code","qwat_vl.visible.vl_code","qwat_vl","visible","vl_code","visible","vl_code","UNIQUE"
"network_element_schema_force_visible","qwat_od.network_element.schema_force_visible","qwat_od","network_element","schema_force_visible","visible","vl_code","FOREIGN KEY"
"pipe_schema_force_visible","qwat_od.pipe.schema_force_visible","qwat_od","pipe","schema_force_visible","visible","vl_code","FOREIGN KEY"
"visible_code_int","qwat_vl.visible.vl_code_int","qwat_vl","visible","vl_code_int","visible","vl_code_int","UNIQUE"
"pressurezone_label_1_visible","qwat_od.pressurezone.label_1_visible","qwat_od","pressurezone","label_1_visible","visible","vl_code_int","FOREIGN KEY"
"pressurezone_label_2_visible","qwat_od.pressurezone.label_2_visible","qwat_od","pressurezone","label_2_visible","visible","vl_code_int","FOREIGN KEY"
"district_label_1_visible","qwat_od.district.label_1_visible","qwat_od","district","label_1_visible","visible","vl_code_int","FOREIGN KEY"
"district_label_2_visible","qwat_od.district.label_2_visible","qwat_od","district","label_2_visible","visible","vl_code_int","FOREIGN KEY"
"printmap_label_1_visible","qwat_od.printmap.label_1_visible","qwat_od","printmap","label_1_visible","visible","vl_code_int","FOREIGN KEY"
"printmap_label_2_visible","qwat_od.printmap.label_2_visible","qwat_od","printmap","label_2_visible","visible","vl_code_int","FOREIGN KEY"
"network_element_label_1_visible","qwat_od.network_element.label_1_visible","qwat_od","network_element","label_1_visible","visible","vl_code_int","FOREIGN KEY"
"network_element_label_2_visible","qwat_od.network_element.label_2_visible","qwat_od","network_element","label_2_visible","visible","vl_code_int","FOREIGN KEY"
"pipe_label_1_visible","qwat_od.pipe.label_1_visible","qwat_od","pipe","label_1_visible","visible","vl_code_int","FOREIGN KEY"
"pipe_label_2_visible","qwat_od.pipe.label_2_visible","qwat_od","pipe","label_2_visible","visible","vl_code_int","FOREIGN KEY"
"cover_label_1_visible","qwat_od.cover.label_1_visible","qwat_od","cover","label_1_visible","visible","vl_code_int","FOREIGN KEY"
"cover_label_2_visible","qwat_od.cover.label_2_visible","qwat_od","cover","label_2_visible","visible","vl_code_int","FOREIGN KEY"
"remote_label_1_visible","qwat_od.remote.label_1_visible","qwat_od","remote","label_1_visible","visible","vl_code_int","FOREIGN KEY"
"remote_label_2_visible","qwat_od.remote.label_2_visible","qwat_od","remote","label_2_visible","visible","vl_code_int","FOREIGN KEY"
"leak_label_1_visible","qwat_od.leak.label_1_visible","qwat_od","leak","label_1_visible","visible","vl_code_int","FOREIGN KEY"
"leak_label_2_visible","qwat_od.leak.label_2_visible","qwat_od","leak","label_2_visible","visible","vl_code_int","FOREIGN KEY"
"vl_watertype_pk","qwat_vl.watertype.id","qwat_vl","watertype","id","watertype","id","PRIMARY KEY"
"pipe_fk_watertype","qwat_od.pipe.fk_watertype","qwat_od","pipe","fk_watertype","watertype","id","FOREIGN KEY"
"installation_fk_watertype","qwat_od.installation.fk_watertype","qwat_od","installation","fk_watertype","watertype","id","FOREIGN KEY"
"vl_worker_type_pk","qwat_vl.worker_type.id","qwat_vl","worker_type","id","worker_type","id","PRIMARY KEY"
"annotationline_pkey","qwat_dr.annotationline.id","qwat_dr","annotationline","id","annotationline","id","PRIMARY KEY"
"annotationpoint_pkey","qwat_dr.annotationpoint.id","qwat_dr","annotationpoint","id","annotationpoint","id","PRIMARY KEY"
"constructionpoint_pkey","qwat_dr.constructionpoint.id","qwat_dr","constructionpoint","id","constructionpoint","id","PRIMARY KEY"
"dimension_distance_pkey","qwat_dr.dimension_distance.id","qwat_dr","dimension_distance","id","dimension_distance","id","PRIMARY KEY"
"dimension_orientation_pkey","qwat_dr.dimension_orientation.id","qwat_dr","dimension_orientation","id","dimension_orientation","id","PRIMARY KEY"
"worker_pkey","qwat_od.worker.id","qwat_od","worker","id","worker","id","PRIMARY KEY"
"surveypoint_fk_worker","qwat_od.surveypoint.fk_worker","qwat_od","surveypoint","fk_worker","worker","id","FOREIGN KEY"
"consumptionzone_pkey","qwat_od.consumptionzone.id","qwat_od","consumptionzone","id","consumptionzone","id","PRIMARY KEY"
"pressurezone_fk_consumptionzone","qwat_od.pressurezone.fk_consumptionzone","qwat_od","pressurezone","fk_consumptionzone","consumptionzone","id","FOREIGN KEY"
"consumptionzone_name","qwat_od.consumptionzone.name","qwat_od","consumptionzone","name","consumptionzone","name","UNIQUE"
"distributor_pk","qwat_od.distributor.id","qwat_od","distributor","id","distributor","id","PRIMARY KEY"
"pressurezone_fk_distributor","qwat_od.pressurezone.fk_distributor","qwat_od","pressurezone","fk_distributor","distributor","id","FOREIGN KEY"
"element_fk_distributor","qwat_od.network_element.fk_distributor","qwat_od","network_element","fk_distributor","distributor","id","FOREIGN KEY"
"pipe_fk_distributor","qwat_od.pipe.fk_distributor","qwat_od","pipe","fk_distributor","distributor","id","FOREIGN KEY"
"remote_fk_distributor","qwat_od.remote.fk_distributor","qwat_od","remote","fk_distributor","distributor","id","FOREIGN KEY"
"distributor_name","qwat_od.distributor.name","qwat_od","distributor","name","distributor","name","UNIQUE"
"pressurezone_pkey","qwat_od.pressurezone.id","qwat_od","pressurezone","id","pressurezone","id","PRIMARY KEY"
"node_fk_pressurezone","qwat_od.node.fk_pressurezone","qwat_od","node","fk_pressurezone","pressurezone","id","FOREIGN KEY"
"pipe_fk_pressurezone","qwat_od.pipe.fk_pressurezone","qwat_od","pipe","fk_pressurezone","pressurezone","id","FOREIGN KEY"
"pressurezone_name","qwat_od.pressurezone.name","qwat_od","pressurezone","name","pressurezone","name","UNIQUE"
"district_pkey","qwat_od.district.id","qwat_od","district","id","district","id","PRIMARY KEY"
"printmap_fk_district","qwat_od.printmap.fk_district","qwat_od","printmap","fk_district","district","id","FOREIGN KEY"
"node_fk_district","qwat_od.node.fk_district","qwat_od","node","fk_district","district","id","FOREIGN KEY"
"pipe_fk_district","qwat_od.pipe.fk_district","qwat_od","pipe","fk_district","district","id","FOREIGN KEY"
"district_name","qwat_od.district.name","qwat_od","district","name","district","name","UNIQUE"
"folder_pkey","qwat_od.folder.id","qwat_od","folder","id","folder","id","PRIMARY KEY"
"element_fk_folder","qwat_od.network_element.fk_folder","qwat_od","network_element","fk_folder","folder","id","FOREIGN KEY"
"pipe_fk_folder","qwat_od.pipe.fk_folder","qwat_od","pipe","fk_folder","folder","id","FOREIGN KEY"
"surveypoint_fk_folder","qwat_od.surveypoint.fk_folder","qwat_od","surveypoint","fk_folder","folder","id","FOREIGN KEY"
"folder_identification","qwat_od.folder.identification","qwat_od","folder","identification","folder","identification","UNIQUE"
"printmap_pkey","qwat_od.printmap.id","qwat_od","printmap","id","printmap","id","PRIMARY KEY"
"protectionzone_pk","qwat_od.protectionzone.id","qwat_od","protectionzone","id","protectionzone","id","PRIMARY KEY"
"protectionzone_name","qwat_od.protectionzone.name","qwat_od","protectionzone","name","protectionzone","name","UNIQUE"
"node_pkey","qwat_od.node.id","qwat_od","node","id","node","id","PRIMARY KEY"
"network_element_id_fkey","qwat_od.network_element.id","qwat_od","network_element","id","node","id","FOREIGN KEY"
"pipe_fk_node_a","qwat_od.pipe.fk_node_a","qwat_od","pipe","fk_node_a","node","id","FOREIGN KEY"
"pipe_fk_node_b","qwat_od.pipe.fk_node_b","qwat_od","pipe","fk_node_b","node","id","FOREIGN KEY"
"network_element_pkey","qwat_od.network_element.id","qwat_od","network_element","id","network_element","id","PRIMARY KEY"
"hydrant_id_fkey","qwat_od.hydrant.id","qwat_od","hydrant","id","network_element","id","FOREIGN KEY"
"valve_id_fkey","qwat_od.valve.id","qwat_od","valve","id","network_element","id","FOREIGN KEY"
"meter_id_fkey","qwat_od.meter.id","qwat_od","meter","id","network_element","id","FOREIGN KEY"
"subscriber_id_fkey","qwat_od.subscriber.id","qwat_od","subscriber","id","network_element","id","FOREIGN KEY"
"installation_id_fkey","qwat_od.installation.id","qwat_od","installation","id","network_element","id","FOREIGN KEY"
"samplingpoint_id_fkey","qwat_od.samplingpoint.id","qwat_od","samplingpoint","id","network_element","id","FOREIGN KEY"
"hydrant_pkey","qwat_od.hydrant.id","qwat_od","hydrant","id","hydrant","id","PRIMARY KEY"
"pipe_pkey","qwat_od.pipe.id","qwat_od","pipe","id","pipe","id","PRIMARY KEY"
"pipe_fk_parent","qwat_od.pipe.fk_parent","qwat_od","pipe","fk_parent","pipe","id","FOREIGN KEY"
"crossing_pipe1","qwat_od.crossing._pipe1_id","qwat_od","crossing","_pipe1_id","pipe","id","FOREIGN KEY"
"crossing_pipe2","qwat_od.crossing._pipe2_id","qwat_od","crossing","_pipe2_id","pipe","id","FOREIGN KEY"
"part_fk_pipe","qwat_od.part.fk_pipe","qwat_od","part","fk_pipe","pipe","id","FOREIGN KEY"
"valve_fk_pipe","qwat_od.valve.fk_pipe","qwat_od","valve","fk_pipe","pipe","id","FOREIGN KEY"
"meter_fk_pipe","qwat_od.meter.fk_pipe","qwat_od","meter","fk_pipe","pipe","id","FOREIGN KEY"
"subscriber_fk_pipe","qwat_od.subscriber.fk_pipe","qwat_od","subscriber","fk_pipe","pipe","id","FOREIGN KEY"
"pump_fk_pipe_in","qwat_od.pump.fk_pipe_in","qwat_od","pump","fk_pipe_in","pipe","id","FOREIGN KEY"
"pump_fk_pipe_out","qwat_od.pump.fk_pipe_out","qwat_od","pump","fk_pipe_out","pipe","id","FOREIGN KEY"
"leak_fk_pipe","qwat_od.leak.fk_pipe","qwat_od","leak","fk_pipe","pipe","id","FOREIGN KEY"
"crossing_pkey","qwat_od.crossing.id","qwat_od","crossing","id","crossing","id","PRIMARY KEY"
"part_pkey","qwat_od.part.id","qwat_od","part","id","part","id","PRIMARY KEY"
"part_id_fkey","qwat_od.part.id","qwat_od","part","id","part","id","FOREIGN KEY"
"valve_pkey","qwat_od.valve.id","qwat_od","valve","id","valve","id","PRIMARY KEY"
"meter_pkey","qwat_od.meter.id","qwat_od","meter","id","meter","id","PRIMARY KEY"
"meter_reference_fk_meter","qwat_od.meter_reference.fk_meter","qwat_od","meter_reference","fk_meter","meter","id","FOREIGN KEY"
"meter_reference_pkey","qwat_od.meter_reference.id","qwat_od","meter_reference","id","meter_reference","id","PRIMARY KEY"
"subscriber_pkey","qwat_od.subscriber.id","qwat_od","subscriber","id","subscriber","id","PRIMARY KEY"
"subscriber_reference_fk_subscriber","qwat_od.subscriber_reference.fk_subscriber","qwat_od","subscriber_reference","fk_subscriber","subscriber","id","FOREIGN KEY"
"subscriber_reference_pkey","qwat_od.subscriber_reference.id","qwat_od","subscriber_reference","id","subscriber_reference","id","PRIMARY KEY"
"installation_pkey","qwat_od.installation.id","qwat_od","installation","id","installation","id","PRIMARY KEY"
"installation_fk_parent","qwat_od.installation.fk_parent","qwat_od","installation","fk_parent","installation","id","FOREIGN KEY"
"cover_fk_installation","qwat_od.cover.fk_installation","qwat_od","cover","fk_installation","installation","id","FOREIGN KEY"
"chamber_id_fkey","qwat_od.chamber.id","qwat_od","chamber","id","installation","id","FOREIGN KEY"
"pressurecontrol_id_fkey","qwat_od.pressurecontrol.id","qwat_od","pressurecontrol","id","installation","id","FOREIGN KEY"
"pump_id_fkey","qwat_od.pump.id","qwat_od","pump","id","installation","id","FOREIGN KEY"
"source_id_fkey","qwat_od.source.id","qwat_od","source","id","installation","id","FOREIGN KEY"
"tank_id_fkey","qwat_od.tank.id","qwat_od","tank","id","installation","id","FOREIGN KEY"
"treatment_id_fkey","qwat_od.treatment.id","qwat_od","treatment","id","installation","id","FOREIGN KEY"
"cover_pkey","qwat_od.cover.id","qwat_od","cover","id","cover","id","PRIMARY KEY"
"chamber_pkey","qwat_od.chamber.id","qwat_od","chamber","id","chamber","id","PRIMARY KEY"
"pressurecontrol_pkey","qwat_od.pressurecontrol.id","qwat_od","pressurecontrol","id","pressurecontrol","id","PRIMARY KEY"
"pump_pkey","qwat_od.pump.id","qwat_od","pump","id","pump","id","PRIMARY KEY"
"source_pkey","qwat_od.source.id","qwat_od","source","id","source","id","PRIMARY KEY"
"tank_pkey","qwat_od.tank.id","qwat_od","tank","id","tank","id","PRIMARY KEY"
"treatment_pkey","qwat_od.treatment.id","qwat_od","treatment","id","treatment","id","PRIMARY KEY"
"remote_pkey","qwat_od.remote.id","qwat_od","remote","id","remote","id","PRIMARY KEY"
"samplingpoint_pkey","qwat_od.samplingpoint.id","qwat_od","samplingpoint","id","samplingpoint","id","PRIMARY KEY"
"surveypoint_pkey","qwat_od.surveypoint.id","qwat_od","surveypoint","id","surveypoint","id","PRIMARY KEY"
"surveypoint_id_fkey","qwat_od.surveypoint.id","qwat_od","surveypoint","id","surveypoint","id","FOREIGN KEY"
"leak_pkey","qwat_od.leak.id","qwat_od","leak","id","leak","id","PRIMARY KEY"
"vw_installation_tank"," SELECT installation.id,
    installation.name,
    installation.fk_parent,
    installation.fk_remote,
    installation.fk_watertype,
    installation.parcel,
    installation.eca,
    installation.open_water_surface,
    installation.geometry_polygon,
    tank.fk_overflow,
    tank.fk_tank_firestorage,
    tank.storage_total,
    tank.storage_supply,
    tank.storage_fire,
    tank.altitude_overflow,
    tank.altitude_apron,
    tank.height_max,
    tank.fire_valve,
    tank.fire_remote,
    tank._litrepercm,
    tank.cistern1_fk_type,
    tank.cistern1_dimension_1,
    tank.cistern1_dimension_2,
    tank.cistern1_storage,
    tank._cistern1_litrepercm,
    tank.cistern2_fk_type,
    tank.cistern2_dimension_1,
    tank.cistern2_dimension_2,
    tank.cistern2_storage,
    tank._cistern2_litrepercm
   FROM (qwat_od.tank tank
     JOIN qwat_od.installation installation ON ((tank.id = installation.id)));"
"vw_installation_treatment"," SELECT installation.id,
    installation.name,
    installation.fk_parent,
    installation.fk_remote,
    installation.fk_watertype,
    installation.parcel,
    installation.eca,
    installation.open_water_surface,
    installation.geometry_polygon,
    treatment.sanitization_uv,
    treatment.sanitization_chlorine_liquid,
    treatment.sanitization_chlorine_gazeous,
    treatment.sanitization_ozone,
    treatment.filtration_membrane,
    treatment.filtration_sandorgravel,
    treatment.flocculation,
    treatment.activatedcharcoal,
    treatment.settling,
    treatment.treatment_capacity
   FROM (qwat_od.treatment treatment
     JOIN qwat_od.installation installation ON ((treatment.id = installation.id)));"
"vw_installation_chamber"," SELECT installation.id,
    installation.name,
    installation.fk_parent,
    installation.fk_remote,
    installation.fk_watertype,
    installation.parcel,
    installation.eca,
    installation.open_water_surface,
    installation.geometry_polygon,
    chamber.networkseparation,
    chamber.flow_meter,
    chamber.water_meter,
    chamber.manometer,
    chamber.depth,
    chamber.no_valves
   FROM (qwat_od.chamber chamber
     JOIN qwat_od.installation installation ON ((chamber.id = installation.id)));"
"vw_pipe_schema_visibleitems"," SELECT pipe.id,
    pipe.fk_parent,
    pipe.fk_material,
    pipe._length2d,
    pipe._length3d,
    pipe.tunnel_or_bridge,
    pipe.schema_force_visible,
    pipe.geometry_alt2 AS geometry,
    pipe._valve_count,
    pipe._valve_closed
   FROM ((qwat_od.pipe
     JOIN qwat_vl.status ON ((pipe.fk_status = status.id)))
     JOIN qwat_vl.pipe_function ON ((pipe.fk_function = pipe_function.id)))
  WHERE ((COALESCE(pipe.schema_force_visible, pipe_function.schema_visible) IS TRUE) AND (status.active IS TRUE));"
"vw_pipe_schema_merged"," WITH RECURSIVE pipe_find_parent(depth_level, id, groupid, geometry, _length2d, _length3d, tunnel_or_bridge, _valve_count, _valve_closed) AS (
         SELECT 1 AS depth_level,
            pipe.id,
            pipe.id,
            pipe.geometry,
            pipe._length2d,
            pipe._length3d,
            pipe.tunnel_or_bridge,
            pipe._valve_count,
            pipe._valve_closed
           FROM qwat_od.vw_pipe_schema_visibleitems pipe
          WHERE (pipe.fk_parent IS NULL)
        UNION ALL
         SELECT (fp.depth_level + 1) AS depth_level,
            pipe.id,
            fp.groupid,
            pipe.geometry,
            pipe._length2d,
            pipe._length3d,
            pipe.tunnel_or_bridge,
            pipe._valve_count,
            pipe._valve_closed
           FROM (pipe_find_parent fp
             JOIN qwat_od.vw_pipe_schema_visibleitems pipe ON (((fp.id = pipe.fk_parent) AND (fp.depth_level < 20))))
        )
 SELECT pipe_find_parent.groupid AS id,
    (st_linemerge(st_union(pipe_find_parent.geometry)))::geometry(LineStringZ,21781) AS geometry,
    count(pipe_find_parent.groupid) AS number_of_pipe,
    sum(pipe_find_parent._length2d) AS _length2d,
    sum(pipe_find_parent._length3d) AS _length3d,
    bool_or(pipe_find_parent.tunnel_or_bridge) AS tunnel_or_bridge,
    sum(pipe_find_parent._valve_count) AS _valve_count,
    bool_or(pipe_find_parent._valve_closed) AS _valve_closed
   FROM pipe_find_parent
  GROUP BY pipe_find_parent.groupid;"
"vw_pipe_schema"," SELECT pipe.id,
    pipe.fk_function,
    pipe.fk_installmethod,
    pipe.fk_material,
    pipe.fk_distributor,
    pipe.fk_precision,
    pipe.fk_protection,
    pipe.fk_status,
    pipe.fk_folder,
    pipe.year,
    pipe.year_end,
    pipe.pressure_nominal,
    pipe.remark,
    pipe.fk_district,
    pipe.fk_pressurezone,
    pipe.fk_printmap,
    pipe._printmaps,
    pipe.label_2_visible,
    pipe.label_2_text,
    vw_pipe_schema_merged._length2d,
    vw_pipe_schema_merged._length3d,
    vw_pipe_schema_merged.number_of_pipe,
    vw_pipe_schema_merged.tunnel_or_bridge,
    vw_pipe_schema_merged._valve_count,
    vw_pipe_schema_merged._valve_closed,
    pressurezone.name AS _pressurezone,
    pressurezone.colorcode AS _pressurezone_colorcode,
    vw_pipe_schema_merged.geometry
   FROM ((qwat_od.vw_pipe_schema_merged
     JOIN qwat_od.pipe ON ((pipe.id = vw_pipe_schema_merged.id)))
     LEFT JOIN qwat_od.pressurezone ON ((pipe.fk_pressurezone = pressurezone.id)));"
"vw_pipe_schema_error"," WITH RECURSIVE pipe_find_parent_error(path, depth_level, id, groupid, geometry) AS (
         SELECT (pipe.id)::character varying AS path,
            1 AS depth_level,
            pipe.id,
            pipe.id,
            pipe.geometry
           FROM qwat_od.vw_pipe_schema_visibleitems pipe
          WHERE (pipe.fk_parent IS NULL)
        UNION ALL
         SELECT (((fp.path)::text || '<-'::text) || pipe.id),
            (fp.depth_level + 1) AS depth_level,
            pipe.id,
            fp.groupid,
            pipe.geometry
           FROM (pipe_find_parent_error fp
             JOIN qwat_od.vw_pipe_schema_visibleitems pipe ON (((fp.id = pipe.fk_parent) AND (fp.depth_level < 20))))
        )
 SELECT foo.groupid,
    foo.geometry,
    foo.error_desc
   FROM ( SELECT pipe_find_parent_error.groupid,
            st_multi(st_linemerge(st_union(pipe_find_parent_error.geometry))) AS geometry,
            'lines cannot be joined'::character varying AS error_desc
           FROM pipe_find_parent_error
          GROUP BY pipe_find_parent_error.groupid) foo
  WHERE (geometrytype(st_collectionhomogenize(foo.geometry)) <> 'LINESTRING'::text)
UNION
 SELECT pipe_find_parent_error.groupid,
    pipe_find_parent_error.geometry,
    'circular referencing loop'::character varying AS error_desc
   FROM pipe_find_parent_error
  WHERE (pipe_find_parent_error.depth_level > 19);"
"vw_installation_source"," SELECT installation.id,
    installation.name,
    installation.fk_parent,
    installation.fk_remote,
    installation.fk_watertype,
    installation.parcel,
    installation.eca,
    installation.open_water_surface,
    installation.geometry_polygon,
    source.fk_source_type,
    source.fk_source_quality,
    source.flow_lowest,
    source.flow_average,
    source.flow_concession,
    source.contract_end,
    source.gathering_chamber
   FROM (qwat_od.source source
     JOIN qwat_od.installation installation ON ((source.id = installation.id)));"
"vw_installation_pump"," SELECT installation.id,
    installation.name,
    installation.fk_parent,
    installation.fk_remote,
    installation.fk_watertype,
    installation.parcel,
    installation.eca,
    installation.open_water_surface,
    installation.geometry_polygon,
    pump.fk_pump_type,
    pump.fk_pipe_in,
    pump.fk_pipe_out,
    pump.fk_pump_operating,
    pump.no_pumps,
    pump.rejected_flow,
    pump.manometric_height
   FROM (qwat_od.pump pump
     JOIN qwat_od.installation installation ON ((pump.id = installation.id)));"
"vw_installation_pressurecontrol"," SELECT installation.id,
    installation.name,
    installation.fk_parent,
    installation.fk_remote,
    installation.fk_watertype,
    installation.parcel,
    installation.eca,
    installation.open_water_surface,
    installation.geometry_polygon,
    pressurecontrol.fk_pressurecontrol_type
   FROM (qwat_od.pressurecontrol pressurecontrol
     JOIN qwat_od.installation installation ON ((pressurecontrol.id = installation.id)));"
"vw_qwat_installation"," SELECT
        CASE
            WHEN (source.id IS NOT NULL) THEN 'source'::qwat_od.installation_type
            WHEN (pump.id IS NOT NULL) THEN 'pump'::qwat_od.installation_type
            WHEN (tank.id IS NOT NULL) THEN 'tank'::qwat_od.installation_type
            WHEN (treatment.id IS NOT NULL) THEN 'treatment'::qwat_od.installation_type
            WHEN (chamber.id IS NOT NULL) THEN 'chamber'::qwat_od.installation_type
            WHEN (pressurecontrol.id IS NOT NULL) THEN 'pressurecontrol'::qwat_od.installation_type
            ELSE 'installation'::qwat_od.installation_type
        END AS installation_type,
    installation.id,
    installation.name,
    installation.fk_parent,
    installation.fk_remote,
    installation.fk_watertype,
    installation.parcel,
    installation.eca,
    installation.open_water_surface,
    installation.geometry_polygon,
    source.fk_source_type,
    source.fk_source_quality,
    source.flow_lowest,
    source.flow_average,
    source.flow_concession,
    source.contract_end,
    source.gathering_chamber,
    pump.fk_pump_type,
    pump.fk_pipe_in,
    pump.fk_pipe_out,
    pump.fk_pump_operating,
    pump.no_pumps,
    pump.rejected_flow,
    pump.manometric_height,
    tank.fk_overflow,
    tank.fk_tank_firestorage,
    tank.storage_total,
    tank.storage_supply,
    tank.storage_fire,
    tank.altitude_overflow,
    tank.altitude_apron,
    tank.height_max,
    tank.fire_valve,
    tank.fire_remote,
    tank._litrepercm,
    tank.cistern1_fk_type,
    tank.cistern1_dimension_1,
    tank.cistern1_dimension_2,
    tank.cistern1_storage,
    tank._cistern1_litrepercm,
    tank.cistern2_fk_type,
    tank.cistern2_dimension_1,
    tank.cistern2_dimension_2,
    tank.cistern2_storage,
    tank._cistern2_litrepercm,
    treatment.sanitization_uv,
    treatment.sanitization_chlorine_liquid,
    treatment.sanitization_chlorine_gazeous,
    treatment.sanitization_ozone,
    treatment.filtration_membrane,
    treatment.filtration_sandorgravel,
    treatment.flocculation,
    treatment.activatedcharcoal,
    treatment.settling,
    treatment.treatment_capacity,
    chamber.networkseparation,
    chamber.flow_meter,
    chamber.water_meter,
    chamber.manometer,
    chamber.depth,
    chamber.no_valves,
    pressurecontrol.fk_pressurecontrol_type
   FROM ((((((qwat_od.installation installation
     LEFT JOIN qwat_od.source source ON ((installation.id = source.id)))
     LEFT JOIN qwat_od.pump pump ON ((installation.id = pump.id)))
     LEFT JOIN qwat_od.tank tank ON ((installation.id = tank.id)))
     LEFT JOIN qwat_od.treatment treatment ON ((installation.id = treatment.id)))
     LEFT JOIN qwat_od.chamber chamber ON ((installation.id = chamber.id)))
     LEFT JOIN qwat_od.pressurecontrol pressurecontrol ON ((installation.id = pressurecontrol.id)));"
"vw_remote"," SELECT distributor.name AS distributor,
    status.value_fr AS status,
    precision.value_fr AS precision,
    pipe_material._displayname_fr AS material,
    remote.identification,
    remote.year,
    remote.origin,
    remote.destination,
    remote.folder,
    remote.plan,
    remote.remark,
    remote.label_1_visible,
    remote.label_1_x,
    remote.label_1_y,
    remote.label_1_rotation,
    remote.label_1_text,
    remote.label_2_visible,
    remote.label_2_x,
    remote.label_2_y,
    remote.label_2_rotation,
    remote.label_2_text,
    remote.geometry
   FROM ((((qwat_od.remote
     JOIN qwat_od.distributor ON ((remote.fk_distributor = distributor.id)))
     JOIN qwat_vl.status ON ((remote.fk_status = status.id)))
     JOIN qwat_vl.precision ON ((remote.fk_precision = precision.id)))
     JOIN qwat_vl.pipe_material ON ((remote.fk_material = pipe_material.id)));"
"vw_element_meter"," SELECT element.id,
    element.fk_district,
    element.fk_pressurezone,
    element.fk_printmap,
    element._printmaps,
    element._geometry_alt1_used,
    element._geometry_alt2_used,
    element._pipe_node_type,
    element._pipe_orientation,
    element._pipe_schema_visible,
    element.geometry,
    element.geometry_alt1,
    element.geometry_alt2,
    element.update_geometry_alt1,
    element.update_geometry_alt2,
    element.identification,
    element.fk_distributor,
    element.fk_status,
    element.fk_folder,
    element.fk_locationtype,
    element.fk_precision,
    element.fk_precisionalti,
    element.fk_object_reference,
    element.altitude,
    element.year,
    element.year_end,
    element.orientation,
    element.remark,
    element.schema_force_visible,
    element.label_1_visible,
    element.label_1_x,
    element.label_1_y,
    element.label_1_rotation,
    element.label_1_text,
    element.label_2_visible,
    element.label_2_x,
    element.label_2_y,
    element.label_2_rotation,
    element.label_2_text,
    meter.fk_pipe,
    meter.parcel
   FROM (qwat_od.meter meter
     JOIN qwat_od.vw_node_element element ON ((meter.id = element.id)));"
"vw_node_element"," SELECT node.id,
    node.fk_district,
    node.fk_pressurezone,
    node.fk_printmap,
    node._printmaps,
    node._geometry_alt1_used,
    node._geometry_alt2_used,
    node._pipe_node_type,
    node._pipe_orientation,
    node._pipe_schema_visible,
    node.geometry,
    node.geometry_alt1,
    node.geometry_alt2,
    node.update_geometry_alt1,
    node.update_geometry_alt2,
    element.identification,
    element.fk_distributor,
    element.fk_status,
    element.fk_folder,
    element.fk_locationtype,
    element.fk_precision,
    element.fk_precisionalti,
    element.fk_object_reference,
    element.altitude,
    element.year,
    element.year_end,
    COALESCE(element.orientation, node._pipe_orientation) AS orientation,
    element.remark,
    element.schema_force_visible,
    element.label_1_visible,
    element.label_1_x,
    element.label_1_y,
    element.label_1_rotation,
    element.label_1_text,
    element.label_2_visible,
    element.label_2_x,
    element.label_2_y,
    element.label_2_rotation,
    element.label_2_text
   FROM (qwat_od.network_element element
     JOIN qwat_od.node node ON ((element.id = node.id)));"
"vw_pipe"," SELECT pipe.id,
    pipe.fk_parent,
    pipe.fk_function,
    pipe.fk_installmethod,
    pipe.fk_material,
    pipe.fk_distributor,
    pipe.fk_precision,
    pipe.fk_protection,
    pipe.fk_status,
    pipe.fk_folder,
    pipe.schema_force_visible,
    pipe.year,
    pipe.tunnel_or_bridge,
    pipe.pressure_nominal,
    pipe.label_1_text,
    pipe.remark,
    pipe._valve_count,
    pipe._valve_closed,
    pipe.fk_node_a,
    pipe.fk_node_b,
    pipe.fk_district,
    pipe.fk_pressurezone,
    pipe.fk_printmap,
    pipe._length2d,
    pipe._length3d,
    pipe._diff_elevation,
    pipe._printmaps,
    (st_force2d(pipe.geometry))::geometry(LineString,21781) AS st_force2d,
    COALESCE(pipe.schema_force_visible, pipe_function.schema_visible) AS _schema_visible,
    pipe_function.value_fr AS _function,
    pipe_function.code_sire AS _function_code_sire,
    pipe_installmethod.value_fr AS _installmethod,
    pipe_material._displayname_fr AS _material_name,
    pipe_material.value_fr AS _material_longname,
    pipe_material.diameter AS _material_diameter,
    pipe_material.diameter_internal AS _material_diameter_internal,
    pipe_material.diameter_external AS _material_diameter_external,
    pipe_material.code_sire AS _material_code_sire,
    distributor.name AS _distributor,
    precision.value_fr AS _precision,
    pipe_protection.value_fr AS _protection,
    status.value_fr AS _status,
    status.active AS _status_active,
    pressurezone.name AS _pressurezone,
    pressurezone.colorcode AS _pressurezone_colorcode,
    folder.identification AS folder
   FROM (((((((((((qwat_od.pipe
     JOIN qwat_vl.pipe_function ON ((pipe.fk_function = pipe_function.id)))
     JOIN qwat_vl.pipe_installmethod ON ((pipe.fk_installmethod = pipe_installmethod.id)))
     JOIN qwat_vl.pipe_material ON ((pipe.fk_material = pipe_material.id)))
     JOIN qwat_od.distributor ON ((pipe.fk_distributor = distributor.id)))
     JOIN qwat_vl.precision ON ((pipe.fk_precision = precision.id)))
     LEFT JOIN qwat_vl.pipe_protection ON ((pipe.fk_protection = pipe_protection.id)))
     JOIN qwat_vl.status ON ((pipe.fk_status = status.id)))
     LEFT JOIN qwat_od.pressurezone ON ((pipe.fk_pressurezone = pressurezone.id)))
     LEFT JOIN qwat_od.node node_a ON ((pipe.fk_node_a = node_a.id)))
     LEFT JOIN qwat_od.node node_b ON ((pipe.fk_node_b = node_b.id)))
     LEFT JOIN qwat_od.folder ON ((pipe.fk_folder = folder.id)));"
"vw_qwat_node"," SELECT
        CASE
            WHEN (element.id IS NOT NULL) THEN 'element'::qwat_od.node_type
            ELSE 'node'::qwat_od.node_type
        END AS node_type,
    node.id,
    node.fk_district,
    node.fk_pressurezone,
    node.fk_printmap,
    node._printmaps,
    node._geometry_alt1_used,
    node._geometry_alt2_used,
    node._pipe_node_type,
    node._pipe_orientation,
    node._pipe_schema_visible,
    node.geometry,
    node.geometry_alt1,
    node.geometry_alt2,
    node.update_geometry_alt1,
    node.update_geometry_alt2,
    element.identification,
    element.fk_distributor,
    element.fk_status,
    element.fk_folder,
    element.fk_locationtype,
    element.fk_precision,
    element.fk_precisionalti,
    element.fk_object_reference,
    element.altitude,
    element.year,
    element.year_end,
    COALESCE(element.orientation, node._pipe_orientation) AS orientation,
    element.remark,
    element.schema_force_visible,
    element.label_1_visible,
    element.label_1_x,
    element.label_1_y,
    element.label_1_rotation,
    element.label_1_text,
    element.label_2_visible,
    element.label_2_x,
    element.label_2_y,
    element.label_2_rotation,
    element.label_2_text
   FROM (qwat_od.node node
     LEFT JOIN qwat_od.network_element element ON ((node.id = element.id)));"
"vw_leak"," SELECT leak_cause.value_fr AS cause,
    leak.widespread_damage,
    leak.detection_date,
    leak.repair_date,
    leak._repaired,
    leak.address,
    leak.pipe_replaced,
    leak.description,
    leak.repair,
    leak.geometry
   FROM (qwat_od.leak
     JOIN qwat_vl.leak_cause ON ((leak.fk_cause = leak_cause.id)));"
"vw_consumptionzone"," SELECT co.id,
    co.name,
    co.population,
    co.colorcode,
    pr._sum_population,
    pr._sum_subscriber,
    pr.geometry
   FROM qwat_od.consumptionzone co,
    ( SELECT pr_1.fk_consumptionzone,
            sum(pr_1.population) AS _sum_population,
            sum(pr_1.subscriber) AS _sum_subscriber,
            (st_multi(st_collectionhomogenize(st_union(pr_1.geometry))))::geometry(MultiPolygon,21781) AS geometry
           FROM qwat_od.pressurezone pr_1
          GROUP BY pr_1.fk_consumptionzone) pr
  WHERE (pr.fk_consumptionzone = co.id);"
"vw_element_subscriber"," SELECT element.id,
    element.fk_district,
    element.fk_pressurezone,
    element.fk_printmap,
    element._printmaps,
    element._geometry_alt1_used,
    element._geometry_alt2_used,
    element._pipe_node_type,
    element._pipe_orientation,
    element._pipe_schema_visible,
    element.geometry,
    element.geometry_alt1,
    element.geometry_alt2,
    element.update_geometry_alt1,
    element.update_geometry_alt2,
    element.identification,
    element.fk_distributor,
    element.fk_status,
    element.fk_folder,
    element.fk_locationtype,
    element.fk_precision,
    element.fk_precisionalti,
    element.fk_object_reference,
    element.altitude,
    element.year,
    element.year_end,
    element.orientation,
    element.remark,
    element.schema_force_visible,
    element.label_1_visible,
    element.label_1_x,
    element.label_1_y,
    element.label_1_rotation,
    element.label_1_text,
    element.label_2_visible,
    element.label_2_x,
    element.label_2_y,
    element.label_2_rotation,
    element.label_2_text,
    subscriber.fk_subscriber_type,
    subscriber.fk_pipe,
    subscriber.parcel,
    subscriber.flow_current,
    subscriber.flow_planned
   FROM (qwat_od.subscriber subscriber
     JOIN qwat_od.vw_node_element element ON ((subscriber.id = element.id)));"
"vw_printmap"," SELECT printmap.id,
    printmap.name,
    printmap.fk_district,
    printmap.remark,
    printmap.version_date,
    printmap.x_min,
    printmap.y_min,
    printmap.x_max,
    printmap.y_max,
    printmap.geometry,
    printmap.label_1_visible,
    printmap.label_1_x,
    printmap.label_1_y,
    printmap.label_1_rotation,
    printmap.label_1_text,
    printmap.label_2_visible,
    printmap.label_2_x,
    printmap.label_2_y,
    printmap.label_2_rotation,
    printmap.label_2_text,
    (((district.name)::text || ' '::text) || (printmap.name)::text) AS _longname,
    district.name AS _district,
    district.shortname AS _district_short
   FROM (qwat_od.printmap
     JOIN qwat_od.district ON ((printmap.fk_district = district.id)));"
"vw_element_part"," SELECT element.id,
    element.fk_district,
    element.fk_pressurezone,
    element.fk_printmap,
    element._printmaps,
    element._geometry_alt1_used,
    element._geometry_alt2_used,
    element._pipe_node_type,
    element._pipe_orientation,
    element._pipe_schema_visible,
    element.geometry,
    element.geometry_alt1,
    element.geometry_alt2,
    element.update_geometry_alt1,
    element.update_geometry_alt2,
    element.identification,
    element.fk_distributor,
    element.fk_status,
    element.fk_folder,
    element.fk_locationtype,
    element.fk_precision,
    element.fk_precisionalti,
    element.fk_object_reference,
    element.altitude,
    element.year,
    element.year_end,
    element.orientation,
    element.remark,
    element.schema_force_visible,
    element.label_1_visible,
    element.label_1_x,
    element.label_1_y,
    element.label_1_rotation,
    element.label_1_text,
    element.label_2_visible,
    element.label_2_x,
    element.label_2_y,
    element.label_2_rotation,
    element.label_2_text,
    part.fk_part_type,
    part.fk_pipe
   FROM (qwat_od.part part
     JOIN qwat_od.vw_node_element element ON ((part.id = element.id)));"
"vw_protectionzone"," SELECT protectionzone.id,
    protectionzone.fk_type,
    protectionzone.name,
    protectionzone.validated,
    protectionzone.date,
    protectionzone.agent,
    protectionzone.geometry,
    protectionzone_type.value_fr AS _type_long,
    protectionzone_type.short_fr AS _type
   FROM (qwat_od.protectionzone
     JOIN qwat_vl.protectionzone_type ON ((protectionzone.fk_type = protectionzone_type.id)));"
"vw_export_installation"," SELECT vw_element_installation.id,
    vw_element_installation.fk_district,
    vw_element_installation.fk_pressurezone,
    vw_element_installation.fk_printmap,
    vw_element_installation._printmaps,
    vw_element_installation._geometry_alt1_used,
    vw_element_installation._geometry_alt2_used,
    vw_element_installation._pipe_node_type,
    vw_element_installation._pipe_orientation,
    vw_element_installation._pipe_schema_visible,
    vw_element_installation.geometry,
    vw_element_installation.geometry_alt1,
    vw_element_installation.geometry_alt2,
    vw_element_installation.update_geometry_alt1,
    vw_element_installation.update_geometry_alt2,
    vw_element_installation.identification,
    vw_element_installation.fk_distributor,
    vw_element_installation.fk_status,
    vw_element_installation.fk_folder,
    vw_element_installation.fk_locationtype,
    vw_element_installation.fk_precision,
    vw_element_installation.fk_precisionalti,
    vw_element_installation.fk_object_reference,
    vw_element_installation.altitude,
    vw_element_installation.year,
    vw_element_installation.year_end,
    vw_element_installation.orientation,
    vw_element_installation.remark,
    vw_element_installation.schema_force_visible,
    vw_element_installation.label_1_visible,
    vw_element_installation.label_1_x,
    vw_element_installation.label_1_y,
    vw_element_installation.label_1_rotation,
    vw_element_installation.label_1_text,
    vw_element_installation.label_2_visible,
    vw_element_installation.label_2_x,
    vw_element_installation.label_2_y,
    vw_element_installation.label_2_rotation,
    vw_element_installation.label_2_text,
    vw_element_installation.installation_type,
    vw_element_installation.name,
    vw_element_installation.fk_parent,
    vw_element_installation.fk_remote,
    vw_element_installation.fk_watertype,
    vw_element_installation.parcel,
    vw_element_installation.eca,
    vw_element_installation.open_water_surface,
    vw_element_installation.geometry_polygon,
    vw_element_installation.fk_source_type,
    vw_element_installation.fk_source_quality,
    vw_element_installation.flow_lowest,
    vw_element_installation.flow_average,
    vw_element_installation.flow_concession,
    vw_element_installation.contract_end,
    vw_element_installation.gathering_chamber,
    vw_element_installation.fk_pump_type,
    vw_element_installation.fk_pipe_in,
    vw_element_installation.fk_pipe_out,
    vw_element_installation.fk_pump_operating,
    vw_element_installation.no_pumps,
    vw_element_installation.rejected_flow,
    vw_element_installation.manometric_height,
    vw_element_installation.fk_overflow,
    vw_element_installation.fk_tank_firestorage,
    vw_element_installation.storage_total,
    vw_element_installation.storage_supply,
    vw_element_installation.storage_fire,
    vw_element_installation.altitude_overflow,
    vw_element_installation.altitude_apron,
    vw_element_installation.height_max,
    vw_element_installation.fire_valve,
    vw_element_installation.fire_remote,
    vw_element_installation._litrepercm,
    vw_element_installation.cistern1_fk_type,
    vw_element_installation.cistern1_dimension_1,
    vw_element_installation.cistern1_dimension_2,
    vw_element_installation.cistern1_storage,
    vw_element_installation._cistern1_litrepercm,
    vw_element_installation.cistern2_fk_type,
    vw_element_installation.cistern2_dimension_1,
    vw_element_installation.cistern2_dimension_2,
    vw_element_installation.cistern2_storage,
    vw_element_installation._cistern2_litrepercm,
    vw_element_installation.sanitization_uv,
    vw_element_installation.sanitization_chlorine_liquid,
    vw_element_installation.sanitization_chlorine_gazeous,
    vw_element_installation.sanitization_ozone,
    vw_element_installation.filtration_membrane,
    vw_element_installation.filtration_sandorgravel,
    vw_element_installation.flocculation,
    vw_element_installation.activatedcharcoal,
    vw_element_installation.settling,
    vw_element_installation.treatment_capacity,
    vw_element_installation.networkseparation,
    vw_element_installation.flow_meter,
    vw_element_installation.water_meter,
    vw_element_installation.manometer,
    vw_element_installation.depth,
    vw_element_installation.no_valves,
    vw_element_installation.fk_pressurecontrol_type,
    status.vl_active AS status_vl_active,
    status.short_fr AS status_short_fr,
    status.short_en AS status_short_en,
    status.short_ro AS status_short_ro,
    status.value_fr AS status_value_fr,
    status.value_en AS status_value_en,
    status.value_ro AS status_value_ro,
    status.description_fr AS status_description_fr,
    status.description_en AS status_description_en,
    status.description_ro AS status_description_ro,
    status.active AS status_active,
    status.code_sire AS status_code_sire,
    watertype.vl_active AS watertype_vl_active,
    watertype.short_fr AS watertype_short_fr,
    watertype.short_en AS watertype_short_en,
    watertype.short_ro AS watertype_short_ro,
    watertype.value_fr AS watertype_value_fr,
    watertype.value_en AS watertype_value_en,
    watertype.value_ro AS watertype_value_ro,
    watertype.description_fr AS watertype_description_fr,
    watertype.description_en AS watertype_description_en,
    watertype.description_ro AS watertype_description_ro,
    watertype.code_sire AS watertype_code_sire,
    pump_type.vl_active AS pump_type_vl_active,
    pump_type.short_fr AS pump_type_short_fr,
    pump_type.short_en AS pump_type_short_en,
    pump_type.short_ro AS pump_type_short_ro,
    pump_type.value_fr AS pump_type_value_fr,
    pump_type.value_en AS pump_type_value_en,
    pump_type.value_ro AS pump_type_value_ro,
    pump_type.description_fr AS pump_type_description_fr,
    pump_type.description_en AS pump_type_description_en,
    pump_type.description_ro AS pump_type_description_ro,
    pump_type.code_sire AS pump_type_code_sire,
    object_reference.vl_active AS object_reference_vl_active,
    object_reference.short_fr AS object_reference_short_fr,
    object_reference.short_en AS object_reference_short_en,
    object_reference.short_ro AS object_reference_short_ro,
    object_reference.value_fr AS object_reference_value_fr,
    object_reference.value_en AS object_reference_value_en,
    object_reference.value_ro AS object_reference_value_ro,
    object_reference.description_fr AS object_reference_description_fr,
    object_reference.description_en AS object_reference_description_en,
    object_reference.description_ro AS object_reference_description_ro,
    cistern2.vl_active AS cistern2_vl_active,
    cistern2.short_fr AS cistern2_short_fr,
    cistern2.short_en AS cistern2_short_en,
    cistern2.short_ro AS cistern2_short_ro,
    cistern2.value_fr AS cistern2_value_fr,
    cistern2.value_en AS cistern2_value_en,
    cistern2.value_ro AS cistern2_value_ro,
    cistern2.description_fr AS cistern2_description_fr,
    cistern2.description_en AS cistern2_description_en,
    cistern2.description_ro AS cistern2_description_ro,
    precision.vl_active AS precision_vl_active,
    precision.short_fr AS precision_short_fr,
    precision.short_en AS precision_short_en,
    precision.short_ro AS precision_short_ro,
    precision.value_fr AS precision_value_fr,
    precision.value_en AS precision_value_en,
    precision.value_ro AS precision_value_ro,
    precision.description_fr AS precision_description_fr,
    precision.description_en AS precision_description_en,
    precision.description_ro AS precision_description_ro,
    precision.code_sire AS precision_code_sire,
    tank_firestorage.vl_active AS tank_firestorage_vl_active,
    tank_firestorage.short_fr AS tank_firestorage_short_fr,
    tank_firestorage.short_en AS tank_firestorage_short_en,
    tank_firestorage.short_ro AS tank_firestorage_short_ro,
    tank_firestorage.value_fr AS tank_firestorage_value_fr,
    tank_firestorage.value_en AS tank_firestorage_value_en,
    tank_firestorage.value_ro AS tank_firestorage_value_ro,
    tank_firestorage.description_fr AS tank_firestorage_description_fr,
    tank_firestorage.description_en AS tank_firestorage_description_en,
    tank_firestorage.description_ro AS tank_firestorage_description_ro,
    cistern1.vl_active AS cistern1_vl_active,
    cistern1.short_fr AS cistern1_short_fr,
    cistern1.short_en AS cistern1_short_en,
    cistern1.short_ro AS cistern1_short_ro,
    cistern1.value_fr AS cistern1_value_fr,
    cistern1.value_en AS cistern1_value_en,
    cistern1.value_ro AS cistern1_value_ro,
    cistern1.description_fr AS cistern1_description_fr,
    cistern1.description_en AS cistern1_description_en,
    cistern1.description_ro AS cistern1_description_ro,
    source_type.vl_active AS source_type_vl_active,
    source_type.short_fr AS source_type_short_fr,
    source_type.short_en AS source_type_short_en,
    source_type.short_ro AS source_type_short_ro,
    source_type.value_fr AS source_type_value_fr,
    source_type.value_en AS source_type_value_en,
    source_type.value_ro AS source_type_value_ro,
    source_type.description_fr AS source_type_description_fr,
    source_type.description_en AS source_type_description_en,
    source_type.description_ro AS source_type_description_ro,
    source_type.code_sire AS source_type_code_sire,
    source_quality.vl_active AS source_quality_vl_active,
    source_quality.short_fr AS source_quality_short_fr,
    source_quality.short_en AS source_quality_short_en,
    source_quality.short_ro AS source_quality_short_ro,
    source_quality.value_fr AS source_quality_value_fr,
    source_quality.value_en AS source_quality_value_en,
    source_quality.value_ro AS source_quality_value_ro,
    source_quality.description_fr AS source_quality_description_fr,
    source_quality.description_en AS source_quality_description_en,
    source_quality.description_ro AS source_quality_description_ro,
    source_quality.code_sire AS source_quality_code_sire,
    distributor.name AS distributor_name,
    overflow.vl_active AS overflow_vl_active,
    overflow.short_fr AS overflow_short_fr,
    overflow.short_en AS overflow_short_en,
    overflow.short_ro AS overflow_short_ro,
    overflow.value_fr AS overflow_value_fr,
    overflow.value_en AS overflow_value_en,
    overflow.value_ro AS overflow_value_ro,
    overflow.description_fr AS overflow_description_fr,
    overflow.description_en AS overflow_description_en,
    overflow.description_ro AS overflow_description_ro,
    pressurecontrol_type.vl_active AS pressurecontrol_type_vl_active,
    pressurecontrol_type.short_fr AS pressurecontrol_type_short_fr,
    pressurecontrol_type.short_en AS pressurecontrol_type_short_en,
    pressurecontrol_type.short_ro AS pressurecontrol_type_short_ro,
    pressurecontrol_type.value_fr AS pressurecontrol_type_value_fr,
    pressurecontrol_type.value_en AS pressurecontrol_type_value_en,
    pressurecontrol_type.value_ro AS pressurecontrol_type_value_ro,
    pressurecontrol_type.description_fr AS pressurecontrol_type_description_fr,
    pressurecontrol_type.description_en AS pressurecontrol_type_description_en,
    pressurecontrol_type.description_ro AS pressurecontrol_type_description_ro,
    remote.vl_active AS remote_vl_active,
    remote.short_fr AS remote_short_fr,
    remote.short_en AS remote_short_en,
    remote.short_ro AS remote_short_ro,
    remote.value_fr AS remote_value_fr,
    remote.value_en AS remote_value_en,
    remote.value_ro AS remote_value_ro,
    remote.description_fr AS remote_description_fr,
    remote.description_en AS remote_description_en,
    remote.description_ro AS remote_description_ro,
    district.name AS district_name,
    district.shortname AS district_shortname,
    district.zip AS district_zip,
    district.land_registry AS district_land_registry,
    district.prefix AS district_prefix,
    district.colorcode AS district_colorcode,
    district.geometry AS district_geometry,
    district.label_1_visible AS district_label_1_visible,
    district.label_1_x AS district_label_1_x,
    district.label_1_y AS district_label_1_y,
    district.label_1_rotation AS district_label_1_rotation,
    district.label_1_text AS district_label_1_text,
    district.label_2_visible AS district_label_2_visible,
    district.label_2_x AS district_label_2_x,
    district.label_2_y AS district_label_2_y,
    district.label_2_rotation AS district_label_2_rotation,
    district.label_2_text AS district_label_2_text,
    pressurezone.fk_distributor AS pressurezone_fk_distributor,
    pressurezone.fk_consumptionzone AS pressurezone_fk_consumptionzone,
    pressurezone.name AS pressurezone_name,
    pressurezone.population AS pressurezone_population,
    pressurezone.subscriber AS pressurezone_subscriber,
    pressurezone.colorcode AS pressurezone_colorcode,
    pressurezone.geometry AS pressurezone_geometry,
    pressurezone.geometry_alt1 AS pressurezone_geometry_alt1,
    pressurezone.geometry_alt2 AS pressurezone_geometry_alt2,
    pressurezone._geometry_alt1_used AS pressurezone__geometry_alt1_used,
    pressurezone._geometry_alt2_used AS pressurezone__geometry_alt2_used,
    pressurezone.update_geometry_alt1 AS pressurezone_update_geometry_alt1,
    pressurezone.update_geometry_alt2 AS pressurezone_update_geometry_alt2,
    pressurezone.label_1_visible AS pressurezone_label_1_visible,
    pressurezone.label_1_x AS pressurezone_label_1_x,
    pressurezone.label_1_y AS pressurezone_label_1_y,
    pressurezone.label_1_rotation AS pressurezone_label_1_rotation,
    pressurezone.label_1_text AS pressurezone_label_1_text,
    pressurezone.label_2_visible AS pressurezone_label_2_visible,
    pressurezone.label_2_x AS pressurezone_label_2_x,
    pressurezone.label_2_y AS pressurezone_label_2_y,
    pressurezone.label_2_rotation AS pressurezone_label_2_rotation,
    pressurezone.label_2_text AS pressurezone_label_2_text,
    folder.identification AS folder_identification,
    folder.description AS folder_description,
    folder.date_start AS folder_date_start,
    folder.date_end AS folder_date_end,
    folder.geometry_polygon AS folder_geometry_polygon,
    folder.geometry_line AS folder_geometry_line,
    precisionalti.vl_active AS precisionalti_vl_active,
    precisionalti.short_fr AS precisionalti_short_fr,
    precisionalti.short_en AS precisionalti_short_en,
    precisionalti.short_ro AS precisionalti_short_ro,
    precisionalti.value_fr AS precisionalti_value_fr,
    precisionalti.value_en AS precisionalti_value_en,
    precisionalti.value_ro AS precisionalti_value_ro,
    precisionalti.description_fr AS precisionalti_description_fr,
    precisionalti.description_en AS precisionalti_description_en,
    precisionalti.description_ro AS precisionalti_description_ro,
    precisionalti.code_sire AS precisionalti_code_sire,
    pump_operating.vl_active AS pump_operating_vl_active,
    pump_operating.short_fr AS pump_operating_short_fr,
    pump_operating.short_en AS pump_operating_short_en,
    pump_operating.short_ro AS pump_operating_short_ro,
    pump_operating.value_fr AS pump_operating_value_fr,
    pump_operating.value_en AS pump_operating_value_en,
    pump_operating.value_ro AS pump_operating_value_ro,
    pump_operating.description_fr AS pump_operating_description_fr,
    pump_operating.description_en AS pump_operating_description_en,
    pump_operating.description_ro AS pump_operating_description_ro,
    pump_operating.code_sire AS pump_operating_code_sire
   FROM (((((((((((((((((((qwat_od.vw_element_installation
     LEFT JOIN qwat_vl.status status ON ((vw_element_installation.fk_status = status.id)))
     LEFT JOIN qwat_vl.watertype watertype ON ((vw_element_installation.fk_watertype = watertype.id)))
     LEFT JOIN qwat_vl.pump_type pump_type ON ((vw_element_installation.fk_pump_type = pump_type.id)))
     LEFT JOIN qwat_vl.object_reference object_reference ON ((vw_element_installation.fk_object_reference = object_reference.id)))
     LEFT JOIN qwat_vl.cistern cistern2 ON ((vw_element_installation.cistern2_fk_type = cistern2.id)))
     LEFT JOIN qwat_vl.precision precision ON ((vw_element_installation.fk_precision = precision.id)))
     LEFT JOIN qwat_vl.tank_firestorage tank_firestorage ON ((vw_element_installation.fk_tank_firestorage = tank_firestorage.id)))
     LEFT JOIN qwat_vl.cistern cistern1 ON ((vw_element_installation.cistern1_fk_type = cistern1.id)))
     LEFT JOIN qwat_vl.source_type source_type ON ((vw_element_installation.fk_source_type = source_type.id)))
     LEFT JOIN qwat_vl.source_quality source_quality ON ((vw_element_installation.fk_source_quality = source_quality.id)))
     LEFT JOIN qwat_od.distributor distributor ON ((vw_element_installation.fk_distributor = distributor.id)))
     LEFT JOIN qwat_vl.overflow overflow ON ((vw_element_installation.fk_overflow = overflow.id)))
     LEFT JOIN qwat_vl.pressurecontrol_type pressurecontrol_type ON ((vw_element_installation.fk_pressurecontrol_type = pressurecontrol_type.id)))
     LEFT JOIN qwat_vl.remote_type remote ON ((vw_element_installation.fk_remote = remote.id)))
     LEFT JOIN qwat_od.district district ON ((vw_element_installation.fk_district = district.id)))
     LEFT JOIN qwat_od.pressurezone pressurezone ON ((vw_element_installation.fk_pressurezone = pressurezone.id)))
     LEFT JOIN qwat_od.folder folder ON ((vw_element_installation.fk_folder = folder.id)))
     LEFT JOIN qwat_vl.precisionalti precisionalti ON ((vw_element_installation.fk_precisionalti = precisionalti.id)))
     LEFT JOIN qwat_vl.pump_operating pump_operating ON ((vw_element_installation.fk_pump_operating = pump_operating.id)));"
"vw_element_installation"," SELECT element.id,
    element.fk_district,
    element.fk_pressurezone,
    element.fk_printmap,
    element._printmaps,
    element._geometry_alt1_used,
    element._geometry_alt2_used,
    element._pipe_node_type,
    element._pipe_orientation,
    element._pipe_schema_visible,
    element.geometry,
    element.geometry_alt1,
    element.geometry_alt2,
    element.update_geometry_alt1,
    element.update_geometry_alt2,
    element.identification,
    element.fk_distributor,
    element.fk_status,
    element.fk_folder,
    element.fk_locationtype,
    element.fk_precision,
    element.fk_precisionalti,
    element.fk_object_reference,
    element.altitude,
    element.year,
    element.year_end,
    element.orientation,
    element.remark,
    element.schema_force_visible,
    element.label_1_visible,
    element.label_1_x,
    element.label_1_y,
    element.label_1_rotation,
    element.label_1_text,
    element.label_2_visible,
    element.label_2_x,
    element.label_2_y,
    element.label_2_rotation,
    element.label_2_text,
    installation.installation_type,
    installation.name,
    installation.fk_parent,
    installation.fk_remote,
    installation.fk_watertype,
    installation.parcel,
    installation.eca,
    installation.open_water_surface,
    installation.geometry_polygon,
    installation.fk_source_type,
    installation.fk_source_quality,
    installation.flow_lowest,
    installation.flow_average,
    installation.flow_concession,
    installation.contract_end,
    installation.gathering_chamber,
    installation.fk_pump_type,
    installation.fk_pipe_in,
    installation.fk_pipe_out,
    installation.fk_pump_operating,
    installation.no_pumps,
    installation.rejected_flow,
    installation.manometric_height,
    installation.fk_overflow,
    installation.fk_tank_firestorage,
    installation.storage_total,
    installation.storage_supply,
    installation.storage_fire,
    installation.altitude_overflow,
    installation.altitude_apron,
    installation.height_max,
    installation.fire_valve,
    installation.fire_remote,
    installation._litrepercm,
    installation.cistern1_fk_type,
    installation.cistern1_dimension_1,
    installation.cistern1_dimension_2,
    installation.cistern1_storage,
    installation._cistern1_litrepercm,
    installation.cistern2_fk_type,
    installation.cistern2_dimension_1,
    installation.cistern2_dimension_2,
    installation.cistern2_storage,
    installation._cistern2_litrepercm,
    installation.sanitization_uv,
    installation.sanitization_chlorine_liquid,
    installation.sanitization_chlorine_gazeous,
    installation.sanitization_ozone,
    installation.filtration_membrane,
    installation.filtration_sandorgravel,
    installation.flocculation,
    installation.activatedcharcoal,
    installation.settling,
    installation.treatment_capacity,
    installation.networkseparation,
    installation.flow_meter,
    installation.water_meter,
    installation.manometer,
    installation.depth,
    installation.no_valves,
    installation.fk_pressurecontrol_type
   FROM (qwat_od.vw_qwat_installation installation
     JOIN qwat_od.vw_node_element element ON ((installation.id = element.id)));"
"vw_export_valve"," SELECT vw_element_valve.id,
    vw_element_valve.fk_district,
    vw_element_valve.fk_pressurezone,
    vw_element_valve.fk_printmap,
    vw_element_valve._printmaps,
    vw_element_valve._geometry_alt1_used,
    vw_element_valve._geometry_alt2_used,
    vw_element_valve._pipe_node_type,
    vw_element_valve._pipe_orientation,
    vw_element_valve._pipe_schema_visible,
    vw_element_valve.geometry,
    vw_element_valve.geometry_alt1,
    vw_element_valve.geometry_alt2,
    vw_element_valve.update_geometry_alt1,
    vw_element_valve.update_geometry_alt2,
    vw_element_valve.identification,
    vw_element_valve.fk_distributor,
    vw_element_valve.fk_status,
    vw_element_valve.fk_folder,
    vw_element_valve.fk_locationtype,
    vw_element_valve.fk_precision,
    vw_element_valve.fk_precisionalti,
    vw_element_valve.fk_object_reference,
    vw_element_valve.altitude,
    vw_element_valve.year,
    vw_element_valve.year_end,
    vw_element_valve.orientation,
    vw_element_valve.remark,
    vw_element_valve.schema_force_visible,
    vw_element_valve.label_1_visible,
    vw_element_valve.label_1_x,
    vw_element_valve.label_1_y,
    vw_element_valve.label_1_rotation,
    vw_element_valve.label_1_text,
    vw_element_valve.label_2_visible,
    vw_element_valve.label_2_x,
    vw_element_valve.label_2_y,
    vw_element_valve.label_2_rotation,
    vw_element_valve.label_2_text,
    vw_element_valve.fk_valve_type,
    vw_element_valve.fk_valve_function,
    vw_element_valve.fk_valve_actuation,
    vw_element_valve.fk_pipe,
    vw_element_valve.fk_handle_precision,
    vw_element_valve.fk_handle_precisionalti,
    vw_element_valve.fk_maintenance,
    vw_element_valve.diameter_nominal,
    vw_element_valve.closed,
    vw_element_valve.networkseparation,
    vw_element_valve.handle_altitude,
    vw_element_valve.handle_geometry,
    status.vl_active AS status_vl_active,
    status.short_fr AS status_short_fr,
    status.short_en AS status_short_en,
    status.short_ro AS status_short_ro,
    status.value_fr AS status_value_fr,
    status.value_en AS status_value_en,
    status.value_ro AS status_value_ro,
    status.description_fr AS status_description_fr,
    status.description_en AS status_description_en,
    status.description_ro AS status_description_ro,
    status.active AS status_active,
    status.code_sire AS status_code_sire,
    district.name AS district_name,
    district.shortname AS district_shortname,
    district.zip AS district_zip,
    district.land_registry AS district_land_registry,
    district.prefix AS district_prefix,
    district.colorcode AS district_colorcode,
    district.geometry AS district_geometry,
    district.label_1_visible AS district_label_1_visible,
    district.label_1_x AS district_label_1_x,
    district.label_1_y AS district_label_1_y,
    district.label_1_rotation AS district_label_1_rotation,
    district.label_1_text AS district_label_1_text,
    district.label_2_visible AS district_label_2_visible,
    district.label_2_x AS district_label_2_x,
    district.label_2_y AS district_label_2_y,
    district.label_2_rotation AS district_label_2_rotation,
    district.label_2_text AS district_label_2_text,
    pressurezone.fk_distributor AS pressurezone_fk_distributor,
    pressurezone.fk_consumptionzone AS pressurezone_fk_consumptionzone,
    pressurezone.name AS pressurezone_name,
    pressurezone.population AS pressurezone_population,
    pressurezone.subscriber AS pressurezone_subscriber,
    pressurezone.colorcode AS pressurezone_colorcode,
    pressurezone.geometry AS pressurezone_geometry,
    pressurezone.geometry_alt1 AS pressurezone_geometry_alt1,
    pressurezone.geometry_alt2 AS pressurezone_geometry_alt2,
    pressurezone._geometry_alt1_used AS pressurezone__geometry_alt1_used,
    pressurezone._geometry_alt2_used AS pressurezone__geometry_alt2_used,
    pressurezone.update_geometry_alt1 AS pressurezone_update_geometry_alt1,
    pressurezone.update_geometry_alt2 AS pressurezone_update_geometry_alt2,
    pressurezone.label_1_visible AS pressurezone_label_1_visible,
    pressurezone.label_1_x AS pressurezone_label_1_x,
    pressurezone.label_1_y AS pressurezone_label_1_y,
    pressurezone.label_1_rotation AS pressurezone_label_1_rotation,
    pressurezone.label_1_text AS pressurezone_label_1_text,
    pressurezone.label_2_visible AS pressurezone_label_2_visible,
    pressurezone.label_2_x AS pressurezone_label_2_x,
    pressurezone.label_2_y AS pressurezone_label_2_y,
    pressurezone.label_2_rotation AS pressurezone_label_2_rotation,
    pressurezone.label_2_text AS pressurezone_label_2_text,
    valve_function.vl_active AS valve_function_vl_active,
    valve_function.short_fr AS valve_function_short_fr,
    valve_function.short_en AS valve_function_short_en,
    valve_function.short_ro AS valve_function_short_ro,
    valve_function.value_fr AS valve_function_value_fr,
    valve_function.value_en AS valve_function_value_en,
    valve_function.value_ro AS valve_function_value_ro,
    valve_function.description_fr AS valve_function_description_fr,
    valve_function.description_en AS valve_function_description_en,
    valve_function.description_ro AS valve_function_description_ro,
    valve_function.schema_visible AS valve_function_schema_visible,
    precision.vl_active AS precision_vl_active,
    precision.short_fr AS precision_short_fr,
    precision.short_en AS precision_short_en,
    precision.short_ro AS precision_short_ro,
    precision.value_fr AS precision_value_fr,
    precision.value_en AS precision_value_en,
    precision.value_ro AS precision_value_ro,
    precision.description_fr AS precision_description_fr,
    precision.description_en AS precision_description_en,
    precision.description_ro AS precision_description_ro,
    precision.code_sire AS precision_code_sire,
    distributor.name AS distributor_name,
    valve_type.vl_active AS valve_type_vl_active,
    valve_type.short_fr AS valve_type_short_fr,
    valve_type.short_en AS valve_type_short_en,
    valve_type.short_ro AS valve_type_short_ro,
    valve_type.value_fr AS valve_type_value_fr,
    valve_type.value_en AS valve_type_value_en,
    valve_type.value_ro AS valve_type_value_ro,
    valve_type.description_fr AS valve_type_description_fr,
    valve_type.description_en AS valve_type_description_en,
    valve_type.description_ro AS valve_type_description_ro,
    object_reference.vl_active AS object_reference_vl_active,
    object_reference.short_fr AS object_reference_short_fr,
    object_reference.short_en AS object_reference_short_en,
    object_reference.short_ro AS object_reference_short_ro,
    object_reference.value_fr AS object_reference_value_fr,
    object_reference.value_en AS object_reference_value_en,
    object_reference.value_ro AS object_reference_value_ro,
    object_reference.description_fr AS object_reference_description_fr,
    object_reference.description_en AS object_reference_description_en,
    object_reference.description_ro AS object_reference_description_ro,
    valve_actuation.vl_active AS valve_actuation_vl_active,
    valve_actuation.short_fr AS valve_actuation_short_fr,
    valve_actuation.short_en AS valve_actuation_short_en,
    valve_actuation.short_ro AS valve_actuation_short_ro,
    valve_actuation.value_fr AS valve_actuation_value_fr,
    valve_actuation.value_en AS valve_actuation_value_en,
    valve_actuation.value_ro AS valve_actuation_value_ro,
    valve_actuation.description_fr AS valve_actuation_description_fr,
    valve_actuation.description_en AS valve_actuation_description_en,
    valve_actuation.description_ro AS valve_actuation_description_ro,
    valve_actuation.schema_visible AS valve_actuation_schema_visible,
    folder.identification AS folder_identification,
    folder.description AS folder_description,
    folder.date_start AS folder_date_start,
    folder.date_end AS folder_date_end,
    folder.geometry_polygon AS folder_geometry_polygon,
    folder.geometry_line AS folder_geometry_line,
    precisionalti.vl_active AS precisionalti_vl_active,
    precisionalti.short_fr AS precisionalti_short_fr,
    precisionalti.short_en AS precisionalti_short_en,
    precisionalti.short_ro AS precisionalti_short_ro,
    precisionalti.value_fr AS precisionalti_value_fr,
    precisionalti.value_en AS precisionalti_value_en,
    precisionalti.value_ro AS precisionalti_value_ro,
    precisionalti.description_fr AS precisionalti_description_fr,
    precisionalti.description_en AS precisionalti_description_en,
    precisionalti.description_ro AS precisionalti_description_ro,
    precisionalti.code_sire AS precisionalti_code_sire
   FROM (((((((((((qwat_od.vw_element_valve
     LEFT JOIN qwat_vl.status status ON ((vw_element_valve.fk_status = status.id)))
     LEFT JOIN qwat_od.district district ON ((vw_element_valve.fk_district = district.id)))
     LEFT JOIN qwat_od.pressurezone pressurezone ON ((vw_element_valve.fk_pressurezone = pressurezone.id)))
     LEFT JOIN qwat_vl.valve_function valve_function ON ((vw_element_valve.fk_valve_function = valve_function.id)))
     LEFT JOIN qwat_vl.precision precision ON ((vw_element_valve.fk_precision = precision.id)))
     LEFT JOIN qwat_od.distributor distributor ON ((vw_element_valve.fk_distributor = distributor.id)))
     LEFT JOIN qwat_vl.valve_type valve_type ON ((vw_element_valve.fk_valve_type = valve_type.id)))
     LEFT JOIN qwat_vl.object_reference object_reference ON ((vw_element_valve.fk_object_reference = object_reference.id)))
     LEFT JOIN qwat_vl.valve_actuation valve_actuation ON ((vw_element_valve.fk_valve_actuation = valve_actuation.id)))
     LEFT JOIN qwat_od.folder folder ON ((vw_element_valve.fk_folder = folder.id)))
     LEFT JOIN qwat_vl.precisionalti precisionalti ON ((vw_element_valve.fk_precisionalti = precisionalti.id)));"
"vw_element_hydrant"," SELECT element.id,
    element.fk_district,
    element.fk_pressurezone,
    element.fk_printmap,
    element._printmaps,
    element._geometry_alt1_used,
    element._geometry_alt2_used,
    element._pipe_node_type,
    element._pipe_orientation,
    element._pipe_schema_visible,
    element.geometry,
    element.geometry_alt1,
    element.geometry_alt2,
    element.update_geometry_alt1,
    element.update_geometry_alt2,
    element.identification,
    element.fk_distributor,
    element.fk_status,
    element.fk_folder,
    element.fk_locationtype,
    element.fk_precision,
    element.fk_precisionalti,
    element.fk_object_reference,
    element.altitude,
    element.year,
    element.year_end,
    element.orientation,
    element.remark,
    element.schema_force_visible,
    element.label_1_visible,
    element.label_1_x,
    element.label_1_y,
    element.label_1_rotation,
    element.label_1_text,
    element.label_2_visible,
    element.label_2_x,
    element.label_2_y,
    element.label_2_rotation,
    element.label_2_text,
    hydrant.fk_provider,
    hydrant.fk_model_sup,
    hydrant.fk_model_inf,
    hydrant.fk_material,
    hydrant.fk_output,
    hydrant.underground,
    hydrant.marked,
    hydrant.pressure_static,
    hydrant.pressure_dynamic,
    hydrant.flow,
    hydrant.observation_date,
    hydrant.observation_source
   FROM (qwat_od.hydrant hydrant
     JOIN qwat_od.vw_node_element element ON ((hydrant.id = element.id)));"
"vw_export_hydrant"," SELECT vw_element_hydrant.id,
    vw_element_hydrant.fk_district,
    vw_element_hydrant.fk_pressurezone,
    vw_element_hydrant.fk_printmap,
    vw_element_hydrant._printmaps,
    vw_element_hydrant._geometry_alt1_used,
    vw_element_hydrant._geometry_alt2_used,
    vw_element_hydrant._pipe_node_type,
    vw_element_hydrant._pipe_orientation,
    vw_element_hydrant._pipe_schema_visible,
    vw_element_hydrant.geometry,
    vw_element_hydrant.geometry_alt1,
    vw_element_hydrant.geometry_alt2,
    vw_element_hydrant.update_geometry_alt1,
    vw_element_hydrant.update_geometry_alt2,
    vw_element_hydrant.identification,
    vw_element_hydrant.fk_distributor,
    vw_element_hydrant.fk_status,
    vw_element_hydrant.fk_folder,
    vw_element_hydrant.fk_locationtype,
    vw_element_hydrant.fk_precision,
    vw_element_hydrant.fk_precisionalti,
    vw_element_hydrant.fk_object_reference,
    vw_element_hydrant.altitude,
    vw_element_hydrant.year,
    vw_element_hydrant.year_end,
    vw_element_hydrant.orientation,
    vw_element_hydrant.remark,
    vw_element_hydrant.schema_force_visible,
    vw_element_hydrant.label_1_visible,
    vw_element_hydrant.label_1_x,
    vw_element_hydrant.label_1_y,
    vw_element_hydrant.label_1_rotation,
    vw_element_hydrant.label_1_text,
    vw_element_hydrant.label_2_visible,
    vw_element_hydrant.label_2_x,
    vw_element_hydrant.label_2_y,
    vw_element_hydrant.label_2_rotation,
    vw_element_hydrant.label_2_text,
    vw_element_hydrant.fk_provider,
    vw_element_hydrant.fk_model_sup,
    vw_element_hydrant.fk_model_inf,
    vw_element_hydrant.fk_material,
    vw_element_hydrant.fk_output,
    vw_element_hydrant.underground,
    vw_element_hydrant.marked,
    vw_element_hydrant.pressure_static,
    vw_element_hydrant.pressure_dynamic,
    vw_element_hydrant.flow,
    vw_element_hydrant.observation_date,
    vw_element_hydrant.observation_source,
    status.vl_active AS status_vl_active,
    status.short_fr AS status_short_fr,
    status.short_en AS status_short_en,
    status.short_ro AS status_short_ro,
    status.value_fr AS status_value_fr,
    status.value_en AS status_value_en,
    status.value_ro AS status_value_ro,
    status.description_fr AS status_description_fr,
    status.description_en AS status_description_en,
    status.description_ro AS status_description_ro,
    status.active AS status_active,
    status.code_sire AS status_code_sire,
    district.name AS district_name,
    district.shortname AS district_shortname,
    district.zip AS district_zip,
    district.land_registry AS district_land_registry,
    district.prefix AS district_prefix,
    district.colorcode AS district_colorcode,
    district.geometry AS district_geometry,
    district.label_1_visible AS district_label_1_visible,
    district.label_1_x AS district_label_1_x,
    district.label_1_y AS district_label_1_y,
    district.label_1_rotation AS district_label_1_rotation,
    district.label_1_text AS district_label_1_text,
    district.label_2_visible AS district_label_2_visible,
    district.label_2_x AS district_label_2_x,
    district.label_2_y AS district_label_2_y,
    district.label_2_rotation AS district_label_2_rotation,
    district.label_2_text AS district_label_2_text,
    model_inf.vl_active AS model_inf_vl_active,
    model_inf.short_fr AS model_inf_short_fr,
    model_inf.short_en AS model_inf_short_en,
    model_inf.short_ro AS model_inf_short_ro,
    model_inf.value_fr AS model_inf_value_fr,
    model_inf.value_en AS model_inf_value_en,
    model_inf.value_ro AS model_inf_value_ro,
    model_inf.description_fr AS model_inf_description_fr,
    model_inf.description_en AS model_inf_description_en,
    model_inf.description_ro AS model_inf_description_ro,
    pressurezone.fk_distributor AS pressurezone_fk_distributor,
    pressurezone.fk_consumptionzone AS pressurezone_fk_consumptionzone,
    pressurezone.name AS pressurezone_name,
    pressurezone.population AS pressurezone_population,
    pressurezone.subscriber AS pressurezone_subscriber,
    pressurezone.colorcode AS pressurezone_colorcode,
    pressurezone.geometry AS pressurezone_geometry,
    pressurezone.geometry_alt1 AS pressurezone_geometry_alt1,
    pressurezone.geometry_alt2 AS pressurezone_geometry_alt2,
    pressurezone._geometry_alt1_used AS pressurezone__geometry_alt1_used,
    pressurezone._geometry_alt2_used AS pressurezone__geometry_alt2_used,
    pressurezone.update_geometry_alt1 AS pressurezone_update_geometry_alt1,
    pressurezone.update_geometry_alt2 AS pressurezone_update_geometry_alt2,
    pressurezone.label_1_visible AS pressurezone_label_1_visible,
    pressurezone.label_1_x AS pressurezone_label_1_x,
    pressurezone.label_1_y AS pressurezone_label_1_y,
    pressurezone.label_1_rotation AS pressurezone_label_1_rotation,
    pressurezone.label_1_text AS pressurezone_label_1_text,
    pressurezone.label_2_visible AS pressurezone_label_2_visible,
    pressurezone.label_2_x AS pressurezone_label_2_x,
    pressurezone.label_2_y AS pressurezone_label_2_y,
    pressurezone.label_2_rotation AS pressurezone_label_2_rotation,
    pressurezone.label_2_text AS pressurezone_label_2_text,
    material.vl_active AS material_vl_active,
    material.short_fr AS material_short_fr,
    material.short_en AS material_short_en,
    material.short_ro AS material_short_ro,
    material.value_fr AS material_value_fr,
    material.value_en AS material_value_en,
    material.value_ro AS material_value_ro,
    material.description_fr AS material_description_fr,
    material.description_en AS material_description_en,
    material.description_ro AS material_description_ro,
    material.pressure_nominal AS material_pressure_nominal,
    precision.vl_active AS precision_vl_active,
    precision.short_fr AS precision_short_fr,
    precision.short_en AS precision_short_en,
    precision.short_ro AS precision_short_ro,
    precision.value_fr AS precision_value_fr,
    precision.value_en AS precision_value_en,
    precision.value_ro AS precision_value_ro,
    precision.description_fr AS precision_description_fr,
    precision.description_en AS precision_description_en,
    precision.description_ro AS precision_description_ro,
    precision.code_sire AS precision_code_sire,
    model_sup.vl_active AS model_sup_vl_active,
    model_sup.short_fr AS model_sup_short_fr,
    model_sup.short_en AS model_sup_short_en,
    model_sup.short_ro AS model_sup_short_ro,
    model_sup.value_fr AS model_sup_value_fr,
    model_sup.value_en AS model_sup_value_en,
    model_sup.value_ro AS model_sup_value_ro,
    model_sup.description_fr AS model_sup_description_fr,
    model_sup.description_en AS model_sup_description_en,
    model_sup.description_ro AS model_sup_description_ro,
    object_reference.vl_active AS object_reference_vl_active,
    object_reference.short_fr AS object_reference_short_fr,
    object_reference.short_en AS object_reference_short_en,
    object_reference.short_ro AS object_reference_short_ro,
    object_reference.value_fr AS object_reference_value_fr,
    object_reference.value_en AS object_reference_value_en,
    object_reference.value_ro AS object_reference_value_ro,
    object_reference.description_fr AS object_reference_description_fr,
    object_reference.description_en AS object_reference_description_en,
    object_reference.description_ro AS object_reference_description_ro,
    provider.vl_active AS provider_vl_active,
    provider.short_fr AS provider_short_fr,
    provider.short_en AS provider_short_en,
    provider.short_ro AS provider_short_ro,
    provider.value_fr AS provider_value_fr,
    provider.value_en AS provider_value_en,
    provider.value_ro AS provider_value_ro,
    provider.description_fr AS provider_description_fr,
    provider.description_en AS provider_description_en,
    provider.description_ro AS provider_description_ro,
    distributor.name AS distributor_name,
    output.vl_active AS output_vl_active,
    output.short_fr AS output_short_fr,
    output.short_en AS output_short_en,
    output.short_ro AS output_short_ro,
    output.value_fr AS output_value_fr,
    output.value_en AS output_value_en,
    output.value_ro AS output_value_ro,
    output.description_fr AS output_description_fr,
    output.description_en AS output_description_en,
    output.description_ro AS output_description_ro,
    folder.identification AS folder_identification,
    folder.description AS folder_description,
    folder.date_start AS folder_date_start,
    folder.date_end AS folder_date_end,
    folder.geometry_polygon AS folder_geometry_polygon,
    folder.geometry_line AS folder_geometry_line,
    precisionalti.vl_active AS precisionalti_vl_active,
    precisionalti.short_fr AS precisionalti_short_fr,
    precisionalti.short_en AS precisionalti_short_en,
    precisionalti.short_ro AS precisionalti_short_ro,
    precisionalti.value_fr AS precisionalti_value_fr,
    precisionalti.value_en AS precisionalti_value_en,
    precisionalti.value_ro AS precisionalti_value_ro,
    precisionalti.description_fr AS precisionalti_description_fr,
    precisionalti.description_en AS precisionalti_description_en,
    precisionalti.description_ro AS precisionalti_description_ro,
    precisionalti.code_sire AS precisionalti_code_sire
   FROM (((((((((((((qwat_od.vw_element_hydrant
     LEFT JOIN qwat_vl.status status ON ((vw_element_hydrant.fk_status = status.id)))
     LEFT JOIN qwat_od.district district ON ((vw_element_hydrant.fk_district = district.id)))
     LEFT JOIN qwat_vl.hydrant_model_inf model_inf ON ((vw_element_hydrant.fk_model_inf = model_inf.id)))
     LEFT JOIN qwat_od.pressurezone pressurezone ON ((vw_element_hydrant.fk_pressurezone = pressurezone.id)))
     LEFT JOIN qwat_vl.hydrant_material material ON ((vw_element_hydrant.fk_material = material.id)))
     LEFT JOIN qwat_vl.precision precision ON ((vw_element_hydrant.fk_precision = precision.id)))
     LEFT JOIN qwat_vl.hydrant_model_sup model_sup ON ((vw_element_hydrant.fk_model_sup = model_sup.id)))
     LEFT JOIN qwat_vl.object_reference object_reference ON ((vw_element_hydrant.fk_object_reference = object_reference.id)))
     LEFT JOIN qwat_vl.hydrant_provider provider ON ((vw_element_hydrant.fk_provider = provider.id)))
     LEFT JOIN qwat_od.distributor distributor ON ((vw_element_hydrant.fk_distributor = distributor.id)))
     LEFT JOIN qwat_vl.hydrant_output output ON ((vw_element_hydrant.fk_output = output.id)))
     LEFT JOIN qwat_od.folder folder ON ((vw_element_hydrant.fk_folder = folder.id)))
     LEFT JOIN qwat_vl.precisionalti precisionalti ON ((vw_element_hydrant.fk_precisionalti = precisionalti.id)));"
"vw_export_meter"," SELECT vw_element_meter.id,
    vw_element_meter.fk_district,
    vw_element_meter.fk_pressurezone,
    vw_element_meter.fk_printmap,
    vw_element_meter._printmaps,
    vw_element_meter._geometry_alt1_used,
    vw_element_meter._geometry_alt2_used,
    vw_element_meter._pipe_node_type,
    vw_element_meter._pipe_orientation,
    vw_element_meter._pipe_schema_visible,
    vw_element_meter.geometry,
    vw_element_meter.geometry_alt1,
    vw_element_meter.geometry_alt2,
    vw_element_meter.update_geometry_alt1,
    vw_element_meter.update_geometry_alt2,
    vw_element_meter.identification,
    vw_element_meter.fk_distributor,
    vw_element_meter.fk_status,
    vw_element_meter.fk_folder,
    vw_element_meter.fk_locationtype,
    vw_element_meter.fk_precision,
    vw_element_meter.fk_precisionalti,
    vw_element_meter.fk_object_reference,
    vw_element_meter.altitude,
    vw_element_meter.year,
    vw_element_meter.year_end,
    vw_element_meter.orientation,
    vw_element_meter.remark,
    vw_element_meter.schema_force_visible,
    vw_element_meter.label_1_visible,
    vw_element_meter.label_1_x,
    vw_element_meter.label_1_y,
    vw_element_meter.label_1_rotation,
    vw_element_meter.label_1_text,
    vw_element_meter.label_2_visible,
    vw_element_meter.label_2_x,
    vw_element_meter.label_2_y,
    vw_element_meter.label_2_rotation,
    vw_element_meter.label_2_text,
    vw_element_meter.fk_pipe,
    vw_element_meter.parcel,
    status.vl_active AS status_vl_active,
    status.short_fr AS status_short_fr,
    status.short_en AS status_short_en,
    status.short_ro AS status_short_ro,
    status.value_fr AS status_value_fr,
    status.value_en AS status_value_en,
    status.value_ro AS status_value_ro,
    status.description_fr AS status_description_fr,
    status.description_en AS status_description_en,
    status.description_ro AS status_description_ro,
    status.active AS status_active,
    status.code_sire AS status_code_sire,
    district.name AS district_name,
    district.shortname AS district_shortname,
    district.zip AS district_zip,
    district.land_registry AS district_land_registry,
    district.prefix AS district_prefix,
    district.colorcode AS district_colorcode,
    district.geometry AS district_geometry,
    district.label_1_visible AS district_label_1_visible,
    district.label_1_x AS district_label_1_x,
    district.label_1_y AS district_label_1_y,
    district.label_1_rotation AS district_label_1_rotation,
    district.label_1_text AS district_label_1_text,
    district.label_2_visible AS district_label_2_visible,
    district.label_2_x AS district_label_2_x,
    district.label_2_y AS district_label_2_y,
    district.label_2_rotation AS district_label_2_rotation,
    district.label_2_text AS district_label_2_text,
    pressurezone.fk_distributor AS pressurezone_fk_distributor,
    pressurezone.fk_consumptionzone AS pressurezone_fk_consumptionzone,
    pressurezone.name AS pressurezone_name,
    pressurezone.population AS pressurezone_population,
    pressurezone.subscriber AS pressurezone_subscriber,
    pressurezone.colorcode AS pressurezone_colorcode,
    pressurezone.geometry AS pressurezone_geometry,
    pressurezone.geometry_alt1 AS pressurezone_geometry_alt1,
    pressurezone.geometry_alt2 AS pressurezone_geometry_alt2,
    pressurezone._geometry_alt1_used AS pressurezone__geometry_alt1_used,
    pressurezone._geometry_alt2_used AS pressurezone__geometry_alt2_used,
    pressurezone.update_geometry_alt1 AS pressurezone_update_geometry_alt1,
    pressurezone.update_geometry_alt2 AS pressurezone_update_geometry_alt2,
    pressurezone.label_1_visible AS pressurezone_label_1_visible,
    pressurezone.label_1_x AS pressurezone_label_1_x,
    pressurezone.label_1_y AS pressurezone_label_1_y,
    pressurezone.label_1_rotation AS pressurezone_label_1_rotation,
    pressurezone.label_1_text AS pressurezone_label_1_text,
    pressurezone.label_2_visible AS pressurezone_label_2_visible,
    pressurezone.label_2_x AS pressurezone_label_2_x,
    pressurezone.label_2_y AS pressurezone_label_2_y,
    pressurezone.label_2_rotation AS pressurezone_label_2_rotation,
    pressurezone.label_2_text AS pressurezone_label_2_text,
    precision.vl_active AS precision_vl_active,
    precision.short_fr AS precision_short_fr,
    precision.short_en AS precision_short_en,
    precision.short_ro AS precision_short_ro,
    precision.value_fr AS precision_value_fr,
    precision.value_en AS precision_value_en,
    precision.value_ro AS precision_value_ro,
    precision.description_fr AS precision_description_fr,
    precision.description_en AS precision_description_en,
    precision.description_ro AS precision_description_ro,
    precision.code_sire AS precision_code_sire,
    object_reference.vl_active AS object_reference_vl_active,
    object_reference.short_fr AS object_reference_short_fr,
    object_reference.short_en AS object_reference_short_en,
    object_reference.short_ro AS object_reference_short_ro,
    object_reference.value_fr AS object_reference_value_fr,
    object_reference.value_en AS object_reference_value_en,
    object_reference.value_ro AS object_reference_value_ro,
    object_reference.description_fr AS object_reference_description_fr,
    object_reference.description_en AS object_reference_description_en,
    object_reference.description_ro AS object_reference_description_ro,
    distributor.name AS distributor_name,
    folder.identification AS folder_identification,
    folder.description AS folder_description,
    folder.date_start AS folder_date_start,
    folder.date_end AS folder_date_end,
    folder.geometry_polygon AS folder_geometry_polygon,
    folder.geometry_line AS folder_geometry_line,
    precisionalti.vl_active AS precisionalti_vl_active,
    precisionalti.short_fr AS precisionalti_short_fr,
    precisionalti.short_en AS precisionalti_short_en,
    precisionalti.short_ro AS precisionalti_short_ro,
    precisionalti.value_fr AS precisionalti_value_fr,
    precisionalti.value_en AS precisionalti_value_en,
    precisionalti.value_ro AS precisionalti_value_ro,
    precisionalti.description_fr AS precisionalti_description_fr,
    precisionalti.description_en AS precisionalti_description_en,
    precisionalti.description_ro AS precisionalti_description_ro,
    precisionalti.code_sire AS precisionalti_code_sire
   FROM ((((((((qwat_od.vw_element_meter
     LEFT JOIN qwat_vl.status status ON ((vw_element_meter.fk_status = status.id)))
     LEFT JOIN qwat_od.district district ON ((vw_element_meter.fk_pressurezone = district.id)))
     LEFT JOIN qwat_od.pressurezone pressurezone ON ((vw_element_meter.fk_pressurezone = pressurezone.id)))
     LEFT JOIN qwat_vl.precision precision ON ((vw_element_meter.fk_precision = precision.id)))
     LEFT JOIN qwat_vl.object_reference object_reference ON ((vw_element_meter.fk_object_reference = object_reference.id)))
     LEFT JOIN qwat_od.distributor distributor ON ((vw_element_meter.fk_distributor = distributor.id)))
     LEFT JOIN qwat_od.folder folder ON ((vw_element_meter.fk_folder = folder.id)))
     LEFT JOIN qwat_vl.precisionalti precisionalti ON ((vw_element_meter.fk_precisionalti = precisionalti.id)));"
"vw_element_samplingpoint"," SELECT element.id,
    element.fk_district,
    element.fk_pressurezone,
    element.fk_printmap,
    element._printmaps,
    element._geometry_alt1_used,
    element._geometry_alt2_used,
    element._pipe_node_type,
    element._pipe_orientation,
    element._pipe_schema_visible,
    element.geometry,
    element.geometry_alt1,
    element.geometry_alt2,
    element.update_geometry_alt1,
    element.update_geometry_alt2,
    element.identification,
    element.fk_distributor,
    element.fk_status,
    element.fk_folder,
    element.fk_locationtype,
    element.fk_precision,
    element.fk_precisionalti,
    element.fk_object_reference,
    element.altitude,
    element.year,
    element.year_end,
    element.orientation,
    element.remark,
    element.schema_force_visible,
    element.label_1_visible,
    element.label_1_x,
    element.label_1_y,
    element.label_1_rotation,
    element.label_1_text,
    element.label_2_visible,
    element.label_2_x,
    element.label_2_y,
    element.label_2_rotation,
    element.label_2_text
   FROM (qwat_od.samplingpoint samplingpoint
     JOIN qwat_od.vw_node_element element ON ((samplingpoint.id = element.id)));"
"vw_export_part"," SELECT vw_element_part.id,
    vw_element_part.fk_district,
    vw_element_part.fk_pressurezone,
    vw_element_part.fk_printmap,
    vw_element_part._printmaps,
    vw_element_part._geometry_alt1_used,
    vw_element_part._geometry_alt2_used,
    vw_element_part._pipe_node_type,
    vw_element_part._pipe_orientation,
    vw_element_part._pipe_schema_visible,
    vw_element_part.geometry,
    vw_element_part.geometry_alt1,
    vw_element_part.geometry_alt2,
    vw_element_part.update_geometry_alt1,
    vw_element_part.update_geometry_alt2,
    vw_element_part.identification,
    vw_element_part.fk_distributor,
    vw_element_part.fk_status,
    vw_element_part.fk_folder,
    vw_element_part.fk_locationtype,
    vw_element_part.fk_precision,
    vw_element_part.fk_precisionalti,
    vw_element_part.fk_object_reference,
    vw_element_part.altitude,
    vw_element_part.year,
    vw_element_part.year_end,
    vw_element_part.orientation,
    vw_element_part.remark,
    vw_element_part.schema_force_visible,
    vw_element_part.label_1_visible,
    vw_element_part.label_1_x,
    vw_element_part.label_1_y,
    vw_element_part.label_1_rotation,
    vw_element_part.label_1_text,
    vw_element_part.label_2_visible,
    vw_element_part.label_2_x,
    vw_element_part.label_2_y,
    vw_element_part.label_2_rotation,
    vw_element_part.label_2_text,
    vw_element_part.fk_part_type,
    vw_element_part.fk_pipe,
    status.vl_active AS status_vl_active,
    status.short_fr AS status_short_fr,
    status.short_en AS status_short_en,
    status.short_ro AS status_short_ro,
    status.value_fr AS status_value_fr,
    status.value_en AS status_value_en,
    status.value_ro AS status_value_ro,
    status.description_fr AS status_description_fr,
    status.description_en AS status_description_en,
    status.description_ro AS status_description_ro,
    status.active AS status_active,
    status.code_sire AS status_code_sire,
    district.name AS district_name,
    district.shortname AS district_shortname,
    district.zip AS district_zip,
    district.land_registry AS district_land_registry,
    district.prefix AS district_prefix,
    district.colorcode AS district_colorcode,
    district.geometry AS district_geometry,
    district.label_1_visible AS district_label_1_visible,
    district.label_1_x AS district_label_1_x,
    district.label_1_y AS district_label_1_y,
    district.label_1_rotation AS district_label_1_rotation,
    district.label_1_text AS district_label_1_text,
    district.label_2_visible AS district_label_2_visible,
    district.label_2_x AS district_label_2_x,
    district.label_2_y AS district_label_2_y,
    district.label_2_rotation AS district_label_2_rotation,
    district.label_2_text AS district_label_2_text,
    pressurezone.fk_distributor AS pressurezone_fk_distributor,
    pressurezone.fk_consumptionzone AS pressurezone_fk_consumptionzone,
    pressurezone.name AS pressurezone_name,
    pressurezone.population AS pressurezone_population,
    pressurezone.subscriber AS pressurezone_subscriber,
    pressurezone.colorcode AS pressurezone_colorcode,
    pressurezone.geometry AS pressurezone_geometry,
    pressurezone.geometry_alt1 AS pressurezone_geometry_alt1,
    pressurezone.geometry_alt2 AS pressurezone_geometry_alt2,
    pressurezone._geometry_alt1_used AS pressurezone__geometry_alt1_used,
    pressurezone._geometry_alt2_used AS pressurezone__geometry_alt2_used,
    pressurezone.update_geometry_alt1 AS pressurezone_update_geometry_alt1,
    pressurezone.update_geometry_alt2 AS pressurezone_update_geometry_alt2,
    pressurezone.label_1_visible AS pressurezone_label_1_visible,
    pressurezone.label_1_x AS pressurezone_label_1_x,
    pressurezone.label_1_y AS pressurezone_label_1_y,
    pressurezone.label_1_rotation AS pressurezone_label_1_rotation,
    pressurezone.label_1_text AS pressurezone_label_1_text,
    pressurezone.label_2_visible AS pressurezone_label_2_visible,
    pressurezone.label_2_x AS pressurezone_label_2_x,
    pressurezone.label_2_y AS pressurezone_label_2_y,
    pressurezone.label_2_rotation AS pressurezone_label_2_rotation,
    pressurezone.label_2_text AS pressurezone_label_2_text,
    precision.vl_active AS precision_vl_active,
    precision.short_fr AS precision_short_fr,
    precision.short_en AS precision_short_en,
    precision.short_ro AS precision_short_ro,
    precision.value_fr AS precision_value_fr,
    precision.value_en AS precision_value_en,
    precision.value_ro AS precision_value_ro,
    precision.description_fr AS precision_description_fr,
    precision.description_en AS precision_description_en,
    precision.description_ro AS precision_description_ro,
    precision.code_sire AS precision_code_sire,
    part_type.vl_active AS part_type_vl_active,
    part_type.short_fr AS part_type_short_fr,
    part_type.short_en AS part_type_short_en,
    part_type.short_ro AS part_type_short_ro,
    part_type.value_fr AS part_type_value_fr,
    part_type.value_en AS part_type_value_en,
    part_type.value_ro AS part_type_value_ro,
    part_type.description_fr AS part_type_description_fr,
    part_type.description_en AS part_type_description_en,
    part_type.description_ro AS part_type_description_ro,
    object_reference.vl_active AS object_reference_vl_active,
    object_reference.short_fr AS object_reference_short_fr,
    object_reference.short_en AS object_reference_short_en,
    object_reference.short_ro AS object_reference_short_ro,
    object_reference.value_fr AS object_reference_value_fr,
    object_reference.value_en AS object_reference_value_en,
    object_reference.value_ro AS object_reference_value_ro,
    object_reference.description_fr AS object_reference_description_fr,
    object_reference.description_en AS object_reference_description_en,
    object_reference.description_ro AS object_reference_description_ro,
    distributor.name AS distributor_name,
    folder.identification AS folder_identification,
    folder.description AS folder_description,
    folder.date_start AS folder_date_start,
    folder.date_end AS folder_date_end,
    folder.geometry_polygon AS folder_geometry_polygon,
    folder.geometry_line AS folder_geometry_line,
    precisionalti.vl_active AS precisionalti_vl_active,
    precisionalti.short_fr AS precisionalti_short_fr,
    precisionalti.short_en AS precisionalti_short_en,
    precisionalti.short_ro AS precisionalti_short_ro,
    precisionalti.value_fr AS precisionalti_value_fr,
    precisionalti.value_en AS precisionalti_value_en,
    precisionalti.value_ro AS precisionalti_value_ro,
    precisionalti.description_fr AS precisionalti_description_fr,
    precisionalti.description_en AS precisionalti_description_en,
    precisionalti.description_ro AS precisionalti_description_ro,
    precisionalti.code_sire AS precisionalti_code_sire
   FROM (((((((((qwat_od.vw_element_part
     LEFT JOIN qwat_vl.status status ON ((vw_element_part.fk_status = status.id)))
     LEFT JOIN qwat_od.district district ON ((vw_element_part.fk_pressurezone = district.id)))
     LEFT JOIN qwat_od.pressurezone pressurezone ON ((vw_element_part.fk_pressurezone = pressurezone.id)))
     LEFT JOIN qwat_vl.precision precision ON ((vw_element_part.fk_precision = precision.id)))
     LEFT JOIN qwat_vl.part_type part_type ON ((vw_element_part.fk_part_type = part_type.id)))
     LEFT JOIN qwat_vl.object_reference object_reference ON ((vw_element_part.fk_object_reference = object_reference.id)))
     LEFT JOIN qwat_od.distributor distributor ON ((vw_element_part.fk_distributor = distributor.id)))
     LEFT JOIN qwat_od.folder folder ON ((vw_element_part.fk_folder = folder.id)))
     LEFT JOIN qwat_vl.precisionalti precisionalti ON ((vw_element_part.fk_precisionalti = precisionalti.id)));"
"vw_element_valve"," SELECT element.id,
    element.fk_district,
    element.fk_pressurezone,
    element.fk_printmap,
    element._printmaps,
    element._geometry_alt1_used,
    element._geometry_alt2_used,
    element._pipe_node_type,
    element._pipe_orientation,
    element._pipe_schema_visible,
    element.geometry,
    element.geometry_alt1,
    element.geometry_alt2,
    element.update_geometry_alt1,
    element.update_geometry_alt2,
    element.identification,
    element.fk_distributor,
    element.fk_status,
    element.fk_folder,
    element.fk_locationtype,
    element.fk_precision,
    element.fk_precisionalti,
    element.fk_object_reference,
    element.altitude,
    element.year,
    element.year_end,
    element.orientation,
    element.remark,
    element.schema_force_visible,
    element.label_1_visible,
    element.label_1_x,
    element.label_1_y,
    element.label_1_rotation,
    element.label_1_text,
    element.label_2_visible,
    element.label_2_x,
    element.label_2_y,
    element.label_2_rotation,
    element.label_2_text,
    valve.fk_valve_type,
    valve.fk_valve_function,
    valve.fk_valve_actuation,
    valve.fk_pipe,
    valve.fk_handle_precision,
    valve.fk_handle_precisionalti,
    valve.fk_maintenance,
    valve.diameter_nominal,
    valve.closed,
    valve.networkseparation,
    valve.handle_altitude,
    valve.handle_geometry
   FROM (qwat_od.valve valve
     JOIN qwat_od.vw_node_element element ON ((valve.id = element.id)));"
"vw_export_subscriber"," SELECT vw_element_subscriber.id,
    vw_element_subscriber.fk_district,
    vw_element_subscriber.fk_pressurezone,
    vw_element_subscriber.fk_printmap,
    vw_element_subscriber._printmaps,
    vw_element_subscriber._geometry_alt1_used,
    vw_element_subscriber._geometry_alt2_used,
    vw_element_subscriber._pipe_node_type,
    vw_element_subscriber._pipe_orientation,
    vw_element_subscriber._pipe_schema_visible,
    vw_element_subscriber.geometry,
    vw_element_subscriber.geometry_alt1,
    vw_element_subscriber.geometry_alt2,
    vw_element_subscriber.update_geometry_alt1,
    vw_element_subscriber.update_geometry_alt2,
    vw_element_subscriber.identification,
    vw_element_subscriber.fk_distributor,
    vw_element_subscriber.fk_status,
    vw_element_subscriber.fk_folder,
    vw_element_subscriber.fk_locationtype,
    vw_element_subscriber.fk_precision,
    vw_element_subscriber.fk_precisionalti,
    vw_element_subscriber.fk_object_reference,
    vw_element_subscriber.altitude,
    vw_element_subscriber.year,
    vw_element_subscriber.year_end,
    vw_element_subscriber.orientation,
    vw_element_subscriber.remark,
    vw_element_subscriber.schema_force_visible,
    vw_element_subscriber.label_1_visible,
    vw_element_subscriber.label_1_x,
    vw_element_subscriber.label_1_y,
    vw_element_subscriber.label_1_rotation,
    vw_element_subscriber.label_1_text,
    vw_element_subscriber.label_2_visible,
    vw_element_subscriber.label_2_x,
    vw_element_subscriber.label_2_y,
    vw_element_subscriber.label_2_rotation,
    vw_element_subscriber.label_2_text,
    vw_element_subscriber.fk_subscriber_type,
    vw_element_subscriber.fk_pipe,
    vw_element_subscriber.parcel,
    vw_element_subscriber.flow_current,
    vw_element_subscriber.flow_planned,
    status.vl_active AS status_vl_active,
    status.short_fr AS status_short_fr,
    status.short_en AS status_short_en,
    status.short_ro AS status_short_ro,
    status.value_fr AS status_value_fr,
    status.value_en AS status_value_en,
    status.value_ro AS status_value_ro,
    status.description_fr AS status_description_fr,
    status.description_en AS status_description_en,
    status.description_ro AS status_description_ro,
    status.active AS status_active,
    status.code_sire AS status_code_sire,
    district.name AS district_name,
    district.shortname AS district_shortname,
    district.zip AS district_zip,
    district.land_registry AS district_land_registry,
    district.prefix AS district_prefix,
    district.colorcode AS district_colorcode,
    district.geometry AS district_geometry,
    district.label_1_visible AS district_label_1_visible,
    district.label_1_x AS district_label_1_x,
    district.label_1_y AS district_label_1_y,
    district.label_1_rotation AS district_label_1_rotation,
    district.label_1_text AS district_label_1_text,
    district.label_2_visible AS district_label_2_visible,
    district.label_2_x AS district_label_2_x,
    district.label_2_y AS district_label_2_y,
    district.label_2_rotation AS district_label_2_rotation,
    district.label_2_text AS district_label_2_text,
    pressurezone.fk_distributor AS pressurezone_fk_distributor,
    pressurezone.fk_consumptionzone AS pressurezone_fk_consumptionzone,
    pressurezone.name AS pressurezone_name,
    pressurezone.population AS pressurezone_population,
    pressurezone.subscriber AS pressurezone_subscriber,
    pressurezone.colorcode AS pressurezone_colorcode,
    pressurezone.geometry AS pressurezone_geometry,
    pressurezone.geometry_alt1 AS pressurezone_geometry_alt1,
    pressurezone.geometry_alt2 AS pressurezone_geometry_alt2,
    pressurezone._geometry_alt1_used AS pressurezone__geometry_alt1_used,
    pressurezone._geometry_alt2_used AS pressurezone__geometry_alt2_used,
    pressurezone.update_geometry_alt1 AS pressurezone_update_geometry_alt1,
    pressurezone.update_geometry_alt2 AS pressurezone_update_geometry_alt2,
    pressurezone.label_1_visible AS pressurezone_label_1_visible,
    pressurezone.label_1_x AS pressurezone_label_1_x,
    pressurezone.label_1_y AS pressurezone_label_1_y,
    pressurezone.label_1_rotation AS pressurezone_label_1_rotation,
    pressurezone.label_1_text AS pressurezone_label_1_text,
    pressurezone.label_2_visible AS pressurezone_label_2_visible,
    pressurezone.label_2_x AS pressurezone_label_2_x,
    pressurezone.label_2_y AS pressurezone_label_2_y,
    pressurezone.label_2_rotation AS pressurezone_label_2_rotation,
    pressurezone.label_2_text AS pressurezone_label_2_text,
    precision.vl_active AS precision_vl_active,
    precision.short_fr AS precision_short_fr,
    precision.short_en AS precision_short_en,
    precision.short_ro AS precision_short_ro,
    precision.value_fr AS precision_value_fr,
    precision.value_en AS precision_value_en,
    precision.value_ro AS precision_value_ro,
    precision.description_fr AS precision_description_fr,
    precision.description_en AS precision_description_en,
    precision.description_ro AS precision_description_ro,
    precision.code_sire AS precision_code_sire,
    subscriber_type.vl_active AS subscriber_type_vl_active,
    subscriber_type.short_fr AS subscriber_type_short_fr,
    subscriber_type.short_en AS subscriber_type_short_en,
    subscriber_type.short_ro AS subscriber_type_short_ro,
    subscriber_type.value_fr AS subscriber_type_value_fr,
    subscriber_type.value_en AS subscriber_type_value_en,
    subscriber_type.value_ro AS subscriber_type_value_ro,
    subscriber_type.description_fr AS subscriber_type_description_fr,
    subscriber_type.description_en AS subscriber_type_description_en,
    subscriber_type.description_ro AS subscriber_type_description_ro,
    object_reference.vl_active AS object_reference_vl_active,
    object_reference.short_fr AS object_reference_short_fr,
    object_reference.short_en AS object_reference_short_en,
    object_reference.short_ro AS object_reference_short_ro,
    object_reference.value_fr AS object_reference_value_fr,
    object_reference.value_en AS object_reference_value_en,
    object_reference.value_ro AS object_reference_value_ro,
    object_reference.description_fr AS object_reference_description_fr,
    object_reference.description_en AS object_reference_description_en,
    object_reference.description_ro AS object_reference_description_ro,
    distributor.name AS distributor_name,
    folder.identification AS folder_identification,
    folder.description AS folder_description,
    folder.date_start AS folder_date_start,
    folder.date_end AS folder_date_end,
    folder.geometry_polygon AS folder_geometry_polygon,
    folder.geometry_line AS folder_geometry_line,
    precisionalti.vl_active AS precisionalti_vl_active,
    precisionalti.short_fr AS precisionalti_short_fr,
    precisionalti.short_en AS precisionalti_short_en,
    precisionalti.short_ro AS precisionalti_short_ro,
    precisionalti.value_fr AS precisionalti_value_fr,
    precisionalti.value_en AS precisionalti_value_en,
    precisionalti.value_ro AS precisionalti_value_ro,
    precisionalti.description_fr AS precisionalti_description_fr,
    precisionalti.description_en AS precisionalti_description_en,
    precisionalti.description_ro AS precisionalti_description_ro,
    precisionalti.code_sire AS precisionalti_code_sire
   FROM (((((((((qwat_od.vw_element_subscriber
     LEFT JOIN qwat_vl.status status ON ((vw_element_subscriber.fk_status = status.id)))
     LEFT JOIN qwat_od.district district ON ((vw_element_subscriber.fk_district = district.id)))
     LEFT JOIN qwat_od.pressurezone pressurezone ON ((vw_element_subscriber.fk_pressurezone = pressurezone.id)))
     LEFT JOIN qwat_vl.precision precision ON ((vw_element_subscriber.fk_precision = precision.id)))
     LEFT JOIN qwat_vl.subscriber_type subscriber_type ON ((vw_element_subscriber.fk_subscriber_type = subscriber_type.id)))
     LEFT JOIN qwat_vl.object_reference object_reference ON ((vw_element_subscriber.fk_object_reference = object_reference.id)))
     LEFT JOIN qwat_od.distributor distributor ON ((vw_element_subscriber.fk_distributor = distributor.id)))
     LEFT JOIN qwat_od.folder folder ON ((vw_element_subscriber.fk_folder = folder.id)))
     LEFT JOIN qwat_vl.precisionalti precisionalti ON ((vw_element_subscriber.fk_precisionalti = precisionalti.id)));"
"vw_qwat_network_element"," SELECT
        CASE
            WHEN (subscriber.id IS NOT NULL) THEN 'subscriber'::qwat_od.element_type
            WHEN (part.id IS NOT NULL) THEN 'part'::qwat_od.element_type
            WHEN (installation.id IS NOT NULL) THEN 'installation'::qwat_od.element_type
            WHEN (hydrant.id IS NOT NULL) THEN 'hydrant'::qwat_od.element_type
            WHEN (samplingpoint.id IS NOT NULL) THEN 'samplingpoint'::qwat_od.element_type
            WHEN (valve.id IS NOT NULL) THEN 'valve'::qwat_od.element_type
            WHEN (meter.id IS NOT NULL) THEN 'meter'::qwat_od.element_type
            ELSE 'element'::qwat_od.element_type
        END AS element_type,
    element.id,
    element.fk_district,
    element.fk_pressurezone,
    element.fk_printmap,
    element._printmaps,
    element._geometry_alt1_used,
    element._geometry_alt2_used,
    element._pipe_node_type,
    element._pipe_orientation,
    element._pipe_schema_visible,
    element.geometry,
    element.geometry_alt1,
    element.geometry_alt2,
    element.update_geometry_alt1,
    element.update_geometry_alt2,
    element.identification,
    element.fk_distributor,
    element.fk_status,
    element.fk_folder,
    element.fk_locationtype,
    element.fk_precision,
    element.fk_precisionalti,
    element.fk_object_reference,
    element.altitude,
    element.year,
    element.year_end,
    element.orientation,
    element.remark,
    element.schema_force_visible,
    element.label_1_visible,
    element.label_1_x,
    element.label_1_y,
    element.label_1_rotation,
    element.label_1_text,
    element.label_2_visible,
    element.label_2_x,
    element.label_2_y,
    element.label_2_rotation,
    element.label_2_text,
        CASE
            WHEN (valve.id IS NOT NULL) THEN valve.networkseparation
            WHEN (installation.id IS NOT NULL) THEN installation.networkseparation
            ELSE NULL::boolean
        END AS networkseparation,
        CASE
            WHEN (subscriber.id IS NOT NULL) THEN subscriber.parcel
            WHEN (installation.id IS NOT NULL) THEN installation.parcel
            WHEN (meter.id IS NOT NULL) THEN meter.parcel
            ELSE NULL::character varying
        END AS parcel,
        CASE
            WHEN (subscriber.id IS NOT NULL) THEN subscriber.fk_pipe
            WHEN (part.id IS NOT NULL) THEN part.fk_pipe
            WHEN (valve.id IS NOT NULL) THEN valve.fk_pipe
            WHEN (meter.id IS NOT NULL) THEN meter.fk_pipe
            ELSE NULL::integer
        END AS fk_pipe,
    subscriber.fk_subscriber_type,
    subscriber.flow_current,
    subscriber.flow_planned,
    part.fk_part_type,
    installation.installation_type,
    installation.name,
    installation.fk_parent,
    installation.fk_remote,
    installation.fk_watertype,
    installation.eca,
    installation.open_water_surface,
    installation.geometry_polygon,
    installation.fk_source_type,
    installation.fk_source_quality,
    installation.flow_lowest,
    installation.flow_average,
    installation.flow_concession,
    installation.contract_end,
    installation.gathering_chamber,
    installation.fk_pump_type,
    installation.fk_pipe_in,
    installation.fk_pipe_out,
    installation.fk_pump_operating,
    installation.no_pumps,
    installation.rejected_flow,
    installation.manometric_height,
    installation.fk_overflow,
    installation.fk_tank_firestorage,
    installation.storage_total,
    installation.storage_supply,
    installation.storage_fire,
    installation.altitude_overflow,
    installation.altitude_apron,
    installation.height_max,
    installation.fire_valve,
    installation.fire_remote,
    installation._litrepercm,
    installation.cistern1_fk_type,
    installation.cistern1_dimension_1,
    installation.cistern1_dimension_2,
    installation.cistern1_storage,
    installation._cistern1_litrepercm,
    installation.cistern2_fk_type,
    installation.cistern2_dimension_1,
    installation.cistern2_dimension_2,
    installation.cistern2_storage,
    installation._cistern2_litrepercm,
    installation.sanitization_uv,
    installation.sanitization_chlorine_liquid,
    installation.sanitization_chlorine_gazeous,
    installation.sanitization_ozone,
    installation.filtration_membrane,
    installation.filtration_sandorgravel,
    installation.flocculation,
    installation.activatedcharcoal,
    installation.settling,
    installation.treatment_capacity,
    installation.flow_meter,
    installation.water_meter,
    installation.manometer,
    installation.depth,
    installation.no_valves,
    installation.fk_pressurecontrol_type,
    hydrant.fk_provider,
    hydrant.fk_model_sup,
    hydrant.fk_model_inf,
    hydrant.fk_material,
    hydrant.fk_output,
    hydrant.underground,
    hydrant.marked,
    hydrant.pressure_static,
    hydrant.pressure_dynamic,
    hydrant.flow,
    hydrant.observation_date,
    hydrant.observation_source,
    valve.fk_valve_type,
    valve.fk_valve_function,
    valve.fk_valve_actuation,
    valve.fk_handle_precision,
    valve.fk_handle_precisionalti,
    valve.fk_maintenance,
    valve.diameter_nominal,
    valve.closed,
    valve.handle_altitude,
    valve.handle_geometry
   FROM (((((((qwat_od.vw_node_element element
     LEFT JOIN qwat_od.subscriber subscriber ON ((element.id = subscriber.id)))
     LEFT JOIN qwat_od.part part ON ((element.id = part.id)))
     LEFT JOIN qwat_od.vw_qwat_installation installation ON ((element.id = installation.id)))
     LEFT JOIN qwat_od.hydrant hydrant ON ((element.id = hydrant.id)))
     LEFT JOIN qwat_od.samplingpoint samplingpoint ON ((element.id = samplingpoint.id)))
     LEFT JOIN qwat_od.valve valve ON ((element.id = valve.id)))
     LEFT JOIN qwat_od.meter meter ON ((element.id = meter.id)));"
"vw_search_view"," SELECT 'Ouvrages'::text AS layer_name,
        CASE
            WHEN (vw_export_installation.installation_type = 'source'::qwat_od.installation_type) THEN ((('Source '::text || (vw_export_installation.identification)::text) || ' '::text) || (vw_export_installation.name)::text)
            WHEN (vw_export_installation.installation_type = 'treatment'::qwat_od.installation_type) THEN ((('Traitement '::text || (vw_export_installation.identification)::text) || ' '::text) || (vw_export_installation.name)::text)
            WHEN (vw_export_installation.installation_type = 'tank'::qwat_od.installation_type) THEN ((('Réservoir '::text || (vw_export_installation.identification)::text) || ' '::text) || (vw_export_installation.name)::text)
            WHEN (vw_export_installation.installation_type = 'pressurecontrol'::qwat_od.installation_type) THEN ((('Régulation de pression '::text || (vw_export_installation.identification)::text) || ' '::text) || (vw_export_installation.name)::text)
            WHEN (vw_export_installation.installation_type = 'pump'::qwat_od.installation_type) THEN ((('Pompage '::text || (vw_export_installation.identification)::text) || ' '::text) || (vw_export_installation.name)::text)
            WHEN (vw_export_installation.installation_type = 'chamber'::qwat_od.installation_type) THEN ((('Chambre '::text || (vw_export_installation.identification)::text) || ' '::text) || (vw_export_installation.name)::text)
            ELSE NULL::text
        END AS search_text,
    st_force2d(vw_export_installation.geometry) AS geometry
   FROM qwat_od.vw_export_installation
  WHERE (vw_export_installation.status_active IS TRUE)
UNION
 SELECT 'Hydrantes'::text AS layer_name,
    (((vw_export_hydrant.district_name)::text || ' '::text) || (vw_export_hydrant.identification)::text) AS search_text,
    st_force2d(vw_export_hydrant.geometry) AS geometry
   FROM qwat_od.vw_export_hydrant
  WHERE (vw_export_hydrant.status_active IS TRUE)
UNION
 SELECT 'Abonnés'::text AS layer_name,
    ((((((vw_export_subscriber.subscriber_type_value_fr)::text || ' '::text) || COALESCE(((vw_export_subscriber.district_prefix)::text || '_'::text), ''::text)) || (vw_export_subscriber.identification)::text) || ' '::text) || (vw_export_subscriber.district_name)::text) AS search_text,
    st_force2d(vw_export_subscriber.geometry) AS geometry
   FROM qwat_od.vw_export_subscriber
UNION
 SELECT 'Compteur'::text AS layer_name,
    (COALESCE(((meter.district_prefix)::text || '_'::text)) || (meter.identification)::text) AS search_text,
    st_force2d(meter.geometry) AS geometry
   FROM qwat_od.vw_export_meter meter
UNION
 SELECT 'Vannes'::text AS layer_name,
    (((((vw_export_valve.valve_function_value_fr)::text || ' '::text) || (vw_export_valve.identification)::text) || ' '::text) || (vw_export_valve.district_name)::text) AS search_text,
    st_force2d(vw_export_valve.geometry) AS geometry
   FROM qwat_od.vw_export_valve
  WHERE (vw_export_valve.identification IS NOT NULL);"
"vw_subscriber_pipe_relation"," SELECT a.id,
    a.identification,
    (st_makeline(st_force2d(a.geometry), st_line_interpolate_point(st_force2d(b.geometry), (0.5)::double precision)))::geometry(LineString,21781) AS geometry
   FROM (qwat_od.vw_element_subscriber a
     JOIN qwat_od.pipe b ON ((a.fk_pipe = b.id)))
  WHERE (a.fk_pipe IS NOT NULL);"
"vw_valve_lines"," SELECT valve.id,
    (st_makeline(st_force2d(valve.handle_geometry), valve.geometry))::geometry(LineString,21781) AS geometry
   FROM qwat_od.vw_element_valve valve
  WHERE ((valve.handle_geometry IS NOT NULL) AND (valve.geometry IS NOT NULL));"
"vw_pipe_child_parent"," SELECT foo2.child,
    foo2.parent,
    (st_curvetoline(st_geomfromewkt((((((((((((((('SRID='::text || qwat_sys.fn_setting_srid()) || ';CIRCULARSTRING('::text) || st_x(foo2.start_point)) || ' '::text) || st_y(foo2.start_point)) || ','::text) || (st_x(foo2.middle_point) + (foo2.distance * cos(foo2.azimuth)))) || ' '::text) || (st_y(foo2.middle_point) + (foo2.distance * sin(foo2.azimuth)))) || ','::text) || st_x(foo2.end_point)) || ' '::text) || st_y(foo2.end_point)) || ')'::text)), 15))::geometry(LineString,21781) AS geometry
   FROM ( SELECT foo.child,
            foo.parent,
            foo.start_point,
            foo.end_point,
            ((pi() / (2)::double precision) + st_azimuth(foo.start_point, foo.end_point)) AS azimuth,
            ((0.5)::double precision * st_distance(foo.start_point, foo.end_point)) AS distance,
            (st_line_interpolate_point(st_makeline(foo.start_point, foo.end_point), (0.5)::double precision))::geometry(Point,21781) AS middle_point
           FROM ( SELECT a.id AS child,
                    b.id AS parent,
                    (st_force2d(st_line_interpolate_point(a.geometry, (0.5)::double precision)))::geometry(Point,21781) AS start_point,
                    st_closestpoint(st_makeline((st_line_interpolate_point(st_force2d(b.geometry), (LEAST((1)::numeric, (((4)::numeric / b._length2d) / (2)::numeric)))::double precision))::geometry(Point,21781), (st_line_interpolate_point(st_force2d(b.geometry), (GREATEST((0)::numeric, ((1)::numeric - (((4)::numeric / b._length2d) / (2)::numeric))))::double precision))::geometry(Point,21781)), a.geometry) AS end_point
                   FROM (qwat_od.pipe a
                     JOIN qwat_od.pipe b ON ((a.fk_parent = b.id)))
                  WHERE (a.fk_parent IS NOT NULL)) foo) foo2;"
"settings_id_seq"
"versions_id_seq"
"logged_actions_event_id_seq"
"annotationline_id_seq"
"annotationpoint_id_seq"
"constructionpoint_id_seq"
"dimension_orientation_id_seq"
"consumptionzone_id_seq"
"dimension_distance_id_seq"
"distributor_id_seq"
"worker_id_seq"
"pressurezone_id_seq"
"district_id_seq"
"folder_id_seq"
"printmap_id_seq"
"protectionzone_id_seq"
"node_id_seq"
"pipe_id_seq"
"crossing_id_seq"
"meter_reference_id_seq"
"subscriber_reference_id_seq"
"cover_id_seq"
"remote_id_seq"
"leak_id_seq"
"annotationline","annotationline_geoidx","geometry"
"annotationline","annotationline_pkey","id"
"annotationpoint","annotationpoint_geoidx","geometry"
"annotationpoint","annotationpoint_pkey","id"
"bedding","vl_bedding_pk","id"
"chamber","chamber_pkey","id"
"cistern","vl_cistern_pk","id"
"constructionpoint","constructionpoint_geoidx","geometry"
"constructionpoint","constructionpoint_pkey","id"
"constructionpoint","fki_constructionpoint_fk_object_reference","fk_object_reference"
"consumptionzone","consumptionzone_name","name"
"consumptionzone","consumptionzone_pkey","id"
"cover","cover_pkey","id"
"cover","fki_cover_fk_installation","fk_installation"
"cover","fki_cover_fk_type","fk_cover_type"
"cover","fki_cover_label_1_visible","label_1_visible"
"cover","fki_cover_label_2_visible","label_2_visible"
"cover_type","vl_cover_type_pk","id"
"crossing","crossing_pkey","id"
"dimension_distance","dimension_distance_geoidx","geometry"
"dimension_distance","dimension_distance_pkey","id"
"dimension_orientation","dimension_orientation_geoidx","geometry"
"dimension_orientation","dimension_orientation_pkey","id"
"distributor","distributor_name","name"
"distributor","distributor_pk","id"
"district","district_geoidx","geometry"
"district","district_name","name"
"district","district_pkey","id"
"district","fki_district_label_1_visible","label_1_visible"
"district","fki_district_label_2_visible","label_2_visible"
"folder","folder_geoidx_line","geometry_line"
"folder","folder_geoidx_polygon","geometry_polygon"
"folder","folder_identification","identification"
"folder","folder_pkey","id"
"hydrant","fki_hydrant_fk_material","fk_material"
"hydrant","fki_hydrant_fk_model_inf","fk_model_inf"
"hydrant","fki_hydrant_fk_model_sup","fk_model_sup"
"hydrant","fki_hydrant_fk_output","fk_output"
"hydrant","fki_hydrant_fk_provider","fk_provider"
"hydrant","hydrant_pkey","id"
"hydrant_material","vl_hydrant_material_pk","id"
"hydrant_model_inf","vl_hydrant_model_inf_pk","id"
"hydrant_model_sup","vl_hydrant_model_sup_pk","id"
"hydrant_output","vl_hydrant_output_pk","id"
"hydrant_provider","vl_hydrant_provider_pk","id"
"installation","fki_installation_fk_parent","fk_parent"
"installation","fki_installation_fk_remote","fk_remote"
"installation","fki_installation_watertype","fk_watertype"
"installation","installation_pkey","id"
"installation","installation_poly_geoidx","geometry_polygon"
"leak","fki_leak_fk_cause","fk_cause"
"leak","fki_leak_fk_pipe","fk_pipe"
"leak","fki_leak_label_1_visible","label_1_visible"
"leak","fki_leak_label_2_visible","label_2_visible"
"leak","leak_pkey","id"
"leak_cause","vl_leak_cause_pk","id"
"locationtype","vl_location_pk","id"
"logged_actions","logged_actions_action_idx","action"
"logged_actions","logged_actions_action_tstamp_tx_stm_idx","action_tstamp_stm"
"logged_actions","logged_actions_pkey","event_id"
"logged_actions","logged_actions_relid_idx","relid"
"meter","fki_meter_fk_pipe","fk_pipe"
"meter","meter_pkey","id"
"meter_reference","fki_meter_reference_fk_meter","fk_meter"
"meter_reference","meter_reference_geoidx_sch","geometry"
"meter_reference","meter_reference_pkey","id"
"network_element","fki_element_fk_distributor","fk_distributor"
"network_element","fki_element_fk_folder","fk_folder"
"network_element","fki_element_fk_object_reference","fk_object_reference"
"network_element","fki_element_fk_precision","fk_precision"
"network_element","fki_element_fk_precisionalti","fk_precisionalti"
"network_element","fki_element_fk_status","fk_status"
"network_element","fki_network_element_label_1_visible","label_1_visible"
"network_element","fki_network_element_label_2_visible","label_2_visible"
"network_element","fki_network_element_schema_force_visible","schema_force_visible"
"network_element","network_element_pkey","id"
"node","fki_node_fk_district","fk_district"
"node","fki_node_fk_pressurezone","fk_pressurezone"
"node","node_geoidx","geometry"
"node","node_geoidx_alt1","geometry_alt1"
"node","node_geoidx_alt2","geometry_alt2"
"node","node_pkey","id"
"object_reference","vl_object_reference_pk","id"
"overflow","vl_overflow_pk","id"
"part","fki_part_fk_pipe","fk_pipe"
"part","fki_part_fk_type","fk_part_type"
"part","part_pkey","id"
"part_type","vl_part_type_pk","id"
"pg_aggregate","pg_aggregate_fnoid_index","aggfnoid"
"pg_am","pg_am_name_index","amname"
"pg_am","pg_am_oid_index","oid"
"pg_amop","pg_amop_fam_strat_index","amopfamily"
"pg_amop","pg_amop_fam_strat_index","amopstrategy"
"pg_amop","pg_amop_fam_strat_index","amoprighttype"
"pg_amop","pg_amop_fam_strat_index","amoplefttype"
"pg_amop","pg_amop_oid_index","oid"
"pg_amop","pg_amop_opr_fam_index","amopopr"
"pg_amop","pg_amop_opr_fam_index","amoppurpose"
"pg_amop","pg_amop_opr_fam_index","amopfamily"
"pg_amproc","pg_amproc_fam_proc_index","amprocfamily"
"pg_amproc","pg_amproc_fam_proc_index","amprocnum"
"pg_amproc","pg_amproc_fam_proc_index","amprocrighttype"
"pg_amproc","pg_amproc_fam_proc_index","amproclefttype"
"pg_amproc","pg_amproc_oid_index","oid"
"pg_attrdef","pg_attrdef_adrelid_adnum_index","adrelid"
"pg_attrdef","pg_attrdef_adrelid_adnum_index","adnum"
"pg_attrdef","pg_attrdef_oid_index","oid"
"pg_attribute","pg_attribute_relid_attnam_index","attrelid"
"pg_attribute","pg_attribute_relid_attnam_index","attname"
"pg_attribute","pg_attribute_relid_attnum_index","attrelid"
"pg_attribute","pg_attribute_relid_attnum_index","attnum"
"pg_auth_members","pg_auth_members_member_role_index","member"
"pg_auth_members","pg_auth_members_member_role_index","roleid"
"pg_auth_members","pg_auth_members_role_member_index","roleid"
"pg_auth_members","pg_auth_members_role_member_index","member"
"pg_authid","pg_authid_oid_index","oid"
"pg_authid","pg_authid_rolname_index","rolname"
"pg_cast","pg_cast_oid_index","oid"
"pg_cast","pg_cast_source_target_index","casttarget"
"pg_cast","pg_cast_source_target_index","castsource"
"pg_class","pg_class_oid_index","oid"
"pg_class","pg_class_relname_nsp_index","relnamespace"
"pg_class","pg_class_relname_nsp_index","relname"
"pg_class","pg_class_tblspc_relfilenode_index","relfilenode"
"pg_class","pg_class_tblspc_relfilenode_index","reltablespace"
"pg_collation","pg_collation_name_enc_nsp_index","collencoding"
"pg_collation","pg_collation_name_enc_nsp_index","collname"
"pg_collation","pg_collation_name_enc_nsp_index","collnamespace"
"pg_collation","pg_collation_oid_index","oid"
"pg_constraint","pg_constraint_conname_nsp_index","conname"
"pg_constraint","pg_constraint_conname_nsp_index","connamespace"
"pg_constraint","pg_constraint_conrelid_index","conrelid"
"pg_constraint","pg_constraint_contypid_index","contypid"
"pg_constraint","pg_constraint_oid_index","oid"
"pg_conversion","pg_conversion_default_index","oid"
"pg_conversion","pg_conversion_default_index","connamespace"
"pg_conversion","pg_conversion_default_index","conforencoding"
"pg_conversion","pg_conversion_default_index","contoencoding"
"pg_conversion","pg_conversion_name_nsp_index","conname"
"pg_conversion","pg_conversion_name_nsp_index","connamespace"
"pg_conversion","pg_conversion_oid_index","oid"
"pg_database","pg_database_datname_index","datname"
"pg_database","pg_database_oid_index","oid"
"pg_db_role_setting","pg_db_role_setting_databaseid_rol_index","setrole"
"pg_db_role_setting","pg_db_role_setting_databaseid_rol_index","setdatabase"
"pg_default_acl","pg_default_acl_oid_index","oid"
"pg_default_acl","pg_default_acl_role_nsp_obj_index","defaclrole"
"pg_default_acl","pg_default_acl_role_nsp_obj_index","defaclnamespace"
"pg_default_acl","pg_default_acl_role_nsp_obj_index","defaclobjtype"
"pg_depend","pg_depend_depender_index","classid"
"pg_depend","pg_depend_depender_index","objsubid"
"pg_depend","pg_depend_depender_index","objid"
"pg_depend","pg_depend_reference_index","refclassid"
"pg_depend","pg_depend_reference_index","refobjid"
"pg_depend","pg_depend_reference_index","refobjsubid"
"pg_description","pg_description_o_c_o_index","objsubid"
"pg_description","pg_description_o_c_o_index","classoid"
"pg_description","pg_description_o_c_o_index","objoid"
"pg_enum","pg_enum_oid_index","oid"
"pg_enum","pg_enum_typid_label_index","enumtypid"
"pg_enum","pg_enum_typid_label_index","enumlabel"
"pg_enum","pg_enum_typid_sortorder_index","enumtypid"
"pg_enum","pg_enum_typid_sortorder_index","enumsortorder"
"pg_event_trigger","pg_event_trigger_evtname_index","evtname"
"pg_event_trigger","pg_event_trigger_oid_index","oid"
"pg_extension","pg_extension_name_index","extname"
"pg_extension","pg_extension_oid_index","oid"
"pg_foreign_data_wrapper","pg_foreign_data_wrapper_name_index","fdwname"
"pg_foreign_data_wrapper","pg_foreign_data_wrapper_oid_index","oid"
"pg_foreign_server","pg_foreign_server_name_index","srvname"
"pg_foreign_server","pg_foreign_server_oid_index","oid"
"pg_foreign_table","pg_foreign_table_relid_index","ftrelid"
"pg_index","pg_index_indexrelid_index","indexrelid"
"pg_index","pg_index_indrelid_index","indrelid"
"pg_inherits","pg_inherits_parent_index","inhparent"
"pg_inherits","pg_inherits_relid_seqno_index","inhrelid"
"pg_inherits","pg_inherits_relid_seqno_index","inhseqno"
"pg_language","pg_language_name_index","lanname"
"pg_language","pg_language_oid_index","oid"
"pg_largeobject","pg_largeobject_loid_pn_index","pageno"
"pg_largeobject","pg_largeobject_loid_pn_index","loid"
"pg_largeobject_metadata","pg_largeobject_metadata_oid_index","oid"
"pg_namespace","pg_namespace_nspname_index","nspname"
"pg_namespace","pg_namespace_oid_index","oid"
"pg_opclass","pg_opclass_am_name_nsp_index","opcname"
"pg_opclass","pg_opclass_am_name_nsp_index","opcmethod"
"pg_opclass","pg_opclass_am_name_nsp_index","opcnamespace"
"pg_opclass","pg_opclass_oid_index","oid"
"pg_operator","pg_operator_oid_index","oid"
"pg_operator","pg_operator_oprname_l_r_n_index","oprnamespace"
"pg_operator","pg_operator_oprname_l_r_n_index","oprleft"
"pg_operator","pg_operator_oprname_l_r_n_index","oprright"
"pg_operator","pg_operator_oprname_l_r_n_index","oprname"
"pg_opfamily","pg_opfamily_am_name_nsp_index","opfnamespace"
"pg_opfamily","pg_opfamily_am_name_nsp_index","opfname"
"pg_opfamily","pg_opfamily_am_name_nsp_index","opfmethod"
"pg_opfamily","pg_opfamily_oid_index","oid"
"pg_pltemplate","pg_pltemplate_name_index","tmplname"
"pg_proc","pg_proc_oid_index","oid"
"pg_proc","pg_proc_proname_args_nsp_index","proargtypes"
"pg_proc","pg_proc_proname_args_nsp_index","pronamespace"
"pg_proc","pg_proc_proname_args_nsp_index","proname"
"pg_range","pg_range_rngtypid_index","rngtypid"
"pg_rewrite","pg_rewrite_oid_index","oid"
"pg_rewrite","pg_rewrite_rel_rulename_index","ev_class"
"pg_rewrite","pg_rewrite_rel_rulename_index","rulename"
"pg_seclabel","pg_seclabel_object_index","objoid"
"pg_seclabel","pg_seclabel_object_index","classoid"
"pg_seclabel","pg_seclabel_object_index","objsubid"
"pg_seclabel","pg_seclabel_object_index","provider"
"pg_shdepend","pg_shdepend_depender_index","classid"
"pg_shdepend","pg_shdepend_depender_index","dbid"
"pg_shdepend","pg_shdepend_depender_index","objid"
"pg_shdepend","pg_shdepend_depender_index","objsubid"
"pg_shdepend","pg_shdepend_reference_index","refobjid"
"pg_shdepend","pg_shdepend_reference_index","refclassid"
"pg_shdescription","pg_shdescription_o_c_index","classoid"
"pg_shdescription","pg_shdescription_o_c_index","objoid"
"pg_shseclabel","pg_shseclabel_object_index","classoid"
"pg_shseclabel","pg_shseclabel_object_index","provider"
"pg_shseclabel","pg_shseclabel_object_index","objoid"
"pg_statistic","pg_statistic_relid_att_inh_index","starelid"
"pg_statistic","pg_statistic_relid_att_inh_index","stainherit"
"pg_statistic","pg_statistic_relid_att_inh_index","staattnum"
"pg_tablespace","pg_tablespace_oid_index","oid"
"pg_tablespace","pg_tablespace_spcname_index","spcname"
"pg_trigger","pg_trigger_oid_index","oid"
"pg_trigger","pg_trigger_tgconstraint_index","tgconstraint"
"pg_trigger","pg_trigger_tgrelid_tgname_index","tgname"
"pg_trigger","pg_trigger_tgrelid_tgname_index","tgrelid"
"pg_ts_config","pg_ts_config_cfgname_index","cfgnamespace"
"pg_ts_config","pg_ts_config_cfgname_index","cfgname"
"pg_ts_config","pg_ts_config_oid_index","oid"
"pg_ts_config_map","pg_ts_config_map_index","maptokentype"
"pg_ts_config_map","pg_ts_config_map_index","mapcfg"
"pg_ts_config_map","pg_ts_config_map_index","mapseqno"
"pg_ts_dict","pg_ts_dict_dictname_index","dictnamespace"
"pg_ts_dict","pg_ts_dict_dictname_index","dictname"
"pg_ts_dict","pg_ts_dict_oid_index","oid"
"pg_ts_parser","pg_ts_parser_oid_index","oid"
"pg_ts_parser","pg_ts_parser_prsname_index","prsnamespace"
"pg_ts_parser","pg_ts_parser_prsname_index","prsname"
"pg_ts_template","pg_ts_template_oid_index","oid"
"pg_ts_template","pg_ts_template_tmplname_index","tmplname"
"pg_ts_template","pg_ts_template_tmplname_index","tmplnamespace"
"pg_type","pg_type_oid_index","oid"
"pg_type","pg_type_typname_nsp_index","typnamespace"
"pg_type","pg_type_typname_nsp_index","typname"
"pg_user_mapping","pg_user_mapping_oid_index","oid"
"pg_user_mapping","pg_user_mapping_user_server_index","umserver"
"pg_user_mapping","pg_user_mapping_user_server_index","umuser"
"pipe","fki_pipe_fk_bedding","fk_bedding"
"pipe","fki_pipe_fk_distributor","fk_distributor"
"pipe","fki_pipe_fk_district","fk_district"
"pipe","fki_pipe_fk_folder","fk_folder"
"pipe","fki_pipe_fk_function","fk_function"
"pipe","fki_pipe_fk_installmethod","fk_installmethod"
"pipe","fki_pipe_fk_material","fk_material"
"pipe","fki_pipe_fk_node_a","fk_node_a"
"pipe","fki_pipe_fk_node_b","fk_node_b"
"pipe","fki_pipe_fk_parent","fk_parent"
"pipe","fki_pipe_fk_precision","fk_precision"
"pipe","fki_pipe_fk_pressurezone","fk_pressurezone"
"pipe","fki_pipe_fk_protection","fk_protection"
"pipe","fki_pipe_fk_status","fk_status"
"pipe","fki_pipe_fk_watertype","fk_watertype"
"pipe","fki_pipe_label_1_visible","label_1_visible"
"pipe","fki_pipe_label_2_visible","label_2_visible"
"pipe","fki_pipe_schema_force_visible","schema_force_visible"
"pipe","pipe_geoidx","geometry"
"pipe","pipe_geoidx_alt1","geometry_alt1"
"pipe","pipe_geoidx_alt2","geometry_alt2"
"pipe","pipe_pkey","id"
"pipe_function","vl_pipe_function_pk","id"
"pipe_installmethod","vl_pipe_installmethod_pk","id"
"pipe_material","vl_pipe_material_pk","id"
"pipe_protection","vl_pipe_protection_pk","id"
"precision","vl_precision_pk","id"
"precisionalti","vl_precisionalti_pk","id"
"pressurecontrol","fki_pressurecontrol_type","fk_pressurecontrol_type"
"pressurecontrol","pressurecontrol_pkey","id"
"pressurecontrol_type","vl_pressurecontrol_type_pk","id"
"pressurezone","fki_pressurezone_fk_consumptionzone","fk_consumptionzone"
"pressurezone","fki_pressurezone_fk_distributor","fk_distributor"
"pressurezone","fki_pressurezone_label_1_visible","label_1_visible"
"pressurezone","fki_pressurezone_label_2_visible","label_2_visible"
"pressurezone","pressurezone_geoidx","geometry"
"pressurezone","pressurezone_geoidx_alt1","geometry_alt1"
"pressurezone","pressurezone_geoidx_alt2","geometry_alt2"
"pressurezone","pressurezone_name","name"
"pressurezone","pressurezone_pkey","id"
"printmap","fki_printmap_fk_district","id"
"printmap","fki_printmap_label_1_visible","label_1_visible"
"printmap","fki_printmap_label_2_visible","label_2_visible"
"printmap","printmap_geoidx","geometry"
"printmap","printmap_pkey","id"
"protectionzone","fki_protectionzone_fk_type","fk_type"
"protectionzone","protectionzone_geoidx","geometry"
"protectionzone","protectionzone_name","name"
"protectionzone","protectionzone_pk","id"
"protectionzone_type","vl_protectionzone_type_pk","id"
"pump","fki_pump_operating","fk_pump_operating"
"pump","fki_pump_pipe_in","fk_pipe_in"
"pump","fki_pump_pipe_out","fk_pipe_out"
"pump","fki_pump_vl_pump_type","fk_pump_type"
"pump","pump_pkey","id"
"pump_operating","vl_pump_operating_pk","id"
"pump_type","vl_pump_type_pk","id"
"remote","fki_remote_fk_distributor","fk_distributor"
"remote","fki_remote_fk_material","fk_material"
"remote","fki_remote_fk_precision","fk_precision"
"remote","fki_remote_fk_status","fk_status"
"remote","fki_remote_label_1_visible","label_1_visible"
"remote","fki_remote_label_2_visible","label_2_visible"
"remote","remote_geoidx","geometry"
"remote","remote_geoidx_alt1","geometry_alt1"
"remote","remote_geoidx_alt2","geometry_alt2"
"remote","remote_pkey","id"
"remote_type","vl_remote_type_pk","id"
"samplingpoint","samplingpoint_pkey","id"
"settings","setting_unique","name"
"settings","settings_pkey","id"
"source","fki_source_source_quality","fk_source_quality"
"source","fki_source_source_type","fk_source_type"
"source","source_pkey","id"
"source_quality","vl_source_quality_pk","id"
"source_type","vl_source_type_pk","id"
"spatial_ref_sys","spatial_ref_sys_pkey","srid"
"status","vl_status_pk","id"
"subscriber","fki_subscriber_fk_pipe","fk_pipe"
"subscriber","fki_subscriber_fk_type","fk_subscriber_type"
"subscriber","subscriber_pkey","id"
"subscriber_reference","fki_subscriber_reference_fk_subscriber","fk_subscriber"
"subscriber_reference","subscriber_reference_geoidx_sch","geometry"
"subscriber_reference","subscriber_reference_pkey","id"
"subscriber_type","vl_subscriber_type_pk","id"
"survey_type","vl_survey_type_pk","id"
"surveypoint","fki_surveypoint_fk_folder","fk_folder"
"surveypoint","fki_surveypoint_fk_type","fk_survey_type"
"surveypoint","fki_surveypoint_fk_worker","fk_worker"
"surveypoint","surveypoint_pkey","id"
"tank","fki_tank_cistern1type","cistern1_fk_type"
"tank","fki_tank_cistern2type","cistern2_fk_type"
"tank","fki_tank_fk_overflow","fk_overflow"
"tank","fki_tank_fk_tank_firestorage","fk_tank_firestorage"
"tank","tank_pkey","id"
"tank_firestorage","vl_tank_firestorage_pk","id"
"treatment","treatment_pkey","id"
"value_list_base","value_list_base_pk","id"
"valve","fki_valve_fk_function","fk_valve_function"
"valve","fki_valve_fk_handle_precision","fk_handle_precision"
"valve","fki_valve_fk_handle_precisionalti","fk_handle_precisionalti"
"valve","fki_valve_fk_pipe","fk_pipe"
"valve","fki_valve_fk_type","fk_valve_type"
"valve","fki_valve_fk_valve_actuation","fk_valve_actuation"
"valve","valve_pkey","id"
"valve_actuation","vl_valve_actuation_pk","id"
"valve_function","vl_valve_function_pk","id"
"valve_maintenance","vlvalve_maintenance_pk","id"
"valve_type","vl_valve_type_pk","id"
"versions","module_unique","module"
"versions","versions_pkey","id"
"visible","visible_code","vl_code"
"visible","visible_code_int","vl_code_int"
"visible","vl_visible_pk","id"
"watertype","vl_watertype_pk","id"
"worker","worker_pkey","id"
"worker_type","vl_worker_type_pk","id"
"tr_setting_create_fn_get_insert"
"tr_setting_create_fn_get_update"
"tr_fancy_value"
"RI_ConstraintTrigger_a_554472"
"RI_ConstraintTrigger_a_554473"
"RI_ConstraintTrigger_c_554474"
"RI_ConstraintTrigger_c_554475"
"tr_dimension_distance"
"RI_ConstraintTrigger_a_554580"
"RI_ConstraintTrigger_a_554581"
"RI_ConstraintTrigger_c_554582"
"RI_ConstraintTrigger_c_554583"
"RI_ConstraintTrigger_a_554585"
"RI_ConstraintTrigger_a_554586"
"RI_ConstraintTrigger_c_554587"
"RI_ConstraintTrigger_c_554588"
"RI_ConstraintTrigger_a_554594"
"RI_ConstraintTrigger_a_554595"
"RI_ConstraintTrigger_c_554596"
"RI_ConstraintTrigger_c_554597"
"RI_ConstraintTrigger_a_554600"
"RI_ConstraintTrigger_a_554601"
"RI_ConstraintTrigger_c_554602"
"RI_ConstraintTrigger_c_554603"
"tr_pressurezone_altgeom_insert"
"tr_pressurezone_altgeom_update"
"tr_pressurezone_altgeom_alt"
"RI_ConstraintTrigger_a_554644"
"RI_ConstraintTrigger_a_554645"
"RI_ConstraintTrigger_c_554646"
"RI_ConstraintTrigger_c_554647"
"RI_ConstraintTrigger_a_554649"
"RI_ConstraintTrigger_a_554650"
"RI_ConstraintTrigger_c_554651"
"RI_ConstraintTrigger_c_554652"
"RI_ConstraintTrigger_a_554703"
"RI_ConstraintTrigger_a_554704"
"RI_ConstraintTrigger_c_554705"
"RI_ConstraintTrigger_c_554706"
"RI_ConstraintTrigger_a_554708"
"RI_ConstraintTrigger_a_554709"
"RI_ConstraintTrigger_c_554710"
"RI_ConstraintTrigger_c_554711"
"RI_ConstraintTrigger_a_554715"
"RI_ConstraintTrigger_a_554716"
"RI_ConstraintTrigger_c_554717"
"RI_ConstraintTrigger_c_554718"
"RI_ConstraintTrigger_a_554740"
"RI_ConstraintTrigger_a_554741"
"RI_ConstraintTrigger_c_554742"
"RI_ConstraintTrigger_c_554743"
"RI_ConstraintTrigger_a_554796"
"RI_ConstraintTrigger_a_554797"
"RI_ConstraintTrigger_c_554798"
"RI_ConstraintTrigger_c_554799"
"RI_ConstraintTrigger_a_554802"
"RI_ConstraintTrigger_a_554803"
"RI_ConstraintTrigger_c_554804"
"RI_ConstraintTrigger_c_554805"
"tr_node_geom_insert"
"tr_node_geom_update"
"tr_node_add_pipe_vertex_update"
"tr_pipe_node_moved"
"tr_node_altgeom_insert"
"tr_node_altgeom_update"
"tr_node_altgeom_alt"
"RI_ConstraintTrigger_a_554824"
"RI_ConstraintTrigger_a_554825"
"RI_ConstraintTrigger_c_554826"
"RI_ConstraintTrigger_c_554827"
"RI_ConstraintTrigger_a_554842"
"RI_ConstraintTrigger_a_554843"
"RI_ConstraintTrigger_c_554844"
"RI_ConstraintTrigger_c_554845"
"RI_ConstraintTrigger_a_554866"
"RI_ConstraintTrigger_a_554867"
"RI_ConstraintTrigger_c_554868"
"RI_ConstraintTrigger_c_554869"
"RI_ConstraintTrigger_a_554871"
"RI_ConstraintTrigger_a_554872"
"RI_ConstraintTrigger_c_554873"
"RI_ConstraintTrigger_c_554874"
"RI_ConstraintTrigger_a_554878"
"RI_ConstraintTrigger_a_554879"
"RI_ConstraintTrigger_c_554880"
"RI_ConstraintTrigger_c_554881"
"RI_ConstraintTrigger_a_554884"
"RI_ConstraintTrigger_a_554885"
"RI_ConstraintTrigger_c_554886"
"RI_ConstraintTrigger_c_554887"
"RI_ConstraintTrigger_a_554890"
"RI_ConstraintTrigger_a_554891"
"RI_ConstraintTrigger_c_554892"
"RI_ConstraintTrigger_c_554893"
"RI_ConstraintTrigger_a_554896"
"RI_ConstraintTrigger_a_554897"
"RI_ConstraintTrigger_c_554898"
"RI_ConstraintTrigger_c_554899"
"RI_ConstraintTrigger_a_554902"
"RI_ConstraintTrigger_a_554903"
"RI_ConstraintTrigger_c_554904"
"RI_ConstraintTrigger_c_554905"
"RI_ConstraintTrigger_a_554908"
"RI_ConstraintTrigger_a_554909"
"RI_ConstraintTrigger_c_554910"
"RI_ConstraintTrigger_c_554911"
"RI_ConstraintTrigger_a_554927"
"RI_ConstraintTrigger_a_554928"
"RI_ConstraintTrigger_c_554929"
"RI_ConstraintTrigger_c_554930"
"RI_ConstraintTrigger_a_554942"
"RI_ConstraintTrigger_a_554943"
"RI_ConstraintTrigger_c_554944"
"RI_ConstraintTrigger_c_554945"
"RI_ConstraintTrigger_a_554948"
"RI_ConstraintTrigger_a_554949"
"RI_ConstraintTrigger_c_554950"
"RI_ConstraintTrigger_c_554951"
"RI_ConstraintTrigger_a_554954"
"RI_ConstraintTrigger_a_554955"
"RI_ConstraintTrigger_c_554956"
"RI_ConstraintTrigger_c_554957"
"RI_ConstraintTrigger_a_554960"
"RI_ConstraintTrigger_a_554961"
"RI_ConstraintTrigger_c_554962"
"RI_ConstraintTrigger_c_554963"
"RI_ConstraintTrigger_a_554966"
"RI_ConstraintTrigger_a_554967"
"RI_ConstraintTrigger_c_554968"
"RI_ConstraintTrigger_c_554969"
"RI_ConstraintTrigger_a_555002"
"RI_ConstraintTrigger_a_555003"
"RI_ConstraintTrigger_c_555004"
"RI_ConstraintTrigger_c_555005"
"RI_ConstraintTrigger_a_555026"
"RI_ConstraintTrigger_a_555027"
"RI_ConstraintTrigger_c_555028"
"RI_ConstraintTrigger_c_555029"
"RI_ConstraintTrigger_a_555031"
"RI_ConstraintTrigger_a_555032"
"RI_ConstraintTrigger_c_555033"
"RI_ConstraintTrigger_c_555034"
"RI_ConstraintTrigger_a_555038"
"RI_ConstraintTrigger_a_555039"
"RI_ConstraintTrigger_c_555040"
"RI_ConstraintTrigger_c_555041"
"RI_ConstraintTrigger_a_555044"
"RI_ConstraintTrigger_a_555045"
"RI_ConstraintTrigger_c_555046"
"RI_ConstraintTrigger_c_555047"
"RI_ConstraintTrigger_a_555050"
"RI_ConstraintTrigger_a_555051"
"RI_ConstraintTrigger_c_555052"
"RI_ConstraintTrigger_c_555053"
"RI_ConstraintTrigger_a_555056"
"RI_ConstraintTrigger_a_555057"
"RI_ConstraintTrigger_c_555058"
"RI_ConstraintTrigger_c_555059"
"RI_ConstraintTrigger_a_555062"
"RI_ConstraintTrigger_a_555063"
"RI_ConstraintTrigger_c_555064"
"RI_ConstraintTrigger_c_555065"
"RI_ConstraintTrigger_a_555068"
"RI_ConstraintTrigger_a_555069"
"RI_ConstraintTrigger_c_555070"
"RI_ConstraintTrigger_c_555071"
"RI_ConstraintTrigger_a_555074"
"RI_ConstraintTrigger_a_555075"
"RI_ConstraintTrigger_c_555076"
"RI_ConstraintTrigger_c_555077"
"RI_ConstraintTrigger_a_555080"
"RI_ConstraintTrigger_a_555081"
"RI_ConstraintTrigger_c_555082"
"RI_ConstraintTrigger_c_555083"
"RI_ConstraintTrigger_a_555086"
"RI_ConstraintTrigger_a_555087"
"RI_ConstraintTrigger_c_555088"
"RI_ConstraintTrigger_c_555089"
"RI_ConstraintTrigger_a_555092"
"RI_ConstraintTrigger_a_555093"
"RI_ConstraintTrigger_c_555094"
"RI_ConstraintTrigger_c_555095"
"RI_ConstraintTrigger_a_555098"
"RI_ConstraintTrigger_a_555099"
"RI_ConstraintTrigger_c_555100"
"RI_ConstraintTrigger_c_555101"
"tr_pipe_tunnelbridge"
"RI_ConstraintTrigger_a_555109"
"RI_ConstraintTrigger_a_555110"
"RI_ConstraintTrigger_c_555111"
"RI_ConstraintTrigger_c_555112"
"RI_ConstraintTrigger_a_555114"
"RI_ConstraintTrigger_a_555115"
"RI_ConstraintTrigger_c_555116"
"RI_ConstraintTrigger_c_555117"
"RI_ConstraintTrigger_a_555119"
"RI_ConstraintTrigger_a_555120"
"RI_ConstraintTrigger_c_555121"
"RI_ConstraintTrigger_c_555122"
"RI_ConstraintTrigger_a_555124"
"RI_ConstraintTrigger_a_555125"
"RI_ConstraintTrigger_c_555126"
"RI_ConstraintTrigger_c_555127"
"tr_pipe_geom_insert"
"tr_pipe_geom_update"
"tr_pipe_node_type_insdel"
"tr_pipe_node_type_update"
"tr_pipe_altgeom_insert"
"tr_pipe_altgeom_update"
"tr_pipe_altgeom_alt"
"RI_ConstraintTrigger_a_555153"
"RI_ConstraintTrigger_a_555154"
"RI_ConstraintTrigger_c_555155"
"RI_ConstraintTrigger_c_555156"
"RI_ConstraintTrigger_a_555158"
"RI_ConstraintTrigger_a_555159"
"RI_ConstraintTrigger_c_555160"
"RI_ConstraintTrigger_c_555161"
"tr_controled_crossing"
"RI_ConstraintTrigger_a_555177"
"RI_ConstraintTrigger_a_555178"
"RI_ConstraintTrigger_c_555179"
"RI_ConstraintTrigger_c_555180"
"RI_ConstraintTrigger_a_555182"
"RI_ConstraintTrigger_a_555183"
"RI_ConstraintTrigger_c_555184"
"RI_ConstraintTrigger_c_555185"
"RI_ConstraintTrigger_a_555188"
"RI_ConstraintTrigger_a_555189"
"RI_ConstraintTrigger_c_555190"
"RI_ConstraintTrigger_c_555191"
"RI_ConstraintTrigger_a_555199"
"RI_ConstraintTrigger_a_555200"
"RI_ConstraintTrigger_c_555201"
"RI_ConstraintTrigger_c_555202"
"RI_ConstraintTrigger_a_555223"
"RI_ConstraintTrigger_a_555224"
"RI_ConstraintTrigger_c_555225"
"RI_ConstraintTrigger_c_555226"
"RI_ConstraintTrigger_a_555229"
"RI_ConstraintTrigger_a_555230"
"RI_ConstraintTrigger_c_555231"
"RI_ConstraintTrigger_c_555232"
"RI_ConstraintTrigger_a_555235"
"RI_ConstraintTrigger_a_555236"
"RI_ConstraintTrigger_c_555237"
"RI_ConstraintTrigger_c_555238"
"RI_ConstraintTrigger_a_555241"
"RI_ConstraintTrigger_a_555242"
"RI_ConstraintTrigger_c_555243"
"RI_ConstraintTrigger_c_555244"
"RI_ConstraintTrigger_a_555247"
"RI_ConstraintTrigger_a_555248"
"RI_ConstraintTrigger_c_555249"
"RI_ConstraintTrigger_c_555250"
"RI_ConstraintTrigger_a_555253"
"RI_ConstraintTrigger_a_555254"
"RI_ConstraintTrigger_c_555255"
"RI_ConstraintTrigger_c_555256"
"valve_node_set_type"
"valve_handle_altitude_update_trigger"
"valve_handle_altitude_insert_trigger"
"RI_ConstraintTrigger_a_555269"
"RI_ConstraintTrigger_a_555270"
"RI_ConstraintTrigger_c_555271"
"RI_ConstraintTrigger_c_555272"
"RI_ConstraintTrigger_a_555274"
"RI_ConstraintTrigger_a_555275"
"RI_ConstraintTrigger_c_555276"
"RI_ConstraintTrigger_c_555277"
"RI_ConstraintTrigger_a_555292"
"RI_ConstraintTrigger_a_555293"
"RI_ConstraintTrigger_c_555294"
"RI_ConstraintTrigger_c_555295"
"RI_ConstraintTrigger_a_555303"
"RI_ConstraintTrigger_a_555304"
"RI_ConstraintTrigger_c_555305"
"RI_ConstraintTrigger_c_555306"
"RI_ConstraintTrigger_a_555308"
"RI_ConstraintTrigger_a_555309"
"RI_ConstraintTrigger_c_555310"
"RI_ConstraintTrigger_c_555311"
"RI_ConstraintTrigger_a_555314"
"RI_ConstraintTrigger_a_555315"
"RI_ConstraintTrigger_c_555316"
"RI_ConstraintTrigger_c_555317"
"RI_ConstraintTrigger_a_555332"
"RI_ConstraintTrigger_a_555333"
"RI_ConstraintTrigger_c_555334"
"RI_ConstraintTrigger_c_555335"
"RI_ConstraintTrigger_a_555343"
"RI_ConstraintTrigger_a_555344"
"RI_ConstraintTrigger_c_555345"
"RI_ConstraintTrigger_c_555346"
"RI_ConstraintTrigger_a_555357"
"RI_ConstraintTrigger_a_555358"
"RI_ConstraintTrigger_c_555359"
"RI_ConstraintTrigger_c_555360"
"RI_ConstraintTrigger_a_555363"
"RI_ConstraintTrigger_a_555364"
"RI_ConstraintTrigger_c_555365"
"RI_ConstraintTrigger_c_555366"
"RI_ConstraintTrigger_a_555369"
"RI_ConstraintTrigger_a_555370"
"RI_ConstraintTrigger_c_555371"
"RI_ConstraintTrigger_c_555372"
"RI_ConstraintTrigger_a_555412"
"RI_ConstraintTrigger_a_555413"
"RI_ConstraintTrigger_c_555414"
"RI_ConstraintTrigger_c_555415"
"RI_ConstraintTrigger_a_555417"
"RI_ConstraintTrigger_a_555418"
"RI_ConstraintTrigger_c_555419"
"RI_ConstraintTrigger_c_555420"
"RI_ConstraintTrigger_a_555424"
"RI_ConstraintTrigger_a_555425"
"RI_ConstraintTrigger_c_555426"
"RI_ConstraintTrigger_c_555427"
"RI_ConstraintTrigger_a_555430"
"RI_ConstraintTrigger_a_555431"
"RI_ConstraintTrigger_c_555432"
"RI_ConstraintTrigger_c_555433"
"cover_altitude_update_trigger"
"cover_altitude_insert_trigger"
"RI_ConstraintTrigger_a_555443"
"RI_ConstraintTrigger_a_555444"
"RI_ConstraintTrigger_c_555445"
"RI_ConstraintTrigger_c_555446"
"RI_ConstraintTrigger_a_555453"
"RI_ConstraintTrigger_a_555454"
"RI_ConstraintTrigger_c_555455"
"RI_ConstraintTrigger_c_555456"
"RI_ConstraintTrigger_a_555458"
"RI_ConstraintTrigger_a_555459"
"RI_ConstraintTrigger_c_555460"
"RI_ConstraintTrigger_c_555461"
"RI_ConstraintTrigger_a_555469"
"RI_ConstraintTrigger_a_555470"
"RI_ConstraintTrigger_c_555471"
"RI_ConstraintTrigger_c_555472"
"RI_ConstraintTrigger_a_555474"
"RI_ConstraintTrigger_a_555475"
"RI_ConstraintTrigger_c_555476"
"RI_ConstraintTrigger_c_555477"
"RI_ConstraintTrigger_a_555480"
"RI_ConstraintTrigger_a_555481"
"RI_ConstraintTrigger_c_555482"
"RI_ConstraintTrigger_c_555483"
"RI_ConstraintTrigger_a_555486"
"RI_ConstraintTrigger_a_555487"
"RI_ConstraintTrigger_c_555488"
"RI_ConstraintTrigger_c_555489"
"RI_ConstraintTrigger_a_555492"
"RI_ConstraintTrigger_a_555493"
"RI_ConstraintTrigger_c_555494"
"RI_ConstraintTrigger_c_555495"
"RI_ConstraintTrigger_a_555503"
"RI_ConstraintTrigger_a_555504"
"RI_ConstraintTrigger_c_555505"
"RI_ConstraintTrigger_c_555506"
"RI_ConstraintTrigger_a_555508"
"RI_ConstraintTrigger_a_555509"
"RI_ConstraintTrigger_c_555510"
"RI_ConstraintTrigger_c_555511"
"RI_ConstraintTrigger_a_555514"
"RI_ConstraintTrigger_a_555515"
"RI_ConstraintTrigger_c_555516"
"RI_ConstraintTrigger_c_555517"
"RI_ConstraintTrigger_a_555525"
"RI_ConstraintTrigger_a_555526"
"RI_ConstraintTrigger_c_555527"
"RI_ConstraintTrigger_c_555528"
"RI_ConstraintTrigger_a_555530"
"RI_ConstraintTrigger_a_555531"
"RI_ConstraintTrigger_c_555532"
"RI_ConstraintTrigger_c_555533"
"RI_ConstraintTrigger_a_555536"
"RI_ConstraintTrigger_a_555537"
"RI_ConstraintTrigger_c_555538"
"RI_ConstraintTrigger_c_555539"
"RI_ConstraintTrigger_a_555542"
"RI_ConstraintTrigger_a_555543"
"RI_ConstraintTrigger_c_555544"
"RI_ConstraintTrigger_c_555545"
"RI_ConstraintTrigger_a_555548"
"RI_ConstraintTrigger_a_555549"
"RI_ConstraintTrigger_c_555550"
"RI_ConstraintTrigger_c_555551"
"tr_tank"
"RI_ConstraintTrigger_a_555562"
"RI_ConstraintTrigger_a_555563"
"RI_ConstraintTrigger_c_555564"
"RI_ConstraintTrigger_c_555565"
"RI_ConstraintTrigger_a_555604"
"RI_ConstraintTrigger_a_555605"
"RI_ConstraintTrigger_c_555606"
"RI_ConstraintTrigger_c_555607"
"RI_ConstraintTrigger_a_555609"
"RI_ConstraintTrigger_a_555610"
"RI_ConstraintTrigger_c_555611"
"RI_ConstraintTrigger_c_555612"
"RI_ConstraintTrigger_a_555616"
"RI_ConstraintTrigger_a_555617"
"RI_ConstraintTrigger_c_555618"
"RI_ConstraintTrigger_c_555619"
"RI_ConstraintTrigger_a_555622"
"RI_ConstraintTrigger_a_555623"
"RI_ConstraintTrigger_c_555624"
"RI_ConstraintTrigger_c_555625"
"RI_ConstraintTrigger_a_555628"
"RI_ConstraintTrigger_a_555629"
"RI_ConstraintTrigger_c_555630"
"RI_ConstraintTrigger_c_555631"
"RI_ConstraintTrigger_a_555634"
"RI_ConstraintTrigger_a_555635"
"RI_ConstraintTrigger_c_555636"
"RI_ConstraintTrigger_c_555637"
"tr_remote_altgeom_insert"
"tr_remote_altgeom_update"
"tr_remote_altgeom_alt"
"RI_ConstraintTrigger_a_555648"
"RI_ConstraintTrigger_a_555649"
"RI_ConstraintTrigger_c_555650"
"RI_ConstraintTrigger_c_555651"
"RI_ConstraintTrigger_a_555658"
"RI_ConstraintTrigger_a_555659"
"RI_ConstraintTrigger_c_555660"
"RI_ConstraintTrigger_c_555661"
"RI_ConstraintTrigger_a_555674"
"RI_ConstraintTrigger_a_555675"
"RI_ConstraintTrigger_c_555676"
"RI_ConstraintTrigger_c_555677"
"RI_ConstraintTrigger_a_555680"
"RI_ConstraintTrigger_a_555681"
"RI_ConstraintTrigger_c_555682"
"RI_ConstraintTrigger_c_555683"
"RI_ConstraintTrigger_a_555686"
"RI_ConstraintTrigger_a_555687"
"RI_ConstraintTrigger_c_555688"
"RI_ConstraintTrigger_c_555689"
"surveypoint_altitude_update_trigger"
"surveypoint_altitude_insert_trigger"
"RI_ConstraintTrigger_a_555721"
"RI_ConstraintTrigger_a_555722"
"RI_ConstraintTrigger_c_555723"
"RI_ConstraintTrigger_c_555724"
"RI_ConstraintTrigger_a_555726"
"RI_ConstraintTrigger_a_555727"
"RI_ConstraintTrigger_c_555728"
"RI_ConstraintTrigger_c_555729"
"RI_ConstraintTrigger_a_555733"
"RI_ConstraintTrigger_a_555734"
"RI_ConstraintTrigger_c_555735"
"RI_ConstraintTrigger_c_555736"
"RI_ConstraintTrigger_a_555739"
"RI_ConstraintTrigger_a_555740"
"RI_ConstraintTrigger_c_555741"
"RI_ConstraintTrigger_c_555742"
"tr_leak_repaired"
"tr_leak_pipe"
"tr_valve_pipe_update"
"tr_valve_pipe_delete"
"tr_valve_update_trigger"
"tr_installation_source_insert"
"tr_installation_source_update"
"tr_installation_source_delete"
"tr_installation_pump_insert"
"tr_installation_pump_update"
"tr_installation_pump_delete"
"tr_installation_tank_insert"
"tr_installation_tank_update"
"tr_installation_tank_delete"
"tr_installation_treatment_insert"
"tr_installation_treatment_update"
"tr_installation_treatment_delete"
"tr_installation_chamber_insert"
"tr_installation_chamber_update"
"tr_installation_chamber_delete"
"tr_installation_pressurecontrol_insert"
"tr_installation_pressurecontrol_update"
"tr_installation_pressurecontrol_delete"
"tr_vw_qwat_installation_insert"
"tr_vw_qwat_installation_update"
"tr_vw_qwat_installation_delete"
"tr_node_element_insert"
"tr_node_element_update"
"tr_node_element_delete"
"tr_vw_qwat_node_insert"
"tr_vw_qwat_node_update"
"tr_vw_qwat_node_delete"
"tr_element_subscriber_insert"
"tr_element_subscriber_update"
"tr_element_subscriber_delete"
"tr_element_part_insert"
"tr_element_part_update"
"tr_element_part_delete"
"tr_element_installation_insert"
"tr_element_installation_update"
"tr_element_installation_delete"
"tr_element_hydrant_insert"
"tr_element_hydrant_update"
"tr_element_hydrant_delete"
"tr_element_samplingpoint_insert"
"tr_element_samplingpoint_update"
"tr_element_samplingpoint_delete"
"tr_element_valve_insert"
"tr_element_valve_update"
"tr_element_valve_delete"
"tr_element_meter_insert"
"tr_element_meter_update"
"tr_element_meter_delete"
"tr_vw_qwat_network_element_insert"
"tr_vw_qwat_network_element_update"
"tr_vw_qwat_network_element_delete"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"audit_trigger_row"
"audit_trigger_stm"
"tr_node_add_pipe_vertex_insert"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"
	BEGIN
		NEW._geometry_alt1_used := NEW.geometry_alt1 IS NOT NULL AND ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := NEW.geometry_alt2 IS NOT NULL AND ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"
	BEGIN
		INSERT INTO qwat_od.vw_node_element (
			id
			, fk_district
			, fk_pressurezone
			, fk_printmap
			, _printmaps
			, _geometry_alt1_used
			, _geometry_alt2_used
			, _pipe_node_type
			, _pipe_orientation
			, _pipe_schema_visible
			, geometry
			, geometry_alt1
			, geometry_alt2
			, update_geometry_alt1
			, update_geometry_alt2
			, identification
			, fk_distributor
			, fk_status
			, fk_folder
			, fk_locationtype
			, fk_precision
			, fk_precisionalti
			, fk_object_reference
			, altitude
			, year
			, year_end
			, orientation
			, remark
			, schema_force_visible
			, label_1_visible
			, label_1_x
			, label_1_y
			, label_1_rotation
			, label_1_text
			, label_2_visible
			, label_2_x
			, label_2_y
			, label_2_rotation
			, label_2_text
		) VALUES (
			NEW.id 
			, NEW.fk_district
			, NEW.fk_pressurezone
			, NEW.fk_printmap
			, NEW._printmaps
			, NEW._geometry_alt1_used
			, NEW._geometry_alt2_used
			, NEW._pipe_node_type
			, NEW._pipe_orientation
			, NEW._pipe_schema_visible
			, NEW.geometry
			, NEW.geometry_alt1
			, NEW.geometry_alt2
			, NEW.update_geometry_alt1
			, NEW.update_geometry_alt2
			, NEW.identification
			, NEW.fk_distributor
			, NEW.fk_status
			, NEW.fk_folder
			, NEW.fk_locationtype
			, NEW.fk_precision
			, NEW.fk_precisionalti
			, NEW.fk_object_reference
			, NEW.altitude
			, NEW.year
			, NEW.year_end
			, NEW.orientation
			, NEW.remark
			, NEW.schema_force_visible
			, NEW.label_1_visible
			, NEW.label_1_x
			, NEW.label_1_y
			, NEW.label_1_rotation
			, NEW.label_1_text
			, NEW.label_2_visible
			, NEW.label_2_x
			, NEW.label_2_y
			, NEW.label_2_rotation
			, NEW.label_2_text
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.part (
			id
			, fk_part_type
			, fk_pipe
		) VALUES (
			NEW.id 
			, NEW.fk_part_type
			, qwat_od.fn_pipe_get_id(NEW.geometry)
		);
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_upd"
"
	BEGIN
		DELETE FROM qwat_od.meter WHERE id = OLD.id;
		DELETE FROM qwat_od.vw_node_element WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"RI_FKey_noaction_upd"
"
	BEGIN
		DELETE FROM qwat_od.pump WHERE id = OLD.id;
		DELETE FROM qwat_od.installation WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		IF 	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 OR
			NEW.altitude IS NOT NULL AND ( ST_Z(NEW.geometry) IS NULL OR ST_Z(NEW.geometry) <> NEW.altitude ) THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
		END IF;
		RETURN NEW;
	END;
"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"
	BEGIN
	UPDATE qwat_od.installation SET
			name = NEW.name,
			fk_parent = NEW.fk_parent,
			fk_remote = NEW.fk_remote,
			fk_watertype = NEW.fk_watertype,
			parcel = NEW.parcel,
			eca = NEW.eca,
			open_water_surface = NEW.open_water_surface,
			geometry_polygon = NEW.geometry_polygon
		WHERE id = OLD.id;

	UPDATE qwat_od.pressurecontrol SET
			fk_pressurecontrol_type = NEW.fk_pressurecontrol_type
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"
	BEGIN
	UPDATE qwat_od.installation SET
			name = NEW.name,
			fk_parent = NEW.fk_parent,
			fk_remote = NEW.fk_remote,
			fk_watertype = NEW.fk_watertype,
			parcel = NEW.parcel,
			eca = NEW.eca,
			open_water_surface = NEW.open_water_surface,
			geometry_polygon = NEW.geometry_polygon
		WHERE id = OLD.id;

	UPDATE qwat_od.tank SET
			fk_overflow = NEW.fk_overflow,
			fk_tank_firestorage = NEW.fk_tank_firestorage,
			storage_total = NEW.storage_total,
			storage_supply = NEW.storage_supply,
			storage_fire = NEW.storage_fire,
			altitude_overflow = NEW.altitude_overflow,
			altitude_apron = NEW.altitude_apron,
			height_max = NEW.height_max,
			fire_valve = NEW.fire_valve,
			fire_remote = NEW.fire_remote,
			_litrepercm = NEW._litrepercm,
			cistern1_fk_type = NEW.cistern1_fk_type,
			cistern1_dimension_1 = NEW.cistern1_dimension_1,
			cistern1_dimension_2 = NEW.cistern1_dimension_2,
			cistern1_storage = NEW.cistern1_storage,
			_cistern1_litrepercm = NEW._cistern1_litrepercm,
			cistern2_fk_type = NEW.cistern2_fk_type,
			cistern2_dimension_1 = NEW.cistern2_dimension_1,
			cistern2_dimension_2 = NEW.cistern2_dimension_2,
			cistern2_storage = NEW.cistern2_storage,
			_cistern2_litrepercm = NEW._cistern2_litrepercm
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"
	DECLARE
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.handle_altitude IS NULL THEN
			NEW.handle_altitude := NULLIF( ST_Z(NEW.handle_geometry), 0.0); -- 0 is the NULL value
		END IF;
		IF 	NEW.handle_altitude IS NULL     AND ST_Z(NEW.handle_geometry) <> 0.0 OR
			NEW.handle_altitude IS NOT NULL AND ( ST_Z(NEW.handle_geometry) IS NULL OR ST_Z(NEW.handle_geometry) <> NEW.handle_altitude ) THEN
				NEW.handle_geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.handle_geometry), ST_Y(NEW.handle_geometry), COALESCE(NEW.handle_altitude,0) ), ST_SRID(NEW.handle_geometry) );
		END IF;
		RETURN NEW;
	END;
"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"
	BEGIN
	UPDATE qwat_od.vw_node_element SET
			fk_district = NEW.fk_district,
			fk_pressurezone = NEW.fk_pressurezone,
			fk_printmap = NEW.fk_printmap,
			_printmaps = NEW._printmaps,
			_geometry_alt1_used = NEW._geometry_alt1_used,
			_geometry_alt2_used = NEW._geometry_alt2_used,
			_pipe_node_type = NEW._pipe_node_type,
			_pipe_orientation = NEW._pipe_orientation,
			_pipe_schema_visible = NEW._pipe_schema_visible,
			geometry = NEW.geometry,
			geometry_alt1 = NEW.geometry_alt1,
			geometry_alt2 = NEW.geometry_alt2,
			update_geometry_alt1 = NEW.update_geometry_alt1,
			update_geometry_alt2 = NEW.update_geometry_alt2,
			identification = NEW.identification,
			fk_distributor = NEW.fk_distributor,
			fk_status = NEW.fk_status,
			fk_folder = NEW.fk_folder,
			fk_locationtype = NEW.fk_locationtype,
			fk_precision = NEW.fk_precision,
			fk_precisionalti = NEW.fk_precisionalti,
			fk_object_reference = NEW.fk_object_reference,
			altitude = NEW.altitude,
			year = NEW.year,
			year_end = NEW.year_end,
			orientation = NEW.orientation,
			remark = NEW.remark,
			schema_force_visible = NEW.schema_force_visible,
			label_1_visible = NEW.label_1_visible,
			label_1_x = NEW.label_1_x,
			label_1_y = NEW.label_1_y,
			label_1_rotation = NEW.label_1_rotation,
			label_1_text = NEW.label_1_text,
			label_2_visible = NEW.label_2_visible,
			label_2_x = NEW.label_2_x,
			label_2_y = NEW.label_2_y,
			label_2_rotation = NEW.label_2_rotation,
			label_2_text = NEW.label_2_text
		WHERE id = OLD.id;

	UPDATE qwat_od.meter SET
			fk_pipe = NEW.fk_pipe,
			parcel = NEW.parcel
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"
	BEGIN
		IF NEW.geometry_alt1 IS NULL OR NEW.update_geometry_alt1 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt1 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt1) ) THEN
			NEW.geometry_alt1 := NEW.geometry;
		END IF;
		IF NEW.geometry_alt2 IS NULL OR NEW.update_geometry_alt2 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt2 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt2) ) THEN
			NEW.geometry_alt2 := NEW.geometry;
		END IF;
		NEW._geometry_alt1_used := ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW.update_geometry_alt1 := NULL; -- used to determine if alternative geometry 1 should be updated when main geometry is updated
		NEW.update_geometry_alt2 := NULL; -- used to determine if alternative geometry 2 should be updated when main geometry is updated
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"
	BEGIN
		DELETE FROM qwat_od.pressurecontrol WHERE id = OLD.id;
		DELETE FROM qwat_od.installation WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"
	BEGIN
	CASE
		WHEN OLD.node_type::qwat_od.node_type = 'element'::qwat_od.node_type THEN
			DELETE FROM qwat_od.network_element WHERE id = OLD.id;
	END CASE;
	PERFORM qwat_od.fn_node_set_type(OLD.id);
	RETURN NULL;
	END;
	"
"
	BEGIN
	UPDATE qwat_od.installation SET
			name = NEW.name,
			fk_parent = NEW.fk_parent,
			fk_remote = NEW.fk_remote,
			fk_watertype = NEW.fk_watertype,
			parcel = NEW.parcel,
			eca = NEW.eca,
			open_water_surface = NEW.open_water_surface,
			geometry_polygon = NEW.geometry_polygon
		WHERE id = OLD.id;

	UPDATE qwat_od.pump SET
			fk_pump_type = NEW.fk_pump_type,
			fk_pipe_in = NEW.fk_pipe_in,
			fk_pipe_out = NEW.fk_pipe_out,
			fk_pump_operating = NEW.fk_pump_operating,
			no_pumps = NEW.no_pumps,
			rejected_flow = NEW.rejected_flow,
			manometric_height = NEW.manometric_height
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"
	BEGIN
		INSERT INTO qwat_od.vw_node_element (
			id
			, fk_district
			, fk_pressurezone
			, fk_printmap
			, _printmaps
			, _geometry_alt1_used
			, _geometry_alt2_used
			, _pipe_node_type
			, _pipe_orientation
			, _pipe_schema_visible
			, geometry
			, geometry_alt1
			, geometry_alt2
			, update_geometry_alt1
			, update_geometry_alt2
			, identification
			, fk_distributor
			, fk_status
			, fk_folder
			, fk_locationtype
			, fk_precision
			, fk_precisionalti
			, fk_object_reference
			, altitude
			, year
			, year_end
			, orientation
			, remark
			, schema_force_visible
			, label_1_visible
			, label_1_x
			, label_1_y
			, label_1_rotation
			, label_1_text
			, label_2_visible
			, label_2_x
			, label_2_y
			, label_2_rotation
			, label_2_text
		) VALUES (
			NEW.id 
			, NEW.fk_district
			, NEW.fk_pressurezone
			, NEW.fk_printmap
			, NEW._printmaps
			, NEW._geometry_alt1_used
			, NEW._geometry_alt2_used
			, NEW._pipe_node_type
			, NEW._pipe_orientation
			, NEW._pipe_schema_visible
			, NEW.geometry
			, NEW.geometry_alt1
			, NEW.geometry_alt2
			, NEW.update_geometry_alt1
			, NEW.update_geometry_alt2
			, NEW.identification
			, NEW.fk_distributor
			, NEW.fk_status
			, NEW.fk_folder
			, NEW.fk_locationtype
			, NEW.fk_precision
			, NEW.fk_precisionalti
			, NEW.fk_object_reference
			, NEW.altitude
			, NEW.year
			, NEW.year_end
			, NEW.orientation
			, NEW.remark
			, NEW.schema_force_visible
			, NEW.label_1_visible
			, NEW.label_1_x
			, NEW.label_1_y
			, NEW.label_1_rotation
			, NEW.label_1_text
			, NEW.label_2_visible
			, NEW.label_2_x
			, NEW.label_2_y
			, NEW.label_2_rotation
			, NEW.label_2_text
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.vw_qwat_installation (
			id
			, installation_type
			, name
			, fk_parent
			, fk_remote
			, fk_watertype
			, parcel
			, eca
			, open_water_surface
			, geometry_polygon
			, fk_source_type
			, fk_source_quality
			, flow_lowest
			, flow_average
			, flow_concession
			, contract_end
			, gathering_chamber
			, fk_pump_type
			, fk_pipe_in
			, fk_pipe_out
			, fk_pump_operating
			, no_pumps
			, rejected_flow
			, manometric_height
			, fk_overflow
			, fk_tank_firestorage
			, storage_total
			, storage_supply
			, storage_fire
			, altitude_overflow
			, altitude_apron
			, height_max
			, fire_valve
			, fire_remote
			, _litrepercm
			, cistern1_fk_type
			, cistern1_dimension_1
			, cistern1_dimension_2
			, cistern1_storage
			, _cistern1_litrepercm
			, cistern2_fk_type
			, cistern2_dimension_1
			, cistern2_dimension_2
			, cistern2_storage
			, _cistern2_litrepercm
			, sanitization_uv
			, sanitization_chlorine_liquid
			, sanitization_chlorine_gazeous
			, sanitization_ozone
			, filtration_membrane
			, filtration_sandorgravel
			, flocculation
			, activatedcharcoal
			, settling
			, treatment_capacity
			, networkseparation
			, flow_meter
			, water_meter
			, manometer
			, depth
			, no_valves
			, fk_pressurecontrol_type
		) VALUES (
			NEW.id 
			, NEW.installation_type
			, NEW.name
			, NEW.fk_parent
			, NEW.fk_remote
			, NEW.fk_watertype
			, NEW.parcel
			, NEW.eca
			, NEW.open_water_surface
			, NEW.geometry_polygon
			, NEW.fk_source_type
			, NEW.fk_source_quality
			, NEW.flow_lowest
			, NEW.flow_average
			, NEW.flow_concession
			, NEW.contract_end
			, NEW.gathering_chamber
			, NEW.fk_pump_type
			, NEW.fk_pipe_in
			, NEW.fk_pipe_out
			, NEW.fk_pump_operating
			, NEW.no_pumps
			, NEW.rejected_flow
			, NEW.manometric_height
			, NEW.fk_overflow
			, NEW.fk_tank_firestorage
			, NEW.storage_total
			, NEW.storage_supply
			, NEW.storage_fire
			, NEW.altitude_overflow
			, NEW.altitude_apron
			, NEW.height_max
			, NEW.fire_valve
			, NEW.fire_remote
			, NEW._litrepercm
			, NEW.cistern1_fk_type
			, NEW.cistern1_dimension_1
			, NEW.cistern1_dimension_2
			, NEW.cistern1_storage
			, NEW._cistern1_litrepercm
			, NEW.cistern2_fk_type
			, NEW.cistern2_dimension_1
			, NEW.cistern2_dimension_2
			, NEW.cistern2_storage
			, NEW._cistern2_litrepercm
			, NEW.sanitization_uv
			, NEW.sanitization_chlorine_liquid
			, NEW.sanitization_chlorine_gazeous
			, NEW.sanitization_ozone
			, NEW.filtration_membrane
			, NEW.filtration_sandorgravel
			, NEW.flocculation
			, NEW.activatedcharcoal
			, NEW.settling
			, NEW.treatment_capacity
			, NEW.networkseparation
			, NEW.flow_meter
			, NEW.water_meter
			, NEW.manometer
			, NEW.depth
			, NEW.no_valves
			, NEW.fk_pressurecontrol_type
		);
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_del"
"
	BEGIN
		DELETE FROM qwat_od.tank WHERE id = OLD.id;
		DELETE FROM qwat_od.installation WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"
	BEGIN
		DELETE FROM qwat_od.chamber WHERE id = OLD.id;
		DELETE FROM qwat_od.installation WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"
	BEGIN
		DELETE FROM qwat_od.samplingpoint WHERE id = OLD.id;
		DELETE FROM qwat_od.vw_node_element WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"
	BEGIN
	UPDATE qwat_od.installation SET
			name = NEW.name,
			fk_parent = NEW.fk_parent,
			fk_remote = NEW.fk_remote,
			fk_watertype = NEW.fk_watertype,
			parcel = NEW.parcel,
			eca = NEW.eca,
			open_water_surface = NEW.open_water_surface,
			geometry_polygon = NEW.geometry_polygon
		WHERE id = OLD.id;
	-- detect if type has changed
	IF OLD.installation_type <> NEW.installation_type::qwat_od.installation_type THEN
		RAISE EXCEPTION 'Type change not allowed for installation'
			USING HINT = 'You cannot switch from ' || OLD.installation_type || ' to ' || NEW.installation_type; 
	END IF;
	CASE
	WHEN NEW.installation_type::qwat_od.installation_type = 'source'::qwat_od.installation_type
		THEN UPDATE qwat_od.source SET
			fk_source_type = NEW.fk_source_type
			, fk_source_quality = NEW.fk_source_quality
			, flow_lowest = NEW.flow_lowest
			, flow_average = NEW.flow_average
			, flow_concession = NEW.flow_concession
			, contract_end = NEW.contract_end
			, gathering_chamber = NEW.gathering_chamber
		WHERE id = OLD.id;
	WHEN NEW.installation_type::qwat_od.installation_type = 'pump'::qwat_od.installation_type
		THEN UPDATE qwat_od.pump SET
			fk_pump_type = NEW.fk_pump_type
			, fk_pipe_in = NEW.fk_pipe_in
			, fk_pipe_out = NEW.fk_pipe_out
			, fk_pump_operating = NEW.fk_pump_operating
			, no_pumps = NEW.no_pumps
			, rejected_flow = NEW.rejected_flow
			, manometric_height = NEW.manometric_height
		WHERE id = OLD.id;
	WHEN NEW.installation_type::qwat_od.installation_type = 'tank'::qwat_od.installation_type
		THEN UPDATE qwat_od.tank SET
			fk_overflow = NEW.fk_overflow
			, fk_tank_firestorage = NEW.fk_tank_firestorage
			, storage_total = NEW.storage_total
			, storage_supply = NEW.storage_supply
			, storage_fire = NEW.storage_fire
			, altitude_overflow = NEW.altitude_overflow
			, altitude_apron = NEW.altitude_apron
			, height_max = NEW.height_max
			, fire_valve = NEW.fire_valve
			, fire_remote = NEW.fire_remote
			, _litrepercm = NEW._litrepercm
			, cistern1_fk_type = NEW.cistern1_fk_type
			, cistern1_dimension_1 = NEW.cistern1_dimension_1
			, cistern1_dimension_2 = NEW.cistern1_dimension_2
			, cistern1_storage = NEW.cistern1_storage
			, _cistern1_litrepercm = NEW._cistern1_litrepercm
			, cistern2_fk_type = NEW.cistern2_fk_type
			, cistern2_dimension_1 = NEW.cistern2_dimension_1
			, cistern2_dimension_2 = NEW.cistern2_dimension_2
			, cistern2_storage = NEW.cistern2_storage
			, _cistern2_litrepercm = NEW._cistern2_litrepercm
		WHERE id = OLD.id;
	WHEN NEW.installation_type::qwat_od.installation_type = 'treatment'::qwat_od.installation_type
		THEN UPDATE qwat_od.treatment SET
			sanitization_uv = NEW.sanitization_uv
			, sanitization_chlorine_liquid = NEW.sanitization_chlorine_liquid
			, sanitization_chlorine_gazeous = NEW.sanitization_chlorine_gazeous
			, sanitization_ozone = NEW.sanitization_ozone
			, filtration_membrane = NEW.filtration_membrane
			, filtration_sandorgravel = NEW.filtration_sandorgravel
			, flocculation = NEW.flocculation
			, activatedcharcoal = NEW.activatedcharcoal
			, settling = NEW.settling
			, treatment_capacity = NEW.treatment_capacity
		WHERE id = OLD.id;
	WHEN NEW.installation_type::qwat_od.installation_type = 'chamber'::qwat_od.installation_type
		THEN UPDATE qwat_od.chamber SET
			networkseparation = NEW.networkseparation
			, flow_meter = NEW.flow_meter
			, water_meter = NEW.water_meter
			, manometer = NEW.manometer
			, depth = NEW.depth
			, no_valves = NEW.no_valves
		WHERE id = OLD.id;
	WHEN NEW.installation_type::qwat_od.installation_type = 'pressurecontrol'::qwat_od.installation_type
		THEN UPDATE qwat_od.pressurecontrol SET
			fk_pressurecontrol_type = NEW.fk_pressurecontrol_type
		WHERE id = OLD.id;
	END CASE;

	RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"RI_FKey_noaction_del"
"
	BEGIN
		INSERT INTO qwat_od.vw_node_element (
			id
			, fk_district
			, fk_pressurezone
			, fk_printmap
			, _printmaps
			, _geometry_alt1_used
			, _geometry_alt2_used
			, _pipe_node_type
			, _pipe_orientation
			, _pipe_schema_visible
			, geometry
			, geometry_alt1
			, geometry_alt2
			, update_geometry_alt1
			, update_geometry_alt2
			, identification
			, fk_distributor
			, fk_status
			, fk_folder
			, fk_locationtype
			, fk_precision
			, fk_precisionalti
			, fk_object_reference
			, altitude
			, year
			, year_end
			, orientation
			, remark
			, schema_force_visible
			, label_1_visible
			, label_1_x
			, label_1_y
			, label_1_rotation
			, label_1_text
			, label_2_visible
			, label_2_x
			, label_2_y
			, label_2_rotation
			, label_2_text
		) VALUES (
			NEW.id 
			, NEW.fk_district
			, NEW.fk_pressurezone
			, NEW.fk_printmap
			, NEW._printmaps
			, NEW._geometry_alt1_used
			, NEW._geometry_alt2_used
			, NEW._pipe_node_type
			, NEW._pipe_orientation
			, NEW._pipe_schema_visible
			, NEW.geometry
			, NEW.geometry_alt1
			, NEW.geometry_alt2
			, NEW.update_geometry_alt1
			, NEW.update_geometry_alt2
			, NEW.identification
			, NEW.fk_distributor
			, NEW.fk_status
			, NEW.fk_folder
			, NEW.fk_locationtype
			, NEW.fk_precision
			, NEW.fk_precisionalti
			, NEW.fk_object_reference
			, NEW.altitude
			, NEW.year
			, NEW.year_end
			, NEW.orientation
			, NEW.remark
			, NEW.schema_force_visible
			, NEW.label_1_visible
			, NEW.label_1_x
			, NEW.label_1_y
			, NEW.label_1_rotation
			, NEW.label_1_text
			, NEW.label_2_visible
			, NEW.label_2_x
			, NEW.label_2_y
			, NEW.label_2_rotation
			, NEW.label_2_text
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.meter (
			id
			, fk_pipe
			, parcel
		) VALUES (
			NEW.id 
			, NEW.fk_pipe
			, NEW.parcel
		);
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		IF 	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 OR
			NEW.altitude IS NOT NULL AND ( ST_Z(NEW.geometry) IS NULL OR ST_Z(NEW.geometry) <> NEW.altitude ) THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
		END IF;
		RETURN NEW;
	END;
"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"
	BEGIN
	UPDATE qwat_od.vw_node_element SET
			fk_district = NEW.fk_district,
			fk_pressurezone = NEW.fk_pressurezone,
			fk_printmap = NEW.fk_printmap,
			_printmaps = NEW._printmaps,
			_geometry_alt1_used = NEW._geometry_alt1_used,
			_geometry_alt2_used = NEW._geometry_alt2_used,
			_pipe_node_type = NEW._pipe_node_type,
			_pipe_orientation = NEW._pipe_orientation,
			_pipe_schema_visible = NEW._pipe_schema_visible,
			geometry = NEW.geometry,
			geometry_alt1 = NEW.geometry_alt1,
			geometry_alt2 = NEW.geometry_alt2,
			update_geometry_alt1 = NEW.update_geometry_alt1,
			update_geometry_alt2 = NEW.update_geometry_alt2,
			identification = NEW.identification,
			fk_distributor = NEW.fk_distributor,
			fk_status = NEW.fk_status,
			fk_folder = NEW.fk_folder,
			fk_locationtype = NEW.fk_locationtype,
			fk_precision = NEW.fk_precision,
			fk_precisionalti = NEW.fk_precisionalti,
			fk_object_reference = NEW.fk_object_reference,
			altitude = NEW.altitude,
			year = NEW.year,
			year_end = NEW.year_end,
			orientation = NEW.orientation,
			remark = NEW.remark,
			schema_force_visible = NEW.schema_force_visible,
			label_1_visible = NEW.label_1_visible,
			label_1_x = NEW.label_1_x,
			label_1_y = NEW.label_1_y,
			label_1_rotation = NEW.label_1_rotation,
			label_1_text = NEW.label_1_text,
			label_2_visible = NEW.label_2_visible,
			label_2_x = NEW.label_2_x,
			label_2_y = NEW.label_2_y,
			label_2_rotation = NEW.label_2_rotation,
			label_2_text = NEW.label_2_text
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"
	BEGIN
		INSERT INTO qwat_od.vw_node_element (
			id
			, fk_district
			, fk_pressurezone
			, fk_printmap
			, _printmaps
			, _geometry_alt1_used
			, _geometry_alt2_used
			, _pipe_node_type
			, _pipe_orientation
			, _pipe_schema_visible
			, geometry
			, geometry_alt1
			, geometry_alt2
			, update_geometry_alt1
			, update_geometry_alt2
			, identification
			, fk_distributor
			, fk_status
			, fk_folder
			, fk_locationtype
			, fk_precision
			, fk_precisionalti
			, fk_object_reference
			, altitude
			, year
			, year_end
			, orientation
			, remark
			, schema_force_visible
			, label_1_visible
			, label_1_x
			, label_1_y
			, label_1_rotation
			, label_1_text
			, label_2_visible
			, label_2_x
			, label_2_y
			, label_2_rotation
			, label_2_text
		) VALUES (
			NEW.id 
			, NEW.fk_district
			, NEW.fk_pressurezone
			, NEW.fk_printmap
			, NEW._printmaps
			, NEW._geometry_alt1_used
			, NEW._geometry_alt2_used
			, NEW._pipe_node_type
			, NEW._pipe_orientation
			, NEW._pipe_schema_visible
			, NEW.geometry
			, NEW.geometry_alt1
			, NEW.geometry_alt2
			, NEW.update_geometry_alt1
			, NEW.update_geometry_alt2
			, NEW.identification
			, NEW.fk_distributor
			, NEW.fk_status
			, NEW.fk_folder
			, NEW.fk_locationtype
			, NEW.fk_precision
			, NEW.fk_precisionalti
			, NEW.fk_object_reference
			, NEW.altitude
			, NEW.year
			, NEW.year_end
			, NEW.orientation
			, NEW.remark
			, NEW.schema_force_visible
			, NEW.label_1_visible
			, NEW.label_1_x
			, NEW.label_1_y
			, NEW.label_1_rotation
			, NEW.label_1_text
			, NEW.label_2_visible
			, NEW.label_2_x
			, NEW.label_2_y
			, NEW.label_2_rotation
			, NEW.label_2_text
		) RETURNING id INTO NEW.id;

	CASE
		WHEN NEW.element_type::qwat_od.element_type = 'subscriber'::qwat_od.element_type
			THEN INSERT INTO qwat_od.subscriber (
				id 
				, fk_subscriber_type
				, fk_pipe
				, parcel
				, flow_current
				, flow_planned
			) VALUES (
				NEW.id
				, NEW.fk_subscriber_type
				, NEW.fk_pipe
				, NEW.parcel
				, NEW.flow_current
				, NEW.flow_planned
		);

		WHEN NEW.element_type::qwat_od.element_type = 'part'::qwat_od.element_type
			THEN INSERT INTO qwat_od.part (
				id 
				, fk_part_type
				, fk_pipe
			) VALUES (
				NEW.id
				, NEW.fk_part_type
				, qwat_od.fn_pipe_get_id(NEW.geometry)
		);

		WHEN NEW.element_type::qwat_od.element_type = 'installation'::qwat_od.element_type
			THEN INSERT INTO qwat_od.vw_qwat_installation (
				id 
				, installation_type
				, name
				, fk_parent
				, fk_remote
				, fk_watertype
				, parcel
				, eca
				, open_water_surface
				, geometry_polygon
				, fk_source_type
				, fk_source_quality
				, flow_lowest
				, flow_average
				, flow_concession
				, contract_end
				, gathering_chamber
				, fk_pump_type
				, fk_pipe_in
				, fk_pipe_out
				, fk_pump_operating
				, no_pumps
				, rejected_flow
				, manometric_height
				, fk_overflow
				, fk_tank_firestorage
				, storage_total
				, storage_supply
				, storage_fire
				, altitude_overflow
				, altitude_apron
				, height_max
				, fire_valve
				, fire_remote
				, _litrepercm
				, cistern1_fk_type
				, cistern1_dimension_1
				, cistern1_dimension_2
				, cistern1_storage
				, _cistern1_litrepercm
				, cistern2_fk_type
				, cistern2_dimension_1
				, cistern2_dimension_2
				, cistern2_storage
				, _cistern2_litrepercm
				, sanitization_uv
				, sanitization_chlorine_liquid
				, sanitization_chlorine_gazeous
				, sanitization_ozone
				, filtration_membrane
				, filtration_sandorgravel
				, flocculation
				, activatedcharcoal
				, settling
				, treatment_capacity
				, networkseparation
				, flow_meter
				, water_meter
				, manometer
				, depth
				, no_valves
				, fk_pressurecontrol_type
			) VALUES (
				NEW.id
				, NEW.installation_type
				, NEW.name
				, NEW.fk_parent
				, NEW.fk_remote
				, NEW.fk_watertype
				, NEW.parcel
				, NEW.eca
				, NEW.open_water_surface
				, NEW.geometry_polygon
				, NEW.fk_source_type
				, NEW.fk_source_quality
				, NEW.flow_lowest
				, NEW.flow_average
				, NEW.flow_concession
				, NEW.contract_end
				, NEW.gathering_chamber
				, NEW.fk_pump_type
				, NEW.fk_pipe_in
				, NEW.fk_pipe_out
				, NEW.fk_pump_operating
				, NEW.no_pumps
				, NEW.rejected_flow
				, NEW.manometric_height
				, NEW.fk_overflow
				, NEW.fk_tank_firestorage
				, NEW.storage_total
				, NEW.storage_supply
				, NEW.storage_fire
				, NEW.altitude_overflow
				, NEW.altitude_apron
				, NEW.height_max
				, NEW.fire_valve
				, NEW.fire_remote
				, NEW._litrepercm
				, NEW.cistern1_fk_type
				, NEW.cistern1_dimension_1
				, NEW.cistern1_dimension_2
				, NEW.cistern1_storage
				, NEW._cistern1_litrepercm
				, NEW.cistern2_fk_type
				, NEW.cistern2_dimension_1
				, NEW.cistern2_dimension_2
				, NEW.cistern2_storage
				, NEW._cistern2_litrepercm
				, NEW.sanitization_uv
				, NEW.sanitization_chlorine_liquid
				, NEW.sanitization_chlorine_gazeous
				, NEW.sanitization_ozone
				, NEW.filtration_membrane
				, NEW.filtration_sandorgravel
				, NEW.flocculation
				, NEW.activatedcharcoal
				, NEW.settling
				, NEW.treatment_capacity
				, NEW.networkseparation
				, NEW.flow_meter
				, NEW.water_meter
				, NEW.manometer
				, NEW.depth
				, NEW.no_valves
				, NEW.fk_pressurecontrol_type
		);

		WHEN NEW.element_type::qwat_od.element_type = 'hydrant'::qwat_od.element_type
			THEN INSERT INTO qwat_od.hydrant (
				id 
				, fk_provider
				, fk_model_sup
				, fk_model_inf
				, fk_material
				, fk_output
				, underground
				, marked
				, pressure_static
				, pressure_dynamic
				, flow
				, observation_date
				, observation_source
			) VALUES (
				NEW.id
				, NEW.fk_provider
				, NEW.fk_model_sup
				, NEW.fk_model_inf
				, NEW.fk_material
				, NEW.fk_output
				, NEW.underground
				, NEW.marked
				, NEW.pressure_static
				, NEW.pressure_dynamic
				, NEW.flow
				, NEW.observation_date
				, NEW.observation_source
		);

		WHEN NEW.element_type::qwat_od.element_type = 'samplingpoint'::qwat_od.element_type
			THEN INSERT INTO qwat_od.samplingpoint (
				id 
			) VALUES (
				NEW.id
		);

		WHEN NEW.element_type::qwat_od.element_type = 'valve'::qwat_od.element_type
			THEN INSERT INTO qwat_od.valve (
				id 
				, fk_valve_type
				, fk_valve_function
				, fk_valve_actuation
				, fk_pipe
				, fk_handle_precision
				, fk_handle_precisionalti
				, fk_maintenance
				, diameter_nominal
				, closed
				, networkseparation
				, handle_altitude
				, handle_geometry
			) VALUES (
				NEW.id
				, NEW.fk_valve_type
				, NEW.fk_valve_function
				, NEW.fk_valve_actuation
				, qwat_od.fn_pipe_get_id(NEW.geometry)
				, NEW.fk_handle_precision
				, NEW.fk_handle_precisionalti
				, NEW.fk_maintenance
				, NEW.diameter_nominal
				, NEW.closed
				, NEW.networkseparation
				, NEW.handle_altitude
				, NEW.handle_geometry
		);

		WHEN NEW.element_type::qwat_od.element_type = 'meter'::qwat_od.element_type
			THEN INSERT INTO qwat_od.meter (
				id 
				, fk_pipe
				, parcel
			) VALUES (
				NEW.id
				, NEW.fk_pipe
				, NEW.parcel
		);

	 END CASE;
		RETURN NEW;
	END;
	"
"
	BEGIN		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		-- TODO handle going to NULL on update 
		IF	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 OR
				NEW.altitude IS NOT NULL AND ( ST_Z(NEW.geometry) IS NULL OR ST_Z(NEW.geometry) <> NEW.altitude ) THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
		END IF;


	UPDATE qwat_od.node SET
			fk_district = NEW.fk_district,
			fk_pressurezone = NEW.fk_pressurezone,
			fk_printmap = NEW.fk_printmap,
			_printmaps = NEW._printmaps,
			_geometry_alt1_used = NEW._geometry_alt1_used,
			_geometry_alt2_used = NEW._geometry_alt2_used,
			_pipe_node_type = NEW._pipe_node_type,
			_pipe_orientation = NEW._pipe_orientation,
			_pipe_schema_visible = NEW._pipe_schema_visible,
			geometry = NEW.geometry,
			geometry_alt1 = NEW.geometry_alt1,
			geometry_alt2 = NEW.geometry_alt2,
			update_geometry_alt1 = NEW.update_geometry_alt1,
			update_geometry_alt2 = NEW.update_geometry_alt2
		WHERE id = OLD.id;

	UPDATE qwat_od.network_element SET
			identification = NEW.identification,
			fk_distributor = NEW.fk_distributor,
			fk_status = NEW.fk_status,
			fk_folder = NEW.fk_folder,
			fk_locationtype = NEW.fk_locationtype,
			fk_precision = NEW.fk_precision,
			fk_precisionalti = NEW.fk_precisionalti,
			fk_object_reference = NEW.fk_object_reference,
			altitude = NEW.altitude,
			year = NEW.year,
			year_end = NEW.year_end,
			orientation = NEW.orientation,
			remark = NEW.remark,
			schema_force_visible = NEW.schema_force_visible,
			label_1_visible = NEW.label_1_visible,
			label_1_x = NEW.label_1_x,
			label_1_y = NEW.label_1_y,
			label_1_rotation = NEW.label_1_rotation,
			label_1_text = NEW.label_1_text,
			label_2_visible = NEW.label_2_visible,
			label_2_x = NEW.label_2_x,
			label_2_y = NEW.label_2_y,
			label_2_rotation = NEW.label_2_rotation,
			label_2_text = NEW.label_2_text
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"
	BEGIN
		IF NEW.geometry_alt1 IS NULL OR NEW.update_geometry_alt1 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt1 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt1) ) THEN
			NEW.geometry_alt1 := NEW.geometry;
		END IF;
		IF NEW.geometry_alt2 IS NULL OR NEW.update_geometry_alt2 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt2 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt2) ) THEN
			NEW.geometry_alt2 := NEW.geometry;
		END IF;
		NEW._geometry_alt1_used := ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW.update_geometry_alt1 := NULL; -- used to determine if alternative geometry 1 should be updated when main geometry is updated
		NEW.update_geometry_alt2 := NULL; -- used to determine if alternative geometry 2 should be updated when main geometry is updated
		RETURN NEW;
	END;
	"
"
	BEGIN
		IF NEW.diameter IS NULL OR NEW.diameter = '' THEN
			NEW._displayname_en := NEW.short_en;
			NEW._displayname_fr := NEW.short_fr;
                 	NEW._displayname_ro := NEW.short_ro;
                ELSE
			NEW._displayname_en := NEW.short_en||' '||NEW.diameter||COALESCE(' PN'||NEW.pressure_nominal,'');
		 	NEW._displayname_fr := NEW.short_fr||' '||NEW.diameter||COALESCE(' PN'||NEW.pressure_nominal,'');
                 	NEW._displayname_ro := NEW.short_ro||' '||NEW.diameter||COALESCE(' PN'||NEW.pressure_nominal,'');
		END IF;
		RETURN NEW;
	END;
"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"
	BEGIN
		INSERT INTO qwat_od.installation (
			id
			, name
			, fk_parent
			, fk_remote
			, fk_watertype
			, parcel
			, eca
			, open_water_surface
			, geometry_polygon
		) VALUES (
			NEW.id 
			, NEW.name
			, NEW.fk_parent
			, NEW.fk_remote
			, NEW.fk_watertype
			, NEW.parcel
			, NEW.eca
			, NEW.open_water_surface
			, NEW.geometry_polygon
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.chamber (
			id
			, networkseparation
			, flow_meter
			, water_meter
			, manometer
			, depth
			, no_valves
		) VALUES (
			NEW.id 
			, NEW.networkseparation
			, NEW.flow_meter
			, NEW.water_meter
			, NEW.manometer
			, NEW.depth
			, NEW.no_valves
		);
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"
	BEGIN
			-- add a vertex to the corresponding pipe if it intersects
			-- when the node is close enough to the pipe (< 1 micrometer) the node is considered to intersect the pipe
			-- it allows to deal with intersections that cannot be represented by floating point numbers
			UPDATE qwat_od.pipe SET geometry = ST_Snap(geometry, NEW.geometry, 1e-6) WHERE ST_Distance(geometry, NEW.geometry) < 1e-6;
		RETURN NEW;
	END;
"
"
	BEGIN
		UPDATE qwat_od.vw_element_valve valve SET fk_pipe = qwat_od.fn_pipe_get_id(geometry) WHERE fk_pipe = OLD.id OR ST_Distance(geometry, NEW.geometry) < 1e-4;
		RETURN NEW;
	END;
"
"
	BEGIN
		PERFORM qwat_od.fn_pipe_update_valve(OLD.id);
		PERFORM qwat_od.fn_pipe_update_valve(NEW.id);
		RETURN NEW;
	END;
"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"
	BEGIN
		DELETE FROM qwat_od.treatment WHERE id = OLD.id;
		DELETE FROM qwat_od.installation WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"
	DECLARE
		node_ids integer[];
	BEGIN
		IF TG_OP = 'INSERT' THEN
			node_ids := ARRAY[NEW.fk_node_a, NEW.fk_node_b];
		ELSE
			-- delete or update (OLD exists)
			node_ids := ARRAY[OLD.fk_node_a, OLD.fk_node_b];
		END IF;
		IF TG_OP = 'UPDATE' THEN
			IF NEW.fk_node_a <> OLD.fk_node_a THEN
				node_ids := array_append(node_ids, OLD.fk_node_a);
			END IF;
			IF NEW.fk_node_b <> OLD.fk_node_b THEN
				node_ids := array_append(node_ids, OLD.fk_node_b);
			END IF;
		END IF;
		PERFORM qwat_od.fn_node_set_type( node_ids );
		RETURN NEW;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"
	BEGIN
		IF TG_OP <> 'INSERT' THEN
			EXECUTE format($$DROP FUNCTION IF EXISTS qwat_sys.fn_setting_%1$I();$$, OLD.name);
		END IF;
		IF TG_OP <> 'DELETE' THEN
			EXECUTE format($$
				CREATE FUNCTION qwat_sys.fn_setting_%1$I() RETURNS %2$s AS
					'SELECT value::%2$s from qwat_sys.settings where name = ''%1$I''' language sql
			$$, NEW.name, NEW.type::regtype );
		END	IF;
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"
	BEGIN
		DELETE FROM qwat_od.network_element WHERE id = OLD.id;
		PERFORM qwat_od.fn_node_set_type(OLD.id);
		RETURN NULL;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"
	BEGIN
		IF NEW.geometry_alt1 IS NULL OR NEW.update_geometry_alt1 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt1 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt1) ) THEN
			NEW.geometry_alt1 := NEW.geometry;
		END IF;
		IF NEW.geometry_alt2 IS NULL OR NEW.update_geometry_alt2 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt2 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt2) ) THEN
			NEW.geometry_alt2 := NEW.geometry;
		END IF;
		NEW._geometry_alt1_used := ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW.update_geometry_alt1 := NULL; -- used to determine if alternative geometry 1 should be updated when main geometry is updated
		NEW.update_geometry_alt2 := NULL; -- used to determine if alternative geometry 2 should be updated when main geometry is updated
		RETURN NEW;
	END;
	"
"
	BEGIN
		IF NEW.geometry_alt1 IS NULL OR NEW.update_geometry_alt1 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt1 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt1) ) THEN
			NEW.geometry_alt1 := NEW.geometry;
		END IF;
		IF NEW.geometry_alt2 IS NULL OR NEW.update_geometry_alt2 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt2 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt2) ) THEN
			NEW.geometry_alt2 := NEW.geometry;
		END IF;
		NEW._geometry_alt1_used := ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW.update_geometry_alt1 := NULL; -- used to determine if alternative geometry 1 should be updated when main geometry is updated
		NEW.update_geometry_alt2 := NULL; -- used to determine if alternative geometry 2 should be updated when main geometry is updated
		RETURN NEW;
	END;
	"
"
	BEGIN
		INSERT INTO qwat_od.vw_node_element (
			id
			, fk_district
			, fk_pressurezone
			, fk_printmap
			, _printmaps
			, _geometry_alt1_used
			, _geometry_alt2_used
			, _pipe_node_type
			, _pipe_orientation
			, _pipe_schema_visible
			, geometry
			, geometry_alt1
			, geometry_alt2
			, update_geometry_alt1
			, update_geometry_alt2
			, identification
			, fk_distributor
			, fk_status
			, fk_folder
			, fk_locationtype
			, fk_precision
			, fk_precisionalti
			, fk_object_reference
			, altitude
			, year
			, year_end
			, orientation
			, remark
			, schema_force_visible
			, label_1_visible
			, label_1_x
			, label_1_y
			, label_1_rotation
			, label_1_text
			, label_2_visible
			, label_2_x
			, label_2_y
			, label_2_rotation
			, label_2_text
		) VALUES (
			NEW.id 
			, NEW.fk_district
			, NEW.fk_pressurezone
			, NEW.fk_printmap
			, NEW._printmaps
			, NEW._geometry_alt1_used
			, NEW._geometry_alt2_used
			, NEW._pipe_node_type
			, NEW._pipe_orientation
			, NEW._pipe_schema_visible
			, NEW.geometry
			, NEW.geometry_alt1
			, NEW.geometry_alt2
			, NEW.update_geometry_alt1
			, NEW.update_geometry_alt2
			, NEW.identification
			, NEW.fk_distributor
			, NEW.fk_status
			, NEW.fk_folder
			, NEW.fk_locationtype
			, NEW.fk_precision
			, NEW.fk_precisionalti
			, NEW.fk_object_reference
			, NEW.altitude
			, NEW.year
			, NEW.year_end
			, NEW.orientation
			, NEW.remark
			, NEW.schema_force_visible
			, NEW.label_1_visible
			, NEW.label_1_x
			, NEW.label_1_y
			, NEW.label_1_rotation
			, NEW.label_1_text
			, NEW.label_2_visible
			, NEW.label_2_x
			, NEW.label_2_y
			, NEW.label_2_rotation
			, NEW.label_2_text
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.valve (
			id
			, fk_valve_type
			, fk_valve_function
			, fk_valve_actuation
			, fk_pipe
			, fk_handle_precision
			, fk_handle_precisionalti
			, fk_maintenance
			, diameter_nominal
			, closed
			, networkseparation
			, handle_altitude
			, handle_geometry
		) VALUES (
			NEW.id 
			, NEW.fk_valve_type
			, NEW.fk_valve_function
			, NEW.fk_valve_actuation
			, qwat_od.fn_pipe_get_id(NEW.geometry)
			, NEW.fk_handle_precision
			, NEW.fk_handle_precisionalti
			, NEW.fk_maintenance
			, NEW.diameter_nominal
			, NEW.closed
			, NEW.networkseparation
			, NEW.handle_altitude
			, NEW.handle_geometry
		);
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"
	BEGIN
	UPDATE qwat_od.installation SET
			name = NEW.name,
			fk_parent = NEW.fk_parent,
			fk_remote = NEW.fk_remote,
			fk_watertype = NEW.fk_watertype,
			parcel = NEW.parcel,
			eca = NEW.eca,
			open_water_surface = NEW.open_water_surface,
			geometry_polygon = NEW.geometry_polygon
		WHERE id = OLD.id;

	UPDATE qwat_od.treatment SET
			sanitization_uv = NEW.sanitization_uv,
			sanitization_chlorine_liquid = NEW.sanitization_chlorine_liquid,
			sanitization_chlorine_gazeous = NEW.sanitization_chlorine_gazeous,
			sanitization_ozone = NEW.sanitization_ozone,
			filtration_membrane = NEW.filtration_membrane,
			filtration_sandorgravel = NEW.filtration_sandorgravel,
			flocculation = NEW.flocculation,
			activatedcharcoal = NEW.activatedcharcoal,
			settling = NEW.settling,
			treatment_capacity = NEW.treatment_capacity
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"
	BEGIN		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		-- TODO handle going to NULL on update 
		IF	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 OR
				NEW.altitude IS NOT NULL AND ( ST_Z(NEW.geometry) IS NULL OR ST_Z(NEW.geometry) <> NEW.altitude ) THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
		END IF;


	UPDATE qwat_od.node SET
			fk_district = NEW.fk_district,
			fk_pressurezone = NEW.fk_pressurezone,
			fk_printmap = NEW.fk_printmap,
			_printmaps = NEW._printmaps,
			_geometry_alt1_used = NEW._geometry_alt1_used,
			_geometry_alt2_used = NEW._geometry_alt2_used,
			_pipe_node_type = NEW._pipe_node_type,
			_pipe_orientation = NEW._pipe_orientation,
			_pipe_schema_visible = NEW._pipe_schema_visible,
			geometry = NEW.geometry,
			geometry_alt1 = NEW.geometry_alt1,
			geometry_alt2 = NEW.geometry_alt2,
			update_geometry_alt1 = NEW.update_geometry_alt1,
			update_geometry_alt2 = NEW.update_geometry_alt2
		WHERE id = OLD.id;
	-- detect if type has changed
	IF OLD.node_type <> NEW.node_type::qwat_od.node_type THEN
		RAISE EXCEPTION 'Type change not allowed for node'
			USING HINT = 'You cannot switch from ' || OLD.node_type || ' to ' || NEW.node_type; 
	END IF;
	CASE
	WHEN NEW.node_type::qwat_od.node_type = 'element'::qwat_od.node_type
		THEN UPDATE qwat_od.network_element SET
			identification = NEW.identification
			, fk_distributor = NEW.fk_distributor
			, fk_status = NEW.fk_status
			, fk_folder = NEW.fk_folder
			, fk_locationtype = NEW.fk_locationtype
			, fk_precision = NEW.fk_precision
			, fk_precisionalti = NEW.fk_precisionalti
			, fk_object_reference = NEW.fk_object_reference
			, altitude = NEW.altitude
			, year = NEW.year
			, year_end = NEW.year_end
			, orientation = NEW.orientation
			, remark = NEW.remark
			, schema_force_visible = NEW.schema_force_visible
			, label_1_visible = NEW.label_1_visible
			, label_1_x = NEW.label_1_x
			, label_1_y = NEW.label_1_y
			, label_1_rotation = NEW.label_1_rotation
			, label_1_text = NEW.label_1_text
			, label_2_visible = NEW.label_2_visible
			, label_2_x = NEW.label_2_x
			, label_2_y = NEW.label_2_y
			, label_2_rotation = NEW.label_2_rotation
			, label_2_text = NEW.label_2_text
		WHERE id = OLD.id;
	END CASE;

	RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"
	BEGIN
		INSERT INTO qwat_od.installation (
			id
			, name
			, fk_parent
			, fk_remote
			, fk_watertype
			, parcel
			, eca
			, open_water_surface
			, geometry_polygon
		) VALUES (
			NEW.id 
			, NEW.name
			, NEW.fk_parent
			, NEW.fk_remote
			, NEW.fk_watertype
			, NEW.parcel
			, NEW.eca
			, NEW.open_water_surface
			, NEW.geometry_polygon
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.treatment (
			id
			, sanitization_uv
			, sanitization_chlorine_liquid
			, sanitization_chlorine_gazeous
			, sanitization_ozone
			, filtration_membrane
			, filtration_sandorgravel
			, flocculation
			, activatedcharcoal
			, settling
			, treatment_capacity
		) VALUES (
			NEW.id 
			, NEW.sanitization_uv
			, NEW.sanitization_chlorine_liquid
			, NEW.sanitization_chlorine_gazeous
			, NEW.sanitization_ozone
			, NEW.filtration_membrane
			, NEW.filtration_sandorgravel
			, NEW.flocculation
			, NEW.activatedcharcoal
			, NEW.settling
			, NEW.treatment_capacity
		);
		RETURN NEW;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"
	BEGIN
		NEW._calculation := ST_Distance( ST_StartPoint(NEW.geometry), ST_EndPoint(NEW.geometry) );
		RETURN NEW;
	END;
"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"
	BEGIN
		INSERT INTO qwat_od.installation (
			id
			, name
			, fk_parent
			, fk_remote
			, fk_watertype
			, parcel
			, eca
			, open_water_surface
			, geometry_polygon
		) VALUES (
			NEW.id 
			, NEW.name
			, NEW.fk_parent
			, NEW.fk_remote
			, NEW.fk_watertype
			, NEW.parcel
			, NEW.eca
			, NEW.open_water_surface
			, NEW.geometry_polygon
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.tank (
			id
			, fk_overflow
			, fk_tank_firestorage
			, storage_total
			, storage_supply
			, storage_fire
			, altitude_overflow
			, altitude_apron
			, height_max
			, fire_valve
			, fire_remote
			, _litrepercm
			, cistern1_fk_type
			, cistern1_dimension_1
			, cistern1_dimension_2
			, cistern1_storage
			, _cistern1_litrepercm
			, cistern2_fk_type
			, cistern2_dimension_1
			, cistern2_dimension_2
			, cistern2_storage
			, _cistern2_litrepercm
		) VALUES (
			NEW.id 
			, NEW.fk_overflow
			, NEW.fk_tank_firestorage
			, NEW.storage_total
			, NEW.storage_supply
			, NEW.storage_fire
			, NEW.altitude_overflow
			, NEW.altitude_apron
			, NEW.height_max
			, NEW.fire_valve
			, NEW.fire_remote
			, NEW._litrepercm
			, NEW.cistern1_fk_type
			, NEW.cistern1_dimension_1
			, NEW.cistern1_dimension_2
			, NEW.cistern1_storage
			, NEW._cistern1_litrepercm
			, NEW.cistern2_fk_type
			, NEW.cistern2_dimension_1
			, NEW.cistern2_dimension_2
			, NEW.cistern2_storage
			, NEW._cistern2_litrepercm
		);
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"
	BEGIN
		IF TG_OP = 'INSERT' OR ST_Equals(ST_StartPoint(NEW.geometry), ST_StartPoint(OLD.geometry)) IS FALSE THEN
			NEW.fk_node_a       := qwat_od.fn_node_create(ST_StartPoint(NEW.geometry), /* deactivate_node_add_pipe_vertex */ TRUE);
		END IF;
		IF TG_OP = 'INSERT' OR ST_Equals(ST_EndPoint(NEW.geometry), ST_EndPoint(OLD.geometry)) IS FALSE THEN
			NEW.fk_node_b       := qwat_od.fn_node_create(ST_EndPoint(NEW.geometry), /* deactivate_node_add_pipe_vertex */ TRUE);
		END IF;
		NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
		NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
		NEW.fk_printmap         := qwat_od.fn_get_printmap_id(NEW.geometry);
		NEW._printmaps          := qwat_od.fn_get_printmaps(NEW.geometry);
		NEW._length2d           := ST_Length(NEW.geometry);
		NEW._length3d           := ST_3DLength(NEW.geometry);
		NEW._diff_elevation     := @(ST_Z(ST_StartPoint(NEW.geometry))-ST_Z(ST_EndPoint(NEW.geometry)));
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"
	BEGIN
		DELETE FROM qwat_od.part WHERE id = OLD.id;
		DELETE FROM qwat_od.vw_node_element WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		-- TODO handle going to NULL on update 
		IF	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 OR
				NEW.altitude IS NOT NULL AND ( ST_Z(NEW.geometry) IS NULL OR ST_Z(NEW.geometry) <> NEW.altitude ) THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
		END IF;

		-- The function creates or gets a parent row.
		NEW.id := qwat_od.fn_node_create(NEW.geometry);
		-- If it previously existed with another subtype, it should raise an exception
		IF (SELECT _oid IS NOT NULL FROM 
			(
				SELECT id AS _oid FROM qwat_od.network_element
			) AS foo WHERE _oid = NEW.id
		) THEN
			RAISE EXCEPTION 'Cannot insert node as element since it already has another subtype. ID: %', NEW.id;
		END IF;
		-- Now update the existing or created feature in parent table
		UPDATE qwat_od.node SET
				fk_district = NEW.fk_district,
				fk_pressurezone = NEW.fk_pressurezone,
				fk_printmap = NEW.fk_printmap,
				_printmaps = NEW._printmaps,
				_geometry_alt1_used = NEW._geometry_alt1_used,
				_geometry_alt2_used = NEW._geometry_alt2_used,
				_pipe_node_type = NEW._pipe_node_type,
				_pipe_orientation = NEW._pipe_orientation,
				_pipe_schema_visible = NEW._pipe_schema_visible,
				geometry = NEW.geometry,
				geometry_alt1 = NEW.geometry_alt1,
				geometry_alt2 = NEW.geometry_alt2,
				update_geometry_alt1 = NEW.update_geometry_alt1,
				update_geometry_alt2 = NEW.update_geometry_alt2
			WHERE id = NEW.id;

	CASE
		WHEN NEW.node_type::qwat_od.node_type = 'element'::qwat_od.node_type
			THEN INSERT INTO qwat_od.network_element (
				id 
				, identification
				, fk_distributor
				, fk_status
				, fk_folder
				, fk_locationtype
				, fk_precision
				, fk_precisionalti
				, fk_object_reference
				, altitude
				, year
				, year_end
				, orientation
				, remark
				, schema_force_visible
				, label_1_visible
				, label_1_x
				, label_1_y
				, label_1_rotation
				, label_1_text
				, label_2_visible
				, label_2_x
				, label_2_y
				, label_2_rotation
				, label_2_text
			) VALUES (
				NEW.id
				, NEW.identification
				, NEW.fk_distributor
				, NEW.fk_status
				, NEW.fk_folder
				, NEW.fk_locationtype
				, NEW.fk_precision
				, NEW.fk_precisionalti
				, NEW.fk_object_reference
				, NEW.altitude
				, NEW.year
				, NEW.year_end
				, NEW.orientation
				, NEW.remark
				, NEW.schema_force_visible
				, NEW.label_1_visible
				, NEW.label_1_x
				, NEW.label_1_y
				, NEW.label_1_rotation
				, NEW.label_1_text
				, NEW.label_2_visible
				, NEW.label_2_x
				, NEW.label_2_y
				, NEW.label_2_rotation
				, NEW.label_2_text
		);

	 END CASE;
		RETURN NEW;
	END;
	"
"RI_FKey_check_upd"
"
 BEGIN
  NEW._length3d := NULL;
  NEW._diff_elevation := NULL;
  RETURN NEW;
 END;
"
"
	BEGIN
		NEW._geometry_alt1_used := NEW.geometry_alt1 IS NOT NULL AND ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := NEW.geometry_alt2 IS NOT NULL AND ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		RETURN NEW;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"
	BEGIN
		IF NEW.fk_pipe IS NULL THEN
			NEW.fk_pipe := qwat_od.fn_pipe_get_id(NEW.geometry);
		END IF;
		RETURN NEW;
	END;
"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"
	BEGIN
		PERFORM qwat_od.fn_node_set_type(NEW.id);
	RETURN NEW;
	END;
"
"
	BEGIN
		DELETE FROM qwat_od.hydrant WHERE id = OLD.id;
		DELETE FROM qwat_od.vw_node_element WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"
	BEGIN
		DELETE FROM qwat_od.subscriber WHERE id = OLD.id;
		DELETE FROM qwat_od.vw_node_element WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"
	BEGIN
		DELETE FROM qwat_od.source WHERE id = OLD.id;
		DELETE FROM qwat_od.installation WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"
	BEGIN
		IF NEW.geometry_alt1 IS NULL OR NEW.update_geometry_alt1 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt1 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt1) ) THEN
			NEW.geometry_alt1 := NEW.geometry;
		END IF;
		IF NEW.geometry_alt2 IS NULL OR NEW.update_geometry_alt2 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt2 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt2) ) THEN
			NEW.geometry_alt2 := NEW.geometry;
		END IF;
		NEW._geometry_alt1_used := ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW.update_geometry_alt1 := NULL; -- used to determine if alternative geometry 1 should be updated when main geometry is updated
		NEW.update_geometry_alt2 := NULL; -- used to determine if alternative geometry 2 should be updated when main geometry is updated
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_upd"
"
	BEGIN
	CASE
		WHEN OLD.installation_type::qwat_od.installation_type = 'source'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.source WHERE id = OLD.id;
		WHEN OLD.installation_type::qwat_od.installation_type = 'pump'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.pump WHERE id = OLD.id;
		WHEN OLD.installation_type::qwat_od.installation_type = 'tank'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.tank WHERE id = OLD.id;
		WHEN OLD.installation_type::qwat_od.installation_type = 'treatment'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.treatment WHERE id = OLD.id;
		WHEN OLD.installation_type::qwat_od.installation_type = 'chamber'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.chamber WHERE id = OLD.id;
		WHEN OLD.installation_type::qwat_od.installation_type = 'pressurecontrol'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.pressurecontrol WHERE id = OLD.id;
	END CASE;
	DELETE FROM qwat_od.installation WHERE id = OLD.id;
	RETURN NULL;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"
	BEGIN
	UPDATE qwat_od.vw_node_element SET
			fk_district = NEW.fk_district,
			fk_pressurezone = NEW.fk_pressurezone,
			fk_printmap = NEW.fk_printmap,
			_printmaps = NEW._printmaps,
			_geometry_alt1_used = NEW._geometry_alt1_used,
			_geometry_alt2_used = NEW._geometry_alt2_used,
			_pipe_node_type = NEW._pipe_node_type,
			_pipe_orientation = NEW._pipe_orientation,
			_pipe_schema_visible = NEW._pipe_schema_visible,
			geometry = NEW.geometry,
			geometry_alt1 = NEW.geometry_alt1,
			geometry_alt2 = NEW.geometry_alt2,
			update_geometry_alt1 = NEW.update_geometry_alt1,
			update_geometry_alt2 = NEW.update_geometry_alt2,
			identification = NEW.identification,
			fk_distributor = NEW.fk_distributor,
			fk_status = NEW.fk_status,
			fk_folder = NEW.fk_folder,
			fk_locationtype = NEW.fk_locationtype,
			fk_precision = NEW.fk_precision,
			fk_precisionalti = NEW.fk_precisionalti,
			fk_object_reference = NEW.fk_object_reference,
			altitude = NEW.altitude,
			year = NEW.year,
			year_end = NEW.year_end,
			orientation = NEW.orientation,
			remark = NEW.remark,
			schema_force_visible = NEW.schema_force_visible,
			label_1_visible = NEW.label_1_visible,
			label_1_x = NEW.label_1_x,
			label_1_y = NEW.label_1_y,
			label_1_rotation = NEW.label_1_rotation,
			label_1_text = NEW.label_1_text,
			label_2_visible = NEW.label_2_visible,
			label_2_x = NEW.label_2_x,
			label_2_y = NEW.label_2_y,
			label_2_rotation = NEW.label_2_rotation,
			label_2_text = NEW.label_2_text
		WHERE id = OLD.id;
	-- detect if type has changed
	IF OLD.element_type <> NEW.element_type::qwat_od.element_type THEN
		RAISE EXCEPTION 'Type change not allowed for element'
			USING HINT = 'You cannot switch from ' || OLD.element_type || ' to ' || NEW.element_type; 
	END IF;
	CASE
	WHEN NEW.element_type::qwat_od.element_type = 'subscriber'::qwat_od.element_type
		THEN UPDATE qwat_od.subscriber SET
			fk_subscriber_type = NEW.fk_subscriber_type
			, fk_pipe = NEW.fk_pipe
			, parcel = NEW.parcel
			, flow_current = NEW.flow_current
			, flow_planned = NEW.flow_planned
		WHERE id = OLD.id;
	WHEN NEW.element_type::qwat_od.element_type = 'part'::qwat_od.element_type
		THEN UPDATE qwat_od.part SET
			fk_part_type = NEW.fk_part_type
			, fk_pipe = qwat_od.fn_pipe_get_id(NEW.geometry)
		WHERE id = OLD.id;
	WHEN NEW.element_type::qwat_od.element_type = 'installation'::qwat_od.element_type
		THEN UPDATE qwat_od.vw_qwat_installation SET
			installation_type = NEW.installation_type
			, name = NEW.name
			, fk_parent = NEW.fk_parent
			, fk_remote = NEW.fk_remote
			, fk_watertype = NEW.fk_watertype
			, parcel = NEW.parcel
			, eca = NEW.eca
			, open_water_surface = NEW.open_water_surface
			, geometry_polygon = NEW.geometry_polygon
			, fk_source_type = NEW.fk_source_type
			, fk_source_quality = NEW.fk_source_quality
			, flow_lowest = NEW.flow_lowest
			, flow_average = NEW.flow_average
			, flow_concession = NEW.flow_concession
			, contract_end = NEW.contract_end
			, gathering_chamber = NEW.gathering_chamber
			, fk_pump_type = NEW.fk_pump_type
			, fk_pipe_in = NEW.fk_pipe_in
			, fk_pipe_out = NEW.fk_pipe_out
			, fk_pump_operating = NEW.fk_pump_operating
			, no_pumps = NEW.no_pumps
			, rejected_flow = NEW.rejected_flow
			, manometric_height = NEW.manometric_height
			, fk_overflow = NEW.fk_overflow
			, fk_tank_firestorage = NEW.fk_tank_firestorage
			, storage_total = NEW.storage_total
			, storage_supply = NEW.storage_supply
			, storage_fire = NEW.storage_fire
			, altitude_overflow = NEW.altitude_overflow
			, altitude_apron = NEW.altitude_apron
			, height_max = NEW.height_max
			, fire_valve = NEW.fire_valve
			, fire_remote = NEW.fire_remote
			, _litrepercm = NEW._litrepercm
			, cistern1_fk_type = NEW.cistern1_fk_type
			, cistern1_dimension_1 = NEW.cistern1_dimension_1
			, cistern1_dimension_2 = NEW.cistern1_dimension_2
			, cistern1_storage = NEW.cistern1_storage
			, _cistern1_litrepercm = NEW._cistern1_litrepercm
			, cistern2_fk_type = NEW.cistern2_fk_type
			, cistern2_dimension_1 = NEW.cistern2_dimension_1
			, cistern2_dimension_2 = NEW.cistern2_dimension_2
			, cistern2_storage = NEW.cistern2_storage
			, _cistern2_litrepercm = NEW._cistern2_litrepercm
			, sanitization_uv = NEW.sanitization_uv
			, sanitization_chlorine_liquid = NEW.sanitization_chlorine_liquid
			, sanitization_chlorine_gazeous = NEW.sanitization_chlorine_gazeous
			, sanitization_ozone = NEW.sanitization_ozone
			, filtration_membrane = NEW.filtration_membrane
			, filtration_sandorgravel = NEW.filtration_sandorgravel
			, flocculation = NEW.flocculation
			, activatedcharcoal = NEW.activatedcharcoal
			, settling = NEW.settling
			, treatment_capacity = NEW.treatment_capacity
			, networkseparation = NEW.networkseparation
			, flow_meter = NEW.flow_meter
			, water_meter = NEW.water_meter
			, manometer = NEW.manometer
			, depth = NEW.depth
			, no_valves = NEW.no_valves
			, fk_pressurecontrol_type = NEW.fk_pressurecontrol_type
		WHERE id = OLD.id;
	WHEN NEW.element_type::qwat_od.element_type = 'hydrant'::qwat_od.element_type
		THEN UPDATE qwat_od.hydrant SET
			fk_provider = NEW.fk_provider
			, fk_model_sup = NEW.fk_model_sup
			, fk_model_inf = NEW.fk_model_inf
			, fk_material = NEW.fk_material
			, fk_output = NEW.fk_output
			, underground = NEW.underground
			, marked = NEW.marked
			, pressure_static = NEW.pressure_static
			, pressure_dynamic = NEW.pressure_dynamic
			, flow = NEW.flow
			, observation_date = NEW.observation_date
			, observation_source = NEW.observation_source
		WHERE id = OLD.id;
	WHEN NEW.element_type::qwat_od.element_type = 'samplingpoint'::qwat_od.element_type
		THEN 
		NULL;
	WHEN NEW.element_type::qwat_od.element_type = 'valve'::qwat_od.element_type
		THEN UPDATE qwat_od.valve SET
			fk_valve_type = NEW.fk_valve_type
			, fk_valve_function = NEW.fk_valve_function
			, fk_valve_actuation = NEW.fk_valve_actuation
			, fk_pipe = qwat_od.fn_pipe_get_id(NEW.geometry)
			, fk_handle_precision = NEW.fk_handle_precision
			, fk_handle_precisionalti = NEW.fk_handle_precisionalti
			, fk_maintenance = NEW.fk_maintenance
			, diameter_nominal = NEW.diameter_nominal
			, closed = NEW.closed
			, networkseparation = NEW.networkseparation
			, handle_altitude = NEW.handle_altitude
			, handle_geometry = NEW.handle_geometry
		WHERE id = OLD.id;
	WHEN NEW.element_type::qwat_od.element_type = 'meter'::qwat_od.element_type
		THEN UPDATE qwat_od.meter SET
			fk_pipe = NEW.fk_pipe
			, parcel = NEW.parcel
		WHERE id = OLD.id;
	END CASE;

	RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"
	BEGIN
		NEW.controled = true;
		RETURN NEW;
	END;
"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"
	DECLARE
		node_ids integer[];
	BEGIN
		IF TG_OP = 'INSERT' THEN
			node_ids := ARRAY[NEW.fk_node_a, NEW.fk_node_b];
		ELSE
			-- delete or update (OLD exists)
			node_ids := ARRAY[OLD.fk_node_a, OLD.fk_node_b];
		END IF;
		IF TG_OP = 'UPDATE' THEN
			IF NEW.fk_node_a <> OLD.fk_node_a THEN
				node_ids := array_append(node_ids, OLD.fk_node_a);
			END IF;
			IF NEW.fk_node_b <> OLD.fk_node_b THEN
				node_ids := array_append(node_ids, OLD.fk_node_b);
			END IF;
		END IF;
		PERFORM qwat_od.fn_node_set_type( node_ids );
		RETURN NEW;
	END;
	"
"
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		-- TODO handle going to NULL on update 
		IF	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 OR
				NEW.altitude IS NOT NULL AND ( ST_Z(NEW.geometry) IS NULL OR ST_Z(NEW.geometry) <> NEW.altitude ) THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
		END IF;

		-- The function creates or gets a parent row.
		NEW.id := qwat_od.fn_node_create(NEW.geometry);
		-- If it previously existed with another subtype, it should raise an exception
		IF (SELECT _oid IS NOT NULL FROM 
			(
				SELECT id AS _oid FROM qwat_od.network_element
			) AS foo WHERE _oid = NEW.id
		) THEN
			RAISE EXCEPTION 'Cannot insert node as element since it already has another subtype. ID: %', NEW.id;
		END IF;

		INSERT INTO qwat_od.network_element (
			id
			, identification
			, fk_distributor
			, fk_status
			, fk_folder
			, fk_locationtype
			, fk_precision
			, fk_precisionalti
			, fk_object_reference
			, altitude
			, year
			, year_end
			, orientation
			, remark
			, schema_force_visible
			, label_1_visible
			, label_1_x
			, label_1_y
			, label_1_rotation
			, label_1_text
			, label_2_visible
			, label_2_x
			, label_2_y
			, label_2_rotation
			, label_2_text
		) VALUES (
			NEW.id 
			, NEW.identification
			, NEW.fk_distributor
			, NEW.fk_status
			, NEW.fk_folder
			, NEW.fk_locationtype
			, NEW.fk_precision
			, NEW.fk_precisionalti
			, NEW.fk_object_reference
			, NEW.altitude
			, NEW.year
			, NEW.year_end
			, NEW.orientation
			, NEW.remark
			, NEW.schema_force_visible
			, NEW.label_1_visible
			, NEW.label_1_x
			, NEW.label_1_y
			, NEW.label_1_rotation
			, NEW.label_1_text
			, NEW.label_2_visible
			, NEW.label_2_x
			, NEW.label_2_y
			, NEW.label_2_rotation
			, NEW.label_2_text
		);
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"
	BEGIN
		INSERT INTO qwat_od.installation (
			id
			, name
			, fk_parent
			, fk_remote
			, fk_watertype
			, parcel
			, eca
			, open_water_surface
			, geometry_polygon
		) VALUES (
			NEW.id 
			, NEW.name
			, NEW.fk_parent
			, NEW.fk_remote
			, NEW.fk_watertype
			, NEW.parcel
			, NEW.eca
			, NEW.open_water_surface
			, NEW.geometry_polygon
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.pressurecontrol (
			id
			, fk_pressurecontrol_type
		) VALUES (
			NEW.id 
			, NEW.fk_pressurecontrol_type
		);
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"
	BEGIN
		IF TG_OP = 'INSERT' OR ST_Equals(ST_StartPoint(NEW.geometry), ST_StartPoint(OLD.geometry)) IS FALSE THEN
			NEW.fk_node_a       := qwat_od.fn_node_create(ST_StartPoint(NEW.geometry), /* deactivate_node_add_pipe_vertex */ TRUE);
		END IF;
		IF TG_OP = 'INSERT' OR ST_Equals(ST_EndPoint(NEW.geometry), ST_EndPoint(OLD.geometry)) IS FALSE THEN
			NEW.fk_node_b       := qwat_od.fn_node_create(ST_EndPoint(NEW.geometry), /* deactivate_node_add_pipe_vertex */ TRUE);
		END IF;
		NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
		NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
		NEW.fk_printmap         := qwat_od.fn_get_printmap_id(NEW.geometry);
		NEW._printmaps          := qwat_od.fn_get_printmaps(NEW.geometry);
		NEW._length2d           := ST_Length(NEW.geometry);
		NEW._length3d           := ST_3DLength(NEW.geometry);
		NEW._diff_elevation     := @(ST_Z(ST_StartPoint(NEW.geometry))-ST_Z(ST_EndPoint(NEW.geometry)));
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"
	DECLARE
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.handle_altitude IS NULL THEN
			NEW.handle_altitude := NULLIF( ST_Z(NEW.handle_geometry), 0.0); -- 0 is the NULL value
		END IF;
		IF 	NEW.handle_altitude IS NULL     AND ST_Z(NEW.handle_geometry) <> 0.0 OR
			NEW.handle_altitude IS NOT NULL AND ( ST_Z(NEW.handle_geometry) IS NULL OR ST_Z(NEW.handle_geometry) <> NEW.handle_altitude ) THEN
				NEW.handle_geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.handle_geometry), ST_Y(NEW.handle_geometry), COALESCE(NEW.handle_altitude,0) ), ST_SRID(NEW.handle_geometry) );
		END IF;
		RETURN NEW;
	END;
"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"
	DECLARE
		node_ids integer[];
	BEGIN
		UPDATE qwat_od.pipe SET	fk_node_a = qwat_od.fn_node_create(ST_StartPoint(geometry)) WHERE fk_node_a = OLD.id;
		UPDATE qwat_od.pipe SET	fk_node_b = qwat_od.fn_node_create(ST_EndPoint(  geometry)) WHERE fk_node_b = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"
	BEGIN
		INSERT INTO qwat_od.vw_node_element (
			id
			, fk_district
			, fk_pressurezone
			, fk_printmap
			, _printmaps
			, _geometry_alt1_used
			, _geometry_alt2_used
			, _pipe_node_type
			, _pipe_orientation
			, _pipe_schema_visible
			, geometry
			, geometry_alt1
			, geometry_alt2
			, update_geometry_alt1
			, update_geometry_alt2
			, identification
			, fk_distributor
			, fk_status
			, fk_folder
			, fk_locationtype
			, fk_precision
			, fk_precisionalti
			, fk_object_reference
			, altitude
			, year
			, year_end
			, orientation
			, remark
			, schema_force_visible
			, label_1_visible
			, label_1_x
			, label_1_y
			, label_1_rotation
			, label_1_text
			, label_2_visible
			, label_2_x
			, label_2_y
			, label_2_rotation
			, label_2_text
		) VALUES (
			NEW.id 
			, NEW.fk_district
			, NEW.fk_pressurezone
			, NEW.fk_printmap
			, NEW._printmaps
			, NEW._geometry_alt1_used
			, NEW._geometry_alt2_used
			, NEW._pipe_node_type
			, NEW._pipe_orientation
			, NEW._pipe_schema_visible
			, NEW.geometry
			, NEW.geometry_alt1
			, NEW.geometry_alt2
			, NEW.update_geometry_alt1
			, NEW.update_geometry_alt2
			, NEW.identification
			, NEW.fk_distributor
			, NEW.fk_status
			, NEW.fk_folder
			, NEW.fk_locationtype
			, NEW.fk_precision
			, NEW.fk_precisionalti
			, NEW.fk_object_reference
			, NEW.altitude
			, NEW.year
			, NEW.year_end
			, NEW.orientation
			, NEW.remark
			, NEW.schema_force_visible
			, NEW.label_1_visible
			, NEW.label_1_x
			, NEW.label_1_y
			, NEW.label_1_rotation
			, NEW.label_1_text
			, NEW.label_2_visible
			, NEW.label_2_x
			, NEW.label_2_y
			, NEW.label_2_rotation
			, NEW.label_2_text
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.hydrant (
			id
			, fk_provider
			, fk_model_sup
			, fk_model_inf
			, fk_material
			, fk_output
			, underground
			, marked
			, pressure_static
			, pressure_dynamic
			, flow
			, observation_date
			, observation_source
		) VALUES (
			NEW.id 
			, NEW.fk_provider
			, NEW.fk_model_sup
			, NEW.fk_model_inf
			, NEW.fk_material
			, NEW.fk_output
			, NEW.underground
			, NEW.marked
			, NEW.pressure_static
			, NEW.pressure_dynamic
			, NEW.flow
			, NEW.observation_date
			, NEW.observation_source
		);
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"
	BEGIN
		INSERT INTO qwat_od.installation (
			id
			, name
			, fk_parent
			, fk_remote
			, fk_watertype
			, parcel
			, eca
			, open_water_surface
			, geometry_polygon
		) VALUES (
			NEW.id 
			, NEW.name
			, NEW.fk_parent
			, NEW.fk_remote
			, NEW.fk_watertype
			, NEW.parcel
			, NEW.eca
			, NEW.open_water_surface
			, NEW.geometry_polygon
		) RETURNING id INTO NEW.id;

	CASE
		WHEN NEW.installation_type::qwat_od.installation_type = 'source'::qwat_od.installation_type
			THEN INSERT INTO qwat_od.source (
				id 
				, fk_source_type
				, fk_source_quality
				, flow_lowest
				, flow_average
				, flow_concession
				, contract_end
				, gathering_chamber
			) VALUES (
				NEW.id
				, NEW.fk_source_type
				, NEW.fk_source_quality
				, NEW.flow_lowest
				, NEW.flow_average
				, NEW.flow_concession
				, NEW.contract_end
				, NEW.gathering_chamber
		);

		WHEN NEW.installation_type::qwat_od.installation_type = 'pump'::qwat_od.installation_type
			THEN INSERT INTO qwat_od.pump (
				id 
				, fk_pump_type
				, fk_pipe_in
				, fk_pipe_out
				, fk_pump_operating
				, no_pumps
				, rejected_flow
				, manometric_height
			) VALUES (
				NEW.id
				, NEW.fk_pump_type
				, NEW.fk_pipe_in
				, NEW.fk_pipe_out
				, NEW.fk_pump_operating
				, NEW.no_pumps
				, NEW.rejected_flow
				, NEW.manometric_height
		);

		WHEN NEW.installation_type::qwat_od.installation_type = 'tank'::qwat_od.installation_type
			THEN INSERT INTO qwat_od.tank (
				id 
				, fk_overflow
				, fk_tank_firestorage
				, storage_total
				, storage_supply
				, storage_fire
				, altitude_overflow
				, altitude_apron
				, height_max
				, fire_valve
				, fire_remote
				, _litrepercm
				, cistern1_fk_type
				, cistern1_dimension_1
				, cistern1_dimension_2
				, cistern1_storage
				, _cistern1_litrepercm
				, cistern2_fk_type
				, cistern2_dimension_1
				, cistern2_dimension_2
				, cistern2_storage
				, _cistern2_litrepercm
			) VALUES (
				NEW.id
				, NEW.fk_overflow
				, NEW.fk_tank_firestorage
				, NEW.storage_total
				, NEW.storage_supply
				, NEW.storage_fire
				, NEW.altitude_overflow
				, NEW.altitude_apron
				, NEW.height_max
				, NEW.fire_valve
				, NEW.fire_remote
				, NEW._litrepercm
				, NEW.cistern1_fk_type
				, NEW.cistern1_dimension_1
				, NEW.cistern1_dimension_2
				, NEW.cistern1_storage
				, NEW._cistern1_litrepercm
				, NEW.cistern2_fk_type
				, NEW.cistern2_dimension_1
				, NEW.cistern2_dimension_2
				, NEW.cistern2_storage
				, NEW._cistern2_litrepercm
		);

		WHEN NEW.installation_type::qwat_od.installation_type = 'treatment'::qwat_od.installation_type
			THEN INSERT INTO qwat_od.treatment (
				id 
				, sanitization_uv
				, sanitization_chlorine_liquid
				, sanitization_chlorine_gazeous
				, sanitization_ozone
				, filtration_membrane
				, filtration_sandorgravel
				, flocculation
				, activatedcharcoal
				, settling
				, treatment_capacity
			) VALUES (
				NEW.id
				, NEW.sanitization_uv
				, NEW.sanitization_chlorine_liquid
				, NEW.sanitization_chlorine_gazeous
				, NEW.sanitization_ozone
				, NEW.filtration_membrane
				, NEW.filtration_sandorgravel
				, NEW.flocculation
				, NEW.activatedcharcoal
				, NEW.settling
				, NEW.treatment_capacity
		);

		WHEN NEW.installation_type::qwat_od.installation_type = 'chamber'::qwat_od.installation_type
			THEN INSERT INTO qwat_od.chamber (
				id 
				, networkseparation
				, flow_meter
				, water_meter
				, manometer
				, depth
				, no_valves
			) VALUES (
				NEW.id
				, NEW.networkseparation
				, NEW.flow_meter
				, NEW.water_meter
				, NEW.manometer
				, NEW.depth
				, NEW.no_valves
		);

		WHEN NEW.installation_type::qwat_od.installation_type = 'pressurecontrol'::qwat_od.installation_type
			THEN INSERT INTO qwat_od.pressurecontrol (
				id 
				, fk_pressurecontrol_type
			) VALUES (
				NEW.id
				, NEW.fk_pressurecontrol_type
		);

	 END CASE;
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"
	BEGIN
	CASE
		WHEN OLD.element_type::qwat_od.element_type = 'subscriber'::qwat_od.element_type THEN
			DELETE FROM qwat_od.subscriber WHERE id = OLD.id;
		WHEN OLD.element_type::qwat_od.element_type = 'part'::qwat_od.element_type THEN
			DELETE FROM qwat_od.part WHERE id = OLD.id;
		WHEN OLD.element_type::qwat_od.element_type = 'installation'::qwat_od.element_type THEN
			DELETE FROM qwat_od.vw_qwat_installation WHERE id = OLD.id;
		WHEN OLD.element_type::qwat_od.element_type = 'hydrant'::qwat_od.element_type THEN
			DELETE FROM qwat_od.hydrant WHERE id = OLD.id;
		WHEN OLD.element_type::qwat_od.element_type = 'samplingpoint'::qwat_od.element_type THEN
			DELETE FROM qwat_od.samplingpoint WHERE id = OLD.id;
		WHEN OLD.element_type::qwat_od.element_type = 'valve'::qwat_od.element_type THEN
			DELETE FROM qwat_od.valve WHERE id = OLD.id;
		WHEN OLD.element_type::qwat_od.element_type = 'meter'::qwat_od.element_type THEN
			DELETE FROM qwat_od.meter WHERE id = OLD.id;
	END CASE;
	DELETE FROM qwat_od.vw_node_element WHERE id = OLD.id;
	RETURN NULL;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"
	BEGIN
		IF NEW.repair_date IS NULL THEN
			NEW._repaired := false;
		ELSE
			NEW._repaired := true;
		END IF;
		RETURN NEW;
	END;
"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"
	BEGIN
		NEW._geometry_alt1_used := NEW.geometry_alt1 IS NOT NULL AND ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := NEW.geometry_alt2 IS NOT NULL AND ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"
	BEGIN
		INSERT INTO qwat_od.vw_node_element (
			id
			, fk_district
			, fk_pressurezone
			, fk_printmap
			, _printmaps
			, _geometry_alt1_used
			, _geometry_alt2_used
			, _pipe_node_type
			, _pipe_orientation
			, _pipe_schema_visible
			, geometry
			, geometry_alt1
			, geometry_alt2
			, update_geometry_alt1
			, update_geometry_alt2
			, identification
			, fk_distributor
			, fk_status
			, fk_folder
			, fk_locationtype
			, fk_precision
			, fk_precisionalti
			, fk_object_reference
			, altitude
			, year
			, year_end
			, orientation
			, remark
			, schema_force_visible
			, label_1_visible
			, label_1_x
			, label_1_y
			, label_1_rotation
			, label_1_text
			, label_2_visible
			, label_2_x
			, label_2_y
			, label_2_rotation
			, label_2_text
		) VALUES (
			NEW.id 
			, NEW.fk_district
			, NEW.fk_pressurezone
			, NEW.fk_printmap
			, NEW._printmaps
			, NEW._geometry_alt1_used
			, NEW._geometry_alt2_used
			, NEW._pipe_node_type
			, NEW._pipe_orientation
			, NEW._pipe_schema_visible
			, NEW.geometry
			, NEW.geometry_alt1
			, NEW.geometry_alt2
			, NEW.update_geometry_alt1
			, NEW.update_geometry_alt2
			, NEW.identification
			, NEW.fk_distributor
			, NEW.fk_status
			, NEW.fk_folder
			, NEW.fk_locationtype
			, NEW.fk_precision
			, NEW.fk_precisionalti
			, NEW.fk_object_reference
			, NEW.altitude
			, NEW.year
			, NEW.year_end
			, NEW.orientation
			, NEW.remark
			, NEW.schema_force_visible
			, NEW.label_1_visible
			, NEW.label_1_x
			, NEW.label_1_y
			, NEW.label_1_rotation
			, NEW.label_1_text
			, NEW.label_2_visible
			, NEW.label_2_x
			, NEW.label_2_y
			, NEW.label_2_rotation
			, NEW.label_2_text
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.samplingpoint (
			id
			
		) VALUES (
			NEW.id 
		);
		RETURN NEW;
	END;
	"
"
	BEGIN
		IF NEW.geometry_alt1 IS NULL OR NEW.update_geometry_alt1 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt1 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt1) ) THEN
			NEW.geometry_alt1 := NEW.geometry;
		END IF;
		IF NEW.geometry_alt2 IS NULL OR NEW.update_geometry_alt2 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt2 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt2) ) THEN
			NEW.geometry_alt2 := NEW.geometry;
		END IF;
		NEW._geometry_alt1_used := ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW.update_geometry_alt1 := NULL; -- used to determine if alternative geometry 1 should be updated when main geometry is updated
		NEW.update_geometry_alt2 := NULL; -- used to determine if alternative geometry 2 should be updated when main geometry is updated
		RETURN NEW;
	END;
	"
"
	BEGIN
		INSERT INTO qwat_od.installation (
			id
			, name
			, fk_parent
			, fk_remote
			, fk_watertype
			, parcel
			, eca
			, open_water_surface
			, geometry_polygon
		) VALUES (
			NEW.id 
			, NEW.name
			, NEW.fk_parent
			, NEW.fk_remote
			, NEW.fk_watertype
			, NEW.parcel
			, NEW.eca
			, NEW.open_water_surface
			, NEW.geometry_polygon
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.source (
			id
			, fk_source_type
			, fk_source_quality
			, flow_lowest
			, flow_average
			, flow_concession
			, contract_end
			, gathering_chamber
		) VALUES (
			NEW.id 
			, NEW.fk_source_type
			, NEW.fk_source_quality
			, NEW.flow_lowest
			, NEW.flow_average
			, NEW.flow_concession
			, NEW.contract_end
			, NEW.gathering_chamber
		);
		RETURN NEW;
	END;
	"
"RI_FKey_check_upd"
"
	BEGIN
	UPDATE qwat_od.vw_node_element SET
			fk_district = NEW.fk_district,
			fk_pressurezone = NEW.fk_pressurezone,
			fk_printmap = NEW.fk_printmap,
			_printmaps = NEW._printmaps,
			_geometry_alt1_used = NEW._geometry_alt1_used,
			_geometry_alt2_used = NEW._geometry_alt2_used,
			_pipe_node_type = NEW._pipe_node_type,
			_pipe_orientation = NEW._pipe_orientation,
			_pipe_schema_visible = NEW._pipe_schema_visible,
			geometry = NEW.geometry,
			geometry_alt1 = NEW.geometry_alt1,
			geometry_alt2 = NEW.geometry_alt2,
			update_geometry_alt1 = NEW.update_geometry_alt1,
			update_geometry_alt2 = NEW.update_geometry_alt2,
			identification = NEW.identification,
			fk_distributor = NEW.fk_distributor,
			fk_status = NEW.fk_status,
			fk_folder = NEW.fk_folder,
			fk_locationtype = NEW.fk_locationtype,
			fk_precision = NEW.fk_precision,
			fk_precisionalti = NEW.fk_precisionalti,
			fk_object_reference = NEW.fk_object_reference,
			altitude = NEW.altitude,
			year = NEW.year,
			year_end = NEW.year_end,
			orientation = NEW.orientation,
			remark = NEW.remark,
			schema_force_visible = NEW.schema_force_visible,
			label_1_visible = NEW.label_1_visible,
			label_1_x = NEW.label_1_x,
			label_1_y = NEW.label_1_y,
			label_1_rotation = NEW.label_1_rotation,
			label_1_text = NEW.label_1_text,
			label_2_visible = NEW.label_2_visible,
			label_2_x = NEW.label_2_x,
			label_2_y = NEW.label_2_y,
			label_2_rotation = NEW.label_2_rotation,
			label_2_text = NEW.label_2_text
		WHERE id = OLD.id;

	UPDATE qwat_od.subscriber SET
			fk_subscriber_type = NEW.fk_subscriber_type,
			fk_pipe = NEW.fk_pipe,
			parcel = NEW.parcel,
			flow_current = NEW.flow_current,
			flow_planned = NEW.flow_planned
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"
	BEGIN
		INSERT INTO qwat_od.vw_node_element (
			id
			, fk_district
			, fk_pressurezone
			, fk_printmap
			, _printmaps
			, _geometry_alt1_used
			, _geometry_alt2_used
			, _pipe_node_type
			, _pipe_orientation
			, _pipe_schema_visible
			, geometry
			, geometry_alt1
			, geometry_alt2
			, update_geometry_alt1
			, update_geometry_alt2
			, identification
			, fk_distributor
			, fk_status
			, fk_folder
			, fk_locationtype
			, fk_precision
			, fk_precisionalti
			, fk_object_reference
			, altitude
			, year
			, year_end
			, orientation
			, remark
			, schema_force_visible
			, label_1_visible
			, label_1_x
			, label_1_y
			, label_1_rotation
			, label_1_text
			, label_2_visible
			, label_2_x
			, label_2_y
			, label_2_rotation
			, label_2_text
		) VALUES (
			NEW.id 
			, NEW.fk_district
			, NEW.fk_pressurezone
			, NEW.fk_printmap
			, NEW._printmaps
			, NEW._geometry_alt1_used
			, NEW._geometry_alt2_used
			, NEW._pipe_node_type
			, NEW._pipe_orientation
			, NEW._pipe_schema_visible
			, NEW.geometry
			, NEW.geometry_alt1
			, NEW.geometry_alt2
			, NEW.update_geometry_alt1
			, NEW.update_geometry_alt2
			, NEW.identification
			, NEW.fk_distributor
			, NEW.fk_status
			, NEW.fk_folder
			, NEW.fk_locationtype
			, NEW.fk_precision
			, NEW.fk_precisionalti
			, NEW.fk_object_reference
			, NEW.altitude
			, NEW.year
			, NEW.year_end
			, NEW.orientation
			, NEW.remark
			, NEW.schema_force_visible
			, NEW.label_1_visible
			, NEW.label_1_x
			, NEW.label_1_y
			, NEW.label_1_rotation
			, NEW.label_1_text
			, NEW.label_2_visible
			, NEW.label_2_x
			, NEW.label_2_y
			, NEW.label_2_rotation
			, NEW.label_2_text
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.subscriber (
			id
			, fk_subscriber_type
			, fk_pipe
			, parcel
			, flow_current
			, flow_planned
		) VALUES (
			NEW.id 
			, NEW.fk_subscriber_type
			, NEW.fk_pipe
			, NEW.parcel
			, NEW.flow_current
			, NEW.flow_planned
		);
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"
	BEGIN
		DELETE FROM qwat_od.valve WHERE id = OLD.id;
		DELETE FROM qwat_od.vw_node_element WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"RI_FKey_check_upd"
"
	BEGIN
		NEW.geometry            := ST_Force3D(NEW.geometry);
		NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
		NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
		NEW.fk_printmap         := qwat_od.fn_get_printmap_id(NEW.geometry);
		NEW._printmaps          := qwat_od.fn_get_printmaps(NEW.geometry);
		RETURN NEW;
	END;
"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"
	BEGIN
		DELETE FROM qwat_od.vw_qwat_installation WHERE id = OLD.id;
		DELETE FROM qwat_od.vw_node_element WHERE id = OLD.id;
		RETURN NULL;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"
	BEGIN
		INSERT INTO qwat_od.installation (
			id
			, name
			, fk_parent
			, fk_remote
			, fk_watertype
			, parcel
			, eca
			, open_water_surface
			, geometry_polygon
		) VALUES (
			NEW.id 
			, NEW.name
			, NEW.fk_parent
			, NEW.fk_remote
			, NEW.fk_watertype
			, NEW.parcel
			, NEW.eca
			, NEW.open_water_surface
			, NEW.geometry_polygon
		) RETURNING id INTO NEW.id;

		INSERT INTO qwat_od.pump (
			id
			, fk_pump_type
			, fk_pipe_in
			, fk_pipe_out
			, fk_pump_operating
			, no_pumps
			, rejected_flow
			, manometric_height
		) VALUES (
			NEW.id 
			, NEW.fk_pump_type
			, NEW.fk_pipe_in
			, NEW.fk_pipe_out
			, NEW.fk_pump_operating
			, NEW.no_pumps
			, NEW.rejected_flow
			, NEW.manometric_height
		);
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"
	BEGIN
		UPDATE qwat_od.vw_element_valve valve SET fk_pipe = qwat_od.fn_pipe_get_id(geometry) WHERE fk_pipe = OLD.id OR ST_Distance(geometry, NEW.geometry) < 1e-4;
		RETURN NEW;
	END;
"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"
	BEGIN
		NEW._cistern1_litrepercm := qwat_od.fn_litres_per_cm(NEW.cistern1_fk_type,NEW.cistern1_dimension_1,NEW.cistern1_dimension_2);
		NEW._cistern2_litrepercm := qwat_od.fn_litres_per_cm(NEW.cistern2_fk_type,NEW.cistern2_dimension_1,NEW.cistern2_dimension_2);
		NEW._litrepercm := COALESCE(NEW._cistern1_litrepercm,0)+COALESCE(NEW._cistern2_litrepercm,0);
		RETURN NEW;
	END;
"
"RI_FKey_noaction_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"
	BEGIN
		IF NEW.geometry_alt1 IS NULL OR NEW.update_geometry_alt1 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt1 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt1) ) THEN
			NEW.geometry_alt1 := NEW.geometry;
		END IF;
		IF NEW.geometry_alt2 IS NULL OR NEW.update_geometry_alt2 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt2 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt2) ) THEN
			NEW.geometry_alt2 := NEW.geometry;
		END IF;
		NEW._geometry_alt1_used := ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW.update_geometry_alt1 := NULL; -- used to determine if alternative geometry 1 should be updated when main geometry is updated
		NEW.update_geometry_alt2 := NULL; -- used to determine if alternative geometry 2 should be updated when main geometry is updated
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"
	BEGIN
	UPDATE qwat_od.installation SET
			name = NEW.name,
			fk_parent = NEW.fk_parent,
			fk_remote = NEW.fk_remote,
			fk_watertype = NEW.fk_watertype,
			parcel = NEW.parcel,
			eca = NEW.eca,
			open_water_surface = NEW.open_water_surface,
			geometry_polygon = NEW.geometry_polygon
		WHERE id = OLD.id;

	UPDATE qwat_od.source SET
			fk_source_type = NEW.fk_source_type,
			fk_source_quality = NEW.fk_source_quality,
			flow_lowest = NEW.flow_lowest,
			flow_average = NEW.flow_average,
			flow_concession = NEW.flow_concession,
			contract_end = NEW.contract_end,
			gathering_chamber = NEW.gathering_chamber
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"
	BEGIN
		NEW.geometry            := ST_Force3D(NEW.geometry);
		NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
		NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
		NEW.fk_printmap         := qwat_od.fn_get_printmap_id(NEW.geometry);
		NEW._printmaps          := qwat_od.fn_get_printmaps(NEW.geometry);
		RETURN NEW;
	END;
"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"
	BEGIN
	UPDATE qwat_od.installation SET
			name = NEW.name,
			fk_parent = NEW.fk_parent,
			fk_remote = NEW.fk_remote,
			fk_watertype = NEW.fk_watertype,
			parcel = NEW.parcel,
			eca = NEW.eca,
			open_water_surface = NEW.open_water_surface,
			geometry_polygon = NEW.geometry_polygon
		WHERE id = OLD.id;

	UPDATE qwat_od.chamber SET
			networkseparation = NEW.networkseparation,
			flow_meter = NEW.flow_meter,
			water_meter = NEW.water_meter,
			manometer = NEW.manometer,
			depth = NEW.depth,
			no_valves = NEW.no_valves
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"
	BEGIN
		NEW._geometry_alt1_used := NEW.geometry_alt1 IS NOT NULL AND ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := NEW.geometry_alt2 IS NOT NULL AND ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		RETURN NEW;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		IF 	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 OR
			NEW.altitude IS NOT NULL AND ( ST_Z(NEW.geometry) IS NULL OR ST_Z(NEW.geometry) <> NEW.altitude ) THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
		END IF;
		RETURN NEW;
	END;
"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_upd"
"
	BEGIN
	UPDATE qwat_od.vw_node_element SET
			fk_district = NEW.fk_district,
			fk_pressurezone = NEW.fk_pressurezone,
			fk_printmap = NEW.fk_printmap,
			_printmaps = NEW._printmaps,
			_geometry_alt1_used = NEW._geometry_alt1_used,
			_geometry_alt2_used = NEW._geometry_alt2_used,
			_pipe_node_type = NEW._pipe_node_type,
			_pipe_orientation = NEW._pipe_orientation,
			_pipe_schema_visible = NEW._pipe_schema_visible,
			geometry = NEW.geometry,
			geometry_alt1 = NEW.geometry_alt1,
			geometry_alt2 = NEW.geometry_alt2,
			update_geometry_alt1 = NEW.update_geometry_alt1,
			update_geometry_alt2 = NEW.update_geometry_alt2,
			identification = NEW.identification,
			fk_distributor = NEW.fk_distributor,
			fk_status = NEW.fk_status,
			fk_folder = NEW.fk_folder,
			fk_locationtype = NEW.fk_locationtype,
			fk_precision = NEW.fk_precision,
			fk_precisionalti = NEW.fk_precisionalti,
			fk_object_reference = NEW.fk_object_reference,
			altitude = NEW.altitude,
			year = NEW.year,
			year_end = NEW.year_end,
			orientation = NEW.orientation,
			remark = NEW.remark,
			schema_force_visible = NEW.schema_force_visible,
			label_1_visible = NEW.label_1_visible,
			label_1_x = NEW.label_1_x,
			label_1_y = NEW.label_1_y,
			label_1_rotation = NEW.label_1_rotation,
			label_1_text = NEW.label_1_text,
			label_2_visible = NEW.label_2_visible,
			label_2_x = NEW.label_2_x,
			label_2_y = NEW.label_2_y,
			label_2_rotation = NEW.label_2_rotation,
			label_2_text = NEW.label_2_text
		WHERE id = OLD.id;

	UPDATE qwat_od.hydrant SET
			fk_provider = NEW.fk_provider,
			fk_model_sup = NEW.fk_model_sup,
			fk_model_inf = NEW.fk_model_inf,
			fk_material = NEW.fk_material,
			fk_output = NEW.fk_output,
			underground = NEW.underground,
			marked = NEW.marked,
			pressure_static = NEW.pressure_static,
			pressure_dynamic = NEW.pressure_dynamic,
			flow = NEW.flow,
			observation_date = NEW.observation_date,
			observation_source = NEW.observation_source
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		IF 	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 OR
			NEW.altitude IS NOT NULL AND ( ST_Z(NEW.geometry) IS NULL OR ST_Z(NEW.geometry) <> NEW.altitude ) THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
		END IF;
		RETURN NEW;
	END;
"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_upd"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_noaction_upd"
"
	BEGIN
	UPDATE qwat_od.vw_node_element SET
			fk_district = NEW.fk_district,
			fk_pressurezone = NEW.fk_pressurezone,
			fk_printmap = NEW.fk_printmap,
			_printmaps = NEW._printmaps,
			_geometry_alt1_used = NEW._geometry_alt1_used,
			_geometry_alt2_used = NEW._geometry_alt2_used,
			_pipe_node_type = NEW._pipe_node_type,
			_pipe_orientation = NEW._pipe_orientation,
			_pipe_schema_visible = NEW._pipe_schema_visible,
			geometry = NEW.geometry,
			geometry_alt1 = NEW.geometry_alt1,
			geometry_alt2 = NEW.geometry_alt2,
			update_geometry_alt1 = NEW.update_geometry_alt1,
			update_geometry_alt2 = NEW.update_geometry_alt2,
			identification = NEW.identification,
			fk_distributor = NEW.fk_distributor,
			fk_status = NEW.fk_status,
			fk_folder = NEW.fk_folder,
			fk_locationtype = NEW.fk_locationtype,
			fk_precision = NEW.fk_precision,
			fk_precisionalti = NEW.fk_precisionalti,
			fk_object_reference = NEW.fk_object_reference,
			altitude = NEW.altitude,
			year = NEW.year,
			year_end = NEW.year_end,
			orientation = NEW.orientation,
			remark = NEW.remark,
			schema_force_visible = NEW.schema_force_visible,
			label_1_visible = NEW.label_1_visible,
			label_1_x = NEW.label_1_x,
			label_1_y = NEW.label_1_y,
			label_1_rotation = NEW.label_1_rotation,
			label_1_text = NEW.label_1_text,
			label_2_visible = NEW.label_2_visible,
			label_2_x = NEW.label_2_x,
			label_2_y = NEW.label_2_y,
			label_2_rotation = NEW.label_2_rotation,
			label_2_text = NEW.label_2_text
		WHERE id = OLD.id;

	UPDATE qwat_od.vw_qwat_installation SET
			installation_type = NEW.installation_type,
			name = NEW.name,
			fk_parent = NEW.fk_parent,
			fk_remote = NEW.fk_remote,
			fk_watertype = NEW.fk_watertype,
			parcel = NEW.parcel,
			eca = NEW.eca,
			open_water_surface = NEW.open_water_surface,
			geometry_polygon = NEW.geometry_polygon,
			fk_source_type = NEW.fk_source_type,
			fk_source_quality = NEW.fk_source_quality,
			flow_lowest = NEW.flow_lowest,
			flow_average = NEW.flow_average,
			flow_concession = NEW.flow_concession,
			contract_end = NEW.contract_end,
			gathering_chamber = NEW.gathering_chamber,
			fk_pump_type = NEW.fk_pump_type,
			fk_pipe_in = NEW.fk_pipe_in,
			fk_pipe_out = NEW.fk_pipe_out,
			fk_pump_operating = NEW.fk_pump_operating,
			no_pumps = NEW.no_pumps,
			rejected_flow = NEW.rejected_flow,
			manometric_height = NEW.manometric_height,
			fk_overflow = NEW.fk_overflow,
			fk_tank_firestorage = NEW.fk_tank_firestorage,
			storage_total = NEW.storage_total,
			storage_supply = NEW.storage_supply,
			storage_fire = NEW.storage_fire,
			altitude_overflow = NEW.altitude_overflow,
			altitude_apron = NEW.altitude_apron,
			height_max = NEW.height_max,
			fire_valve = NEW.fire_valve,
			fire_remote = NEW.fire_remote,
			_litrepercm = NEW._litrepercm,
			cistern1_fk_type = NEW.cistern1_fk_type,
			cistern1_dimension_1 = NEW.cistern1_dimension_1,
			cistern1_dimension_2 = NEW.cistern1_dimension_2,
			cistern1_storage = NEW.cistern1_storage,
			_cistern1_litrepercm = NEW._cistern1_litrepercm,
			cistern2_fk_type = NEW.cistern2_fk_type,
			cistern2_dimension_1 = NEW.cistern2_dimension_1,
			cistern2_dimension_2 = NEW.cistern2_dimension_2,
			cistern2_storage = NEW.cistern2_storage,
			_cistern2_litrepercm = NEW._cistern2_litrepercm,
			sanitization_uv = NEW.sanitization_uv,
			sanitization_chlorine_liquid = NEW.sanitization_chlorine_liquid,
			sanitization_chlorine_gazeous = NEW.sanitization_chlorine_gazeous,
			sanitization_ozone = NEW.sanitization_ozone,
			filtration_membrane = NEW.filtration_membrane,
			filtration_sandorgravel = NEW.filtration_sandorgravel,
			flocculation = NEW.flocculation,
			activatedcharcoal = NEW.activatedcharcoal,
			settling = NEW.settling,
			treatment_capacity = NEW.treatment_capacity,
			networkseparation = NEW.networkseparation,
			flow_meter = NEW.flow_meter,
			water_meter = NEW.water_meter,
			manometer = NEW.manometer,
			depth = NEW.depth,
			no_valves = NEW.no_valves,
			fk_pressurecontrol_type = NEW.fk_pressurecontrol_type
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_check_ins"
"RI_FKey_noaction_upd"
"RI_FKey_check_upd"
"
	BEGIN
	UPDATE qwat_od.vw_node_element SET
			fk_district = NEW.fk_district,
			fk_pressurezone = NEW.fk_pressurezone,
			fk_printmap = NEW.fk_printmap,
			_printmaps = NEW._printmaps,
			_geometry_alt1_used = NEW._geometry_alt1_used,
			_geometry_alt2_used = NEW._geometry_alt2_used,
			_pipe_node_type = NEW._pipe_node_type,
			_pipe_orientation = NEW._pipe_orientation,
			_pipe_schema_visible = NEW._pipe_schema_visible,
			geometry = NEW.geometry,
			geometry_alt1 = NEW.geometry_alt1,
			geometry_alt2 = NEW.geometry_alt2,
			update_geometry_alt1 = NEW.update_geometry_alt1,
			update_geometry_alt2 = NEW.update_geometry_alt2,
			identification = NEW.identification,
			fk_distributor = NEW.fk_distributor,
			fk_status = NEW.fk_status,
			fk_folder = NEW.fk_folder,
			fk_locationtype = NEW.fk_locationtype,
			fk_precision = NEW.fk_precision,
			fk_precisionalti = NEW.fk_precisionalti,
			fk_object_reference = NEW.fk_object_reference,
			altitude = NEW.altitude,
			year = NEW.year,
			year_end = NEW.year_end,
			orientation = NEW.orientation,
			remark = NEW.remark,
			schema_force_visible = NEW.schema_force_visible,
			label_1_visible = NEW.label_1_visible,
			label_1_x = NEW.label_1_x,
			label_1_y = NEW.label_1_y,
			label_1_rotation = NEW.label_1_rotation,
			label_1_text = NEW.label_1_text,
			label_2_visible = NEW.label_2_visible,
			label_2_x = NEW.label_2_x,
			label_2_y = NEW.label_2_y,
			label_2_rotation = NEW.label_2_rotation,
			label_2_text = NEW.label_2_text
		WHERE id = OLD.id;

	UPDATE qwat_od.valve SET
			fk_valve_type = NEW.fk_valve_type,
			fk_valve_function = NEW.fk_valve_function,
			fk_valve_actuation = NEW.fk_valve_actuation,
			fk_pipe = qwat_od.fn_pipe_get_id(NEW.geometry),
			fk_handle_precision = NEW.fk_handle_precision,
			fk_handle_precisionalti = NEW.fk_handle_precisionalti,
			fk_maintenance = NEW.fk_maintenance,
			diameter_nominal = NEW.diameter_nominal,
			closed = NEW.closed,
			networkseparation = NEW.networkseparation,
			handle_altitude = NEW.handle_altitude,
			handle_geometry = NEW.handle_geometry
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
"
"RI_FKey_noaction_upd"
"
	BEGIN
			-- add a vertex to the corresponding pipe if it intersects
			-- when the node is close enough to the pipe (< 1 micrometer) the node is considered to intersect the pipe
			-- it allows to deal with intersections that cannot be represented by floating point numbers
			UPDATE qwat_od.pipe SET geometry = ST_Snap(geometry, NEW.geometry, 1e-6) WHERE ST_Distance(geometry, NEW.geometry) < 1e-6;
		RETURN NEW;
	END;
"
"RI_FKey_noaction_upd"
"
	BEGIN
	UPDATE qwat_od.vw_node_element SET
			fk_district = NEW.fk_district,
			fk_pressurezone = NEW.fk_pressurezone,
			fk_printmap = NEW.fk_printmap,
			_printmaps = NEW._printmaps,
			_geometry_alt1_used = NEW._geometry_alt1_used,
			_geometry_alt2_used = NEW._geometry_alt2_used,
			_pipe_node_type = NEW._pipe_node_type,
			_pipe_orientation = NEW._pipe_orientation,
			_pipe_schema_visible = NEW._pipe_schema_visible,
			geometry = NEW.geometry,
			geometry_alt1 = NEW.geometry_alt1,
			geometry_alt2 = NEW.geometry_alt2,
			update_geometry_alt1 = NEW.update_geometry_alt1,
			update_geometry_alt2 = NEW.update_geometry_alt2,
			identification = NEW.identification,
			fk_distributor = NEW.fk_distributor,
			fk_status = NEW.fk_status,
			fk_folder = NEW.fk_folder,
			fk_locationtype = NEW.fk_locationtype,
			fk_precision = NEW.fk_precision,
			fk_precisionalti = NEW.fk_precisionalti,
			fk_object_reference = NEW.fk_object_reference,
			altitude = NEW.altitude,
			year = NEW.year,
			year_end = NEW.year_end,
			orientation = NEW.orientation,
			remark = NEW.remark,
			schema_force_visible = NEW.schema_force_visible,
			label_1_visible = NEW.label_1_visible,
			label_1_x = NEW.label_1_x,
			label_1_y = NEW.label_1_y,
			label_1_rotation = NEW.label_1_rotation,
			label_1_text = NEW.label_1_text,
			label_2_visible = NEW.label_2_visible,
			label_2_x = NEW.label_2_x,
			label_2_y = NEW.label_2_y,
			label_2_rotation = NEW.label_2_rotation,
			label_2_text = NEW.label_2_text
		WHERE id = OLD.id;

	UPDATE qwat_od.part SET
			fk_part_type = NEW.fk_part_type,
			fk_pipe = qwat_od.fn_pipe_get_id(NEW.geometry)
		WHERE id = OLD.id;
		RETURN NEW;
	END;
	"
"
	BEGIN
		IF NEW.geometry_alt1 IS NULL OR NEW.update_geometry_alt1 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt1 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt1) ) THEN
			NEW.geometry_alt1 := NEW.geometry;
		END IF;
		IF NEW.geometry_alt2 IS NULL OR NEW.update_geometry_alt2 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt2 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt2) ) THEN
			NEW.geometry_alt2 := NEW.geometry;
		END IF;
		NEW._geometry_alt1_used := ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW.update_geometry_alt1 := NULL; -- used to determine if alternative geometry 1 should be updated when main geometry is updated
		NEW.update_geometry_alt2 := NULL; -- used to determine if alternative geometry 2 should be updated when main geometry is updated
		RETURN NEW;
	END;
	"
"RI_FKey_noaction_del"
"
	BEGIN
		IF TG_OP <> 'INSERT' THEN
			EXECUTE format($$DROP FUNCTION IF EXISTS qwat_sys.fn_setting_%1$I();$$, OLD.name);
		END IF;
		IF TG_OP <> 'DELETE' THEN
			EXECUTE format($$
				CREATE FUNCTION qwat_sys.fn_setting_%1$I() RETURNS %2$s AS
					'SELECT value::%2$s from qwat_sys.settings where name = ''%1$I''' language sql
			$$, NEW.name, NEW.type::regtype );
		END	IF;
		RETURN NEW;
	END;
	"
"RI_FKey_check_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_upd"
"RI_FKey_noaction_upd"
"RI_FKey_noaction_del"
"RI_FKey_check_ins"
"audit_table","regclass","
SELECT qwat_sys.audit_table($1, BOOLEAN 't', BOOLEAN 't');
"
"audit_table","regclass","
DECLARE
  stm_targets text = 'INSERT OR UPDATE OR DELETE OR TRUNCATE';
  _q_txt text;
  _ignored_cols_snip text = '';
BEGIN
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_row ON ' || target_table::text;
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_stm ON ' || target_table::text;
 
    IF audit_rows THEN
        IF array_length(ignored_cols,1) > 0 THEN
            _ignored_cols_snip = ', ' || quote_literal(ignored_cols);
        END IF;
        _q_txt = 'CREATE TRIGGER audit_trigger_row AFTER INSERT OR UPDATE OR DELETE ON ' || 
                 target_table::text || 
                 ' FOR EACH ROW EXECUTE PROCEDURE qwat_sys.if_modified_func(' ||
                 quote_literal(audit_query_text) || _ignored_cols_snip || ');';
        RAISE NOTICE '%',_q_txt;
        EXECUTE _q_txt;
        stm_targets = 'TRUNCATE';
    ELSE
    END IF;
 
    _q_txt = 'CREATE TRIGGER audit_trigger_stm AFTER ' || stm_targets || ' ON ' ||
             target_table::text ||
             ' FOR EACH STATEMENT EXECUTE PROCEDURE qwat_sys.if_modified_func('||
             quote_literal(audit_query_text) || ');';
    RAISE NOTICE '%',_q_txt;
    EXECUTE _q_txt;
 
END;
"
"audit_table","regclass","
SELECT qwat_sys.audit_table($1, $2, $3, ARRAY[]::text[]);
"
"audit_table","boolean","
SELECT qwat_sys.audit_table($1, $2, $3, ARRAY[]::text[]);
"
"audit_table","boolean","
DECLARE
  stm_targets text = 'INSERT OR UPDATE OR DELETE OR TRUNCATE';
  _q_txt text;
  _ignored_cols_snip text = '';
BEGIN
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_row ON ' || target_table::text;
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_stm ON ' || target_table::text;
 
    IF audit_rows THEN
        IF array_length(ignored_cols,1) > 0 THEN
            _ignored_cols_snip = ', ' || quote_literal(ignored_cols);
        END IF;
        _q_txt = 'CREATE TRIGGER audit_trigger_row AFTER INSERT OR UPDATE OR DELETE ON ' || 
                 target_table::text || 
                 ' FOR EACH ROW EXECUTE PROCEDURE qwat_sys.if_modified_func(' ||
                 quote_literal(audit_query_text) || _ignored_cols_snip || ');';
        RAISE NOTICE '%',_q_txt;
        EXECUTE _q_txt;
        stm_targets = 'TRUNCATE';
    ELSE
    END IF;
 
    _q_txt = 'CREATE TRIGGER audit_trigger_stm AFTER ' || stm_targets || ' ON ' ||
             target_table::text ||
             ' FOR EACH STATEMENT EXECUTE PROCEDURE qwat_sys.if_modified_func('||
             quote_literal(audit_query_text) || ');';
    RAISE NOTICE '%',_q_txt;
    EXECUTE _q_txt;
 
END;
"
"audit_table","boolean","
DECLARE
  stm_targets text = 'INSERT OR UPDATE OR DELETE OR TRUNCATE';
  _q_txt text;
  _ignored_cols_snip text = '';
BEGIN
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_row ON ' || target_table::text;
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_stm ON ' || target_table::text;
 
    IF audit_rows THEN
        IF array_length(ignored_cols,1) > 0 THEN
            _ignored_cols_snip = ', ' || quote_literal(ignored_cols);
        END IF;
        _q_txt = 'CREATE TRIGGER audit_trigger_row AFTER INSERT OR UPDATE OR DELETE ON ' || 
                 target_table::text || 
                 ' FOR EACH ROW EXECUTE PROCEDURE qwat_sys.if_modified_func(' ||
                 quote_literal(audit_query_text) || _ignored_cols_snip || ');';
        RAISE NOTICE '%',_q_txt;
        EXECUTE _q_txt;
        stm_targets = 'TRUNCATE';
    ELSE
    END IF;
 
    _q_txt = 'CREATE TRIGGER audit_trigger_stm AFTER ' || stm_targets || ' ON ' ||
             target_table::text ||
             ' FOR EACH STATEMENT EXECUTE PROCEDURE qwat_sys.if_modified_func('||
             quote_literal(audit_query_text) || ');';
    RAISE NOTICE '%',_q_txt;
    EXECUTE _q_txt;
 
END;
"
"audit_table","boolean","
SELECT qwat_sys.audit_table($1, $2, $3, ARRAY[]::text[]);
"
"audit_table","ARRAY","
DECLARE
  stm_targets text = 'INSERT OR UPDATE OR DELETE OR TRUNCATE';
  _q_txt text;
  _ignored_cols_snip text = '';
BEGIN
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_row ON ' || target_table::text;
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_stm ON ' || target_table::text;
 
    IF audit_rows THEN
        IF array_length(ignored_cols,1) > 0 THEN
            _ignored_cols_snip = ', ' || quote_literal(ignored_cols);
        END IF;
        _q_txt = 'CREATE TRIGGER audit_trigger_row AFTER INSERT OR UPDATE OR DELETE ON ' || 
                 target_table::text || 
                 ' FOR EACH ROW EXECUTE PROCEDURE qwat_sys.if_modified_func(' ||
                 quote_literal(audit_query_text) || _ignored_cols_snip || ');';
        RAISE NOTICE '%',_q_txt;
        EXECUTE _q_txt;
        stm_targets = 'TRUNCATE';
    ELSE
    END IF;
 
    _q_txt = 'CREATE TRIGGER audit_trigger_stm AFTER ' || stm_targets || ' ON ' ||
             target_table::text ||
             ' FOR EACH STATEMENT EXECUTE PROCEDURE qwat_sys.if_modified_func('||
             quote_literal(audit_query_text) || ');';
    RAISE NOTICE '%',_q_txt;
    EXECUTE _q_txt;
 
END;
"
"fn_enable_schemaview","text","
	BEGIN
		/* Add columns */
		EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN schema_force_visible boolean default NULL;',
						_table_name);
		/* Constraint */
		EXECUTE format('ALTER TABLE qwat_od.%1$I ADD CONSTRAINT %2$I FOREIGN KEY (schema_force_visible) REFERENCES qwat_vl.visible(vl_code) MATCH FULL;
						CREATE INDEX %3$I ON qwat_od.%1$I(schema_force_visible);',
							_table_name, 
							_table_name||'_schema_force_visible',
							'fki_'||_table_name||'_schema_force_visible'
						);
	END;
"
"fn_get_district","USER-DEFINED","
	DECLARE
		geom ALIAS FOR $1;
		fk_district integer;
	BEGIN
		SELECT district.id INTO fk_district
			FROM  qwat_od.district
			WHERE ST_Intersects(geom,district.geometry) IS TRUE
			LIMIT 1;
		RETURN fk_district;
	END;
"
"fn_get_pressurezone","USER-DEFINED"," 
	DECLARE
		geom ALIAS FOR $1;
		fk_pressurezone integer;
	BEGIN
		SELECT pressurezone.id INTO fk_pressurezone
			FROM  qwat_od.pressurezone
			WHERE ST_Intersects(geom,pressurezone.geometry) IS TRUE
			ORDER BY ST_Length(ST_Intersection(geom,pressurezone.geometry)) DESC
			LIMIT 1;
		RETURN fk_pressurezone;
	END
"
"fn_get_printmap_id","USER-DEFINED","
	DECLARE
		geom ALIAS FOR $1;
	BEGIN
		RETURN ARRAY( SELECT printmap.id FROM  qwat_od.printmap WHERE ST_Intersects(geom,printmap.geometry) IS TRUE);
	END;
"
"fn_get_printmaps","USER-DEFINED","
	DECLARE
		geom ALIAS FOR $1;
		result text;
	BEGIN
		SELECT string_agg(printmap.name , ', ') INTO result
			FROM  qwat_od.printmap
			WHERE ST_Intersects(geom,printmap.geometry) IS TRUE;
		RETURN result;
	END;
"
"fn_label_create_fields","text","
BEGIN
    /* Creates columns */
   EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_1_visible smallint default 1', _tbl);

   IF _position THEN
       EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_1_x double precision default null
         , ADD COLUMN label_1_y double precision default null', _tbl);
   END IF;
   IF _rotation THEN
       EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_1_rotation double precision default null' , _tbl);
   END IF;

   EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_1_text varchar(120)    
         , ADD COLUMN label_2_visible  smallint default 1', _tbl);

   IF _position THEN
       EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_2_x double precision default null
         , ADD COLUMN label_2_y double precision default null', _tbl);
   END IF;
   IF _rotation THEN
       EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_2_rotation double precision default null', _tbl);
   END IF;

   EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_2_text varchar(120)', _tbl);

   /* Creates constraints */
   EXECUTE format('ALTER TABLE qwat_od.%1$I
           ADD CONSTRAINT %2$I FOREIGN KEY (label_1_visible) REFERENCES qwat_vl.visible(vl_code_int)
         , ADD CONSTRAINT %3$I FOREIGN KEY (label_2_visible) REFERENCES qwat_vl.visible(vl_code_int);
     CREATE INDEX %4$I ON qwat_od.%1$I(label_1_visible);
     CREATE INDEX %5$I ON qwat_od.%1$I(label_2_visible)'
   , _tbl
   , _tbl || '_label_1_visible'
   , _tbl || '_label_2_visible'
   , 'fki_' || _tbl || '_label_1_visible'
   , 'fki_' || _tbl || '_label_2_visible');
END
"
"fn_label_create_fields","boolean","
BEGIN
    /* Creates columns */
   EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_1_visible smallint default 1', _tbl);

   IF _position THEN
       EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_1_x double precision default null
         , ADD COLUMN label_1_y double precision default null', _tbl);
   END IF;
   IF _rotation THEN
       EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_1_rotation double precision default null' , _tbl);
   END IF;

   EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_1_text varchar(120)    
         , ADD COLUMN label_2_visible  smallint default 1', _tbl);

   IF _position THEN
       EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_2_x double precision default null
         , ADD COLUMN label_2_y double precision default null', _tbl);
   END IF;
   IF _rotation THEN
       EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_2_rotation double precision default null', _tbl);
   END IF;

   EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_2_text varchar(120)', _tbl);

   /* Creates constraints */
   EXECUTE format('ALTER TABLE qwat_od.%1$I
           ADD CONSTRAINT %2$I FOREIGN KEY (label_1_visible) REFERENCES qwat_vl.visible(vl_code_int)
         , ADD CONSTRAINT %3$I FOREIGN KEY (label_2_visible) REFERENCES qwat_vl.visible(vl_code_int);
     CREATE INDEX %4$I ON qwat_od.%1$I(label_1_visible);
     CREATE INDEX %5$I ON qwat_od.%1$I(label_2_visible)'
   , _tbl
   , _tbl || '_label_1_visible'
   , _tbl || '_label_2_visible'
   , 'fki_' || _tbl || '_label_1_visible'
   , 'fki_' || _tbl || '_label_2_visible');
END
"
"fn_label_create_fields","boolean","
BEGIN
    /* Creates columns */
   EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_1_visible smallint default 1', _tbl);

   IF _position THEN
       EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_1_x double precision default null
         , ADD COLUMN label_1_y double precision default null', _tbl);
   END IF;
   IF _rotation THEN
       EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_1_rotation double precision default null' , _tbl);
   END IF;

   EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_1_text varchar(120)    
         , ADD COLUMN label_2_visible  smallint default 1', _tbl);

   IF _position THEN
       EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_2_x double precision default null
         , ADD COLUMN label_2_y double precision default null', _tbl);
   END IF;
   IF _rotation THEN
       EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_2_rotation double precision default null', _tbl);
   END IF;

   EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_2_text varchar(120)', _tbl);

   /* Creates constraints */
   EXECUTE format('ALTER TABLE qwat_od.%1$I
           ADD CONSTRAINT %2$I FOREIGN KEY (label_1_visible) REFERENCES qwat_vl.visible(vl_code_int)
         , ADD CONSTRAINT %3$I FOREIGN KEY (label_2_visible) REFERENCES qwat_vl.visible(vl_code_int);
     CREATE INDEX %4$I ON qwat_od.%1$I(label_1_visible);
     CREATE INDEX %5$I ON qwat_od.%1$I(label_2_visible)'
   , _tbl
   , _tbl || '_label_1_visible'
   , _tbl || '_label_2_visible'
   , 'fki_' || _tbl || '_label_1_visible'
   , 'fki_' || _tbl || '_label_2_visible');
END
"
"fn_litres_per_cm","integer","
	BEGIN
		IF fk_type = 1 THEN
			return pi()*(dim1/2)^2*10;
		ELSEIF fk_type = 2 THEN
			return dim2*dim2*10;
		ELSE
			return NULL;
		END IF;
	END
"
"fn_litres_per_cm","double precision","
	BEGIN
		IF fk_type = 1 THEN
			return pi()*(dim1/2)^2*10;
		ELSEIF fk_type = 2 THEN
			return dim2*dim2*10;
		ELSE
			return NULL;
		END IF;
	END
"
"fn_litres_per_cm","double precision","
	BEGIN
		IF fk_type = 1 THEN
			return pi()*(dim1/2)^2*10;
		ELSEIF fk_type = 2 THEN
			return dim2*dim2*10;
		ELSE
			return NULL;
		END IF;
	END
"
"fn_node_create","USER-DEFINED","
	DECLARE
		_node_id integer;
	BEGIN
		SELECT id FROM qwat_od.node WHERE ST_Equals(ST_Force2d(_point), ST_Force2d(node.geometry)) IS TRUE LIMIT 1 INTO _node_id;
		IF _node_id IS NULL THEN
                        IF deactivate_node_add_pipe_vertex THEN
                           -- if we are called from a pipe creation, do not try to add a vertex on the pipe
                           ALTER TABLE qwat_od.node DISABLE TRIGGER tr_node_add_pipe_vertex_insert;
                        END IF;
			INSERT INTO qwat_od.node (geometry) VALUES (ST_Force3D(_point)) RETURNING id INTO _node_id;
                        IF deactivate_node_add_pipe_vertex THEN
                           ALTER TABLE qwat_od.node ENABLE TRIGGER tr_node_add_pipe_vertex_insert;
                        END IF;
			IF _node_id IS NULL THEN
				RAISE EXCEPTION 'Node is null although it should have been created';
			END IF;
		END IF;
		RETURN _node_id;
	END;
"
"fn_node_create","boolean","
	DECLARE
		_node_id integer;
	BEGIN
		SELECT id FROM qwat_od.node WHERE ST_Equals(ST_Force2d(_point), ST_Force2d(node.geometry)) IS TRUE LIMIT 1 INTO _node_id;
		IF _node_id IS NULL THEN
                        IF deactivate_node_add_pipe_vertex THEN
                           -- if we are called from a pipe creation, do not try to add a vertex on the pipe
                           ALTER TABLE qwat_od.node DISABLE TRIGGER tr_node_add_pipe_vertex_insert;
                        END IF;
			INSERT INTO qwat_od.node (geometry) VALUES (ST_Force3D(_point)) RETURNING id INTO _node_id;
                        IF deactivate_node_add_pipe_vertex THEN
                           ALTER TABLE qwat_od.node ENABLE TRIGGER tr_node_add_pipe_vertex_insert;
                        END IF;
			IF _node_id IS NULL THEN
				RAISE EXCEPTION 'Node is null although it should have been created';
			END IF;
		END IF;
		RETURN _node_id;
	END;
"
"fn_node_get_ids","USER-DEFINED","
	DECLARE
		node_ids integer[];
	BEGIN
		IF extent IS NULL THEN
			SELECT ARRAY( SELECT id FROM qwat_od.node ) INTO node_ids;
		ELSE
			SELECT ARRAY( SELECT id FROM qwat_od.node WHERE node.geometry && extent ) INTO node_ids;
		END IF;
		RETURN node_ids;
	END;
"
"fn_node_set_type","integer","
	DECLARE
		_pipeitem     record;
		_pipe_id      integer;
		_grouped      record;
		_year         integer;
		_material     varchar(50);
		_diameter     smallint;
		_looppos      integer          := 0;
		_type         qwat_od.pipe_connection;
		_orientation  double precision := 0;
		_orientation2 double precision := 0;
		_node_geom    geometry;
		_pipe_geom    geometry;
		_sub_geom     geometry;
		_lin_ref      float;
	BEGIN

		-- get the geoemetry
		_node_geom := geometry FROM qwat_od.node WHERE id = _node_id;

		-- count the active pipes associated to this node
		SELECT
				COUNT(pipe.id) AS count,
				bool_or(coalesce(schema_force_visible,pipe_function.schema_visible)) AS schema_visible
			INTO _grouped
			FROM qwat_od.pipe
				INNER JOIN qwat_vl.status ON pipe.fk_status = status.id
				INNER JOIN qwat_vl.pipe_function ON pipe.fk_function = pipe_function.id
			WHERE (fk_node_a = _node_id OR fk_node_b = _node_id)
				AND status.active IS TRUE;

		-- if not connected to any pipe, delete the node if it is not something else (i.e. is not inherited)
		IF _grouped.count = 0 THEN
			-- check it is not associated to any pipe (including inactive ones)
			IF _node_id NOT IN (SELECT fk_node_a FROM qwat_od.pipe UNION SELECT fk_node_b FROM qwat_od.pipe) THEN
				-- if it is not something else
				IF ( SELECT node_type = 'node'::qwat_od.node_type FROM qwat_od.vw_qwat_node WHERE id = _node_id) THEN
					-- delete it
					RAISE NOTICE 'Delete node %' , _node_id;
					DELETE FROM qwat_od.node WHERE id = _node_id; -- delete on table level for safety (do not delete on the merge view)
					RETURN;
				-- otherwise this means the node is node at the end of a pipe, it must be on a vertex
				ELSE
					-- calculate the orientation on that vertex
					_pipe_geom := geometry 
									FROM qwat_od.pipe 
									WHERE ST_Intersects(pipe.geometry, _node_geom) 
									ORDER BY (
										_node_geom IN (
											ST_StartPoint(pipe.geometry),
											ST_EndPoint(pipe.geometry))
										)::integer ASC -- prefer a pipe which doesn't end on the valve
									LIMIT 1;
					
					IF _pipe_geom IS NULL THEN
						RAISE NOTICE 'Network element of type % with ID % is not located on a pipe!'
							, element_type FROM qwat_od.vw_qwat_network_element WHERE id = _node_id
							, _node_id ;
					ELSE
						_lin_ref := ST_LineLocatePoint(_pipe_geom,_node_geom); -- shouldn't be 0 or 1 as it would mean that the node is a pipe end

						_sub_geom := ST_LineSubstring( _pipe_geom, 0, _lin_ref);
						_orientation  := pi()/2 - ST_Azimuth( 	ST_PointN(_sub_geom, ST_NumPoints(_sub_geom)-1),
																ST_EndPoint(_sub_geom) );
						_sub_geom := ST_LineSubstring( _pipe_geom, _lin_ref, 1);
						_orientation2 := pi()/2 - ST_Azimuth( 	ST_PointN(_sub_geom, 2),
																ST_StartPoint(_sub_geom) );
						_orientation2 := pi() + _orientation2; -- reverse angle
						-- RAISE NOTICE 'pipe 1 %', degrees( _orientation );
						-- RAISE NOTICE 'pipe 2 %', degrees( _orientation2 );
						_orientation := ATAN2( (SIN(_orientation)+SIN(_orientation2))/2 , (COS(_orientation)+COS(_orientation2))/2 );
						-- RAISE NOTICE 'mean %', degrees( _orientation );
					END IF;
				END IF;
			ELSE
				_type := NULL::qwat_od.pipe_connection;
			END IF;
		-- if 1 or 2 pipes associated
		ELSEIF _grouped.count <= 2 THEN
			/* loop over them, and take the 2 first/last vertices
			 of the pipe to determine orientation (used for symbology) */
			FOR _pipeitem IN (
				SELECT 	pipe.id, pipe.year, pipe_material.value_fr AS material, pipe_material.diameter_nominal AS diameter,
						ST_StartPoint(geometry) AS point_1,
						ST_PointN(geometry,2)   AS point_2
						FROM qwat_od.pipe
						INNER JOIN qwat_vl.pipe_material ON pipe.fk_material = pipe_material.id
						INNER JOIN qwat_vl.status        ON pipe.fk_status = status.id
						WHERE fk_node_a = _node_id AND status.active IS TRUE
				UNION ALL
				SELECT	pipe.id, pipe.year, pipe_material.value_fr AS material, pipe_material.diameter_nominal AS diameter,
						ST_EndPoint(geometry)                      AS point_1,
						ST_PointN(geometry,ST_NPoints(geometry)-1) AS point_2
						FROM qwat_od.pipe
						INNER JOIN qwat_vl.pipe_material ON pipe.fk_material = pipe_material.id
						INNER JOIN qwat_vl.status        ON pipe.fk_status = status.id
						WHERE fk_node_b = _node_id AND status.active IS TRUE
			) LOOP
				IF _looppos=0 THEN
					-- first pipe
					_type := 'pipe_end'::qwat_od.pipe_connection;
					_year     := _pipeitem.year;
					_material := _pipeitem.material;
					_diameter := _pipeitem.diameter;
					_pipe_id   := _pipeitem.id;
					_looppos   := 1;
					_orientation := pi()/2 - ST_Azimuth(_pipeitem.point_2,_pipeitem.point_1);
					-- RAISE NOTICE 'pipe % %', _pipe_id, degrees( _orientation );
				ELSE
					-- second pipe if exists
					IF _material = _pipeitem.material AND _diameter = _pipeitem.diameter AND _year = _pipeitem.year THEN
						_type := 'couple_same'::qwat_od.pipe_connection;
					ELSIF _material = _pipeitem.material AND _diameter = _pipeitem.diameter THEN
						_type := 'couple_year'::qwat_od.pipe_connection;
					ELSIF _material = _pipeitem.material THEN
						_type := 'couple_diameter'::qwat_od.pipe_connection;
					ELSIF _diameter = _pipeitem.diameter THEN
						_type := 'couple_material'::qwat_od.pipe_connection;
					ELSE
						_type := 'couple_other';
					END IF;
					_orientation2 := pi()/2 - ST_Azimuth(_pipeitem.point_2,_pipeitem.point_1);
					_orientation2 := pi() + _orientation2; -- reverse angle
					-- RAISE NOTICE 'pipe % %', _pipeitem.id, degrees( _orientation2 );
					_orientation := ATAN2( (SIN(_orientation)+SIN(_orientation2))/2 , (COS(_orientation)+COS(_orientation2))/2 );
					-- RAISE NOTICE 'mean:  %', degrees(_orientation  );
					-- reverse arrow according to diameter reduction
					IF _pipeitem.diameter > _diameter THEN
						_orientation := _orientation + pi();
					END IF;
				END IF;
			END LOOP;
		-- more than 2 pipes connected, nothing to calculate
		ELSEIF _grouped.count > 2 THEN
			_type := 'T'::qwat_od.pipe_connection;
		END IF;

		-- update the node table
		UPDATE qwat_od.node SET
			_pipe_node_type      = _type,
			_pipe_orientation    = degrees(_orientation),
			_pipe_schema_visible = _grouped.schema_visible
			WHERE id = _node_id;
		--RAISE NOTICE '% %' , _node_id , degrees(_orientation);
	END;
"
"fn_node_set_type","ARRAY","
	DECLARE
		node record;
		_node_id integer;
	BEGIN
		IF _node_ids IS NULL THEN
			FOR node IN (SELECT id FROM qwat_od.node ORDER BY id) LOOP
				PERFORM qwat_od.fn_node_set_type(node.id);
			END LOOP;
		ELSE
			FOREACH _node_id IN ARRAY _node_ids LOOP
				PERFORM qwat_od.fn_node_set_type(_node_id);
			END LOOP;
		END IF;
	END;
"
"fn_pipe_get_id","USER-DEFINED","
	DECLARE
		_pipe_id integer := NULL;
	BEGIN
		_pipe_id := pipe.id FROM qwat_od.pipe 
			JOIN qwat_vl.status ON fk_status = status.id
			WHERE ST_Intersects(ST_Force2d(_geometry),ST_Force2d(pipe.geometry)) 
			ORDER BY status.active::integer DESC
			LIMIT 1;
		RETURN _pipe_id;
	END;
"
"fn_pipe_update_valve","integer","
	BEGIN
		UPDATE qwat_od.pipe
			SET
				_valve_count  = valve_group.vcount,
				_valve_closed = valve_group.vclosed
			FROM qwat_od.pipe pipe_dupp
			INNER JOIN (
				SELECT fk_pipe, count(id) AS vcount, bool_or(closed) AS vclosed
				FROM qwat_od.valve
				WHERE fk_pipe = _pipe_id
				GROUP BY fk_pipe
				) AS valve_group
			ON pipe_dupp.id = valve_group.fk_pipe
			WHERE pipe.id = _pipe_id;
	END;
"
"fn_update_pipe_crossing","boolean","
	DECLARE
		_crossing record;
		_pipe1 record;
		_pipe2 record;
		_crossing_id integer;
		_updated_crossing integer[] := ARRAY[]::integer[];
		_inserted_crossing_count integer := 0;
		_updated_crossing_count integer := 0;
		_deleted_crossing_count integer := 0;
	BEGIN
/* * * * * * * * * * * * * * * * * * * * * * * * */
		/* compute all crossing points */
		FOR _crossing IN
			SELECT pipe1_id, pipe2_id,
				pipe1_geometry, pipe2_geometry,
				(dp).geom AS cross_geometry
			FROM
			(
				/* dump mulitpoints to points */
				SELECT pipe1_id, pipe2_id,
					pipe1_geometry, pipe2_geometry,
					ST_DumpPoints(cross_geometry) AS dp FROM
				(
					/* compute the crossing points only for active pipes and different ids */
					SELECT p1.id AS pipe1_id,
						p2.id AS pipe2_id,
						p1.geometry AS pipe1_geometry,
						p2.geometry AS pipe2_geometry,
						ST_Intersection(p1.geometry,p2.geometry) AS cross_geometry
					FROM qwat_od.pipe p1, qwat_od.pipe p2
					WHERE p1.id < p2.id
					AND p1.fk_status = 1301
					AND p2.fk_status = 1301
					AND ST_Crosses(p1.geometry,p2.geometry)
				) AS foo
			 ) AS foo2
		LOOP
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* SKIP INTERSECTION AT ENDS OF PIPE (occurs if the two pipes cross at another point) */
			IF _crossing.cross_geometry IN (ST_StartPoint(_crossing.pipe1_geometry), ST_EndPoint(_crossing.pipe1_geometry),
						ST_StartPoint(_crossing.pipe2_geometry), ST_EndPoint(_crossing.pipe2_geometry)) THEN
				CONTINUE;
			END IF;
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* !!!! PIPE 1 !!!! */
			/* perform azimuth for all segments of the pipes with the corresponding linear referencing */
			WITH azimuth AS
			(
				SELECT 	id AS pipe_id,
					n AS pt_index,
					ST_LineLocatePoint( geometry, ST_PointN( geometry, n) ) AS pt_locat,
					( 90 + degrees( ST_Azimuth( ST_PointN( geometry, n), ST_PointN( geometry, n+1 ) ) ) )::integer % 360 AS azimuth
				FROM qwat_od.pipe, generate_series(1, ST_NumPoints(geometry)-1) n
				WHERE pipe.id = _crossing.pipe1_id
			),
			/* find the correct segment according to linear referencing of the crossing point */
			pt_locat AS
			(
				SELECT MAX(pt_locat) AS pt_locat
				FROM azimuth
				WHERE pt_locat < ST_LineLocatePoint( _crossing.pipe1_geometry, _crossing.cross_geometry )
			)
			/* get the corresponding azimuth according to segment id (pt_locat) */
			SELECT azimuth
			INTO _pipe1
			FROM azimuth
			JOIN pt_locat USING (pt_locat);

/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* !!!! PIPE 2 !!!! */
			/* perform azimuth for all segments of the pipes with the corresponding linear referencing */
			WITH azimuth AS
			(
				SELECT 	id AS pipe_id,
					n AS pt_index,
					ST_LineLocatePoint( geometry, ST_PointN( geometry, n) ) AS pt_locat,
					( 90 + degrees( ST_Azimuth( ST_PointN( geometry, n), ST_PointN( geometry, n+1 ) ) ) )::integer % 360 AS azimuth
				FROM qwat_od.pipe, generate_series(1, ST_NumPoints(geometry)-1) n
				WHERE pipe.id = _crossing.pipe2_id
			),
			/* find the correct segment according to linear referencing of the crossing point */
			pt_locat AS
			(
				SELECT MAX(pt_locat) AS pt_locat
				FROM azimuth
				WHERE pt_locat < ST_LineLocatePoint( _crossing.pipe2_geometry, _crossing.cross_geometry )
			)
			/* get the corresponding azimuth according to segment id (pt_locat) */
			SELECT azimuth
			INTO _pipe2
			FROM azimuth
			JOIN pt_locat USING (pt_locat);

/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* ERROR REPORTING */
			IF _pipe1.azimuth IS NULL THEN
				RAISE NOTICE '*******';
				RAISE NOTICE 'POINT: %', ST_AsText(_crossing.cross_geometry);
				RAISE NOTICE 'PIPE: %', _crossing.pipe1_id;
				RAISE NOTICE 'LINE: %', ST_AsText(_crossing.pipe1_geometry);
			END IF;
			IF _pipe2.azimuth IS NULL THEN
				RAISE NOTICE '*******';
				RAISE NOTICE 'POINT: %', ST_AsText(_crossing.cross_geometry);
				RAISE NOTICE 'PIPE: %', _crossing.pipe2_id;
				RAISE NOTICE 'LINE: %', ST_AsText(_crossing.pipe2_geometry);
			END IF;
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* UPDATE OR INSERT NEW CROSSING */
			SELECT id FROM qwat_od.crossing WHERE ST_Equals(_crossing.cross_geometry,geometry) IS TRUE LIMIT 1 INTO _crossing_id;
			IF _crossing_id IS NULL THEN
				INSERT INTO qwat_od.crossing
						(         _pipe1_id,          _pipe2_id, _pipe1_angle,     _pipe2_angle,                 geometry )
					VALUES
						(_crossing.pipe1_id, _crossing.pipe2_id, _pipe1.azimuth, _pipe2.azimuth, ST_Force2d(_crossing.cross_geometry) )
					RETURNING id INTO _crossing_id;
				_inserted_crossing_count := _inserted_crossing_count + 1;
			ELSIF update_existing IS TRUE THEN
				UPDATE qwat_od.crossing
				SET
					_pipe1_id     = _crossing.pipe1_id,
					_pipe1_angle  = _pipe1.azimuth,
					_pipe2_id     = _crossing.pipe2_id,
					_pipe2_angle  = _pipe2.azimuth,
					geometry      = ST_Force2d(_crossing.cross_geometry)
				WHERE crossing.id = _crossing_id;
				_updated_crossing_count := _updated_crossing_count + 1;
			END IF;
			_updated_crossing := array_append(_updated_crossing, _crossing_id);
		END LOOP;
/* * * * * * * * * * * * * * * * * * * * * * * * */
		/* DELETE OLD CROSSINGS */
		IF delete_unused IS TRUE THEN
			DELETE FROM qwat_od.crossing WHERE NOT ( id = ANY(_updated_crossing) );
			GET DIAGNOSTICS _deleted_crossing_count = ROW_COUNT;
		END IF;
		RAISE NOTICE '';
		RAISE NOTICE '* * * * * * * * * * * * * * * * *';
		RAISE NOTICE '';
		RAISE NOTICE 'Added % new crossing.', _inserted_crossing_count;
		RAISE NOTICE 'Updated % existing crossing.', _updated_crossing_count;
		RAISE NOTICE 'Deleted % unused crossing.', _deleted_crossing_count;
		RAISE NOTICE '';
		RAISE NOTICE '* * * * * * * * * * * * * * * * *';
		RAISE NOTICE '';
	END;
"
"fn_update_pipe_crossing","boolean","
	DECLARE
		_crossing record;
		_pipe1 record;
		_pipe2 record;
		_crossing_id integer;
		_updated_crossing integer[] := ARRAY[]::integer[];
		_inserted_crossing_count integer := 0;
		_updated_crossing_count integer := 0;
		_deleted_crossing_count integer := 0;
	BEGIN
/* * * * * * * * * * * * * * * * * * * * * * * * */
		/* compute all crossing points */
		FOR _crossing IN
			SELECT pipe1_id, pipe2_id,
				pipe1_geometry, pipe2_geometry,
				(dp).geom AS cross_geometry
			FROM
			(
				/* dump mulitpoints to points */
				SELECT pipe1_id, pipe2_id,
					pipe1_geometry, pipe2_geometry,
					ST_DumpPoints(cross_geometry) AS dp FROM
				(
					/* compute the crossing points only for active pipes and different ids */
					SELECT p1.id AS pipe1_id,
						p2.id AS pipe2_id,
						p1.geometry AS pipe1_geometry,
						p2.geometry AS pipe2_geometry,
						ST_Intersection(p1.geometry,p2.geometry) AS cross_geometry
					FROM qwat_od.pipe p1, qwat_od.pipe p2
					WHERE p1.id < p2.id
					AND p1.fk_status = 1301
					AND p2.fk_status = 1301
					AND ST_Crosses(p1.geometry,p2.geometry)
				) AS foo
			 ) AS foo2
		LOOP
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* SKIP INTERSECTION AT ENDS OF PIPE (occurs if the two pipes cross at another point) */
			IF _crossing.cross_geometry IN (ST_StartPoint(_crossing.pipe1_geometry), ST_EndPoint(_crossing.pipe1_geometry),
						ST_StartPoint(_crossing.pipe2_geometry), ST_EndPoint(_crossing.pipe2_geometry)) THEN
				CONTINUE;
			END IF;
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* !!!! PIPE 1 !!!! */
			/* perform azimuth for all segments of the pipes with the corresponding linear referencing */
			WITH azimuth AS
			(
				SELECT 	id AS pipe_id,
					n AS pt_index,
					ST_LineLocatePoint( geometry, ST_PointN( geometry, n) ) AS pt_locat,
					( 90 + degrees( ST_Azimuth( ST_PointN( geometry, n), ST_PointN( geometry, n+1 ) ) ) )::integer % 360 AS azimuth
				FROM qwat_od.pipe, generate_series(1, ST_NumPoints(geometry)-1) n
				WHERE pipe.id = _crossing.pipe1_id
			),
			/* find the correct segment according to linear referencing of the crossing point */
			pt_locat AS
			(
				SELECT MAX(pt_locat) AS pt_locat
				FROM azimuth
				WHERE pt_locat < ST_LineLocatePoint( _crossing.pipe1_geometry, _crossing.cross_geometry )
			)
			/* get the corresponding azimuth according to segment id (pt_locat) */
			SELECT azimuth
			INTO _pipe1
			FROM azimuth
			JOIN pt_locat USING (pt_locat);

/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* !!!! PIPE 2 !!!! */
			/* perform azimuth for all segments of the pipes with the corresponding linear referencing */
			WITH azimuth AS
			(
				SELECT 	id AS pipe_id,
					n AS pt_index,
					ST_LineLocatePoint( geometry, ST_PointN( geometry, n) ) AS pt_locat,
					( 90 + degrees( ST_Azimuth( ST_PointN( geometry, n), ST_PointN( geometry, n+1 ) ) ) )::integer % 360 AS azimuth
				FROM qwat_od.pipe, generate_series(1, ST_NumPoints(geometry)-1) n
				WHERE pipe.id = _crossing.pipe2_id
			),
			/* find the correct segment according to linear referencing of the crossing point */
			pt_locat AS
			(
				SELECT MAX(pt_locat) AS pt_locat
				FROM azimuth
				WHERE pt_locat < ST_LineLocatePoint( _crossing.pipe2_geometry, _crossing.cross_geometry )
			)
			/* get the corresponding azimuth according to segment id (pt_locat) */
			SELECT azimuth
			INTO _pipe2
			FROM azimuth
			JOIN pt_locat USING (pt_locat);

/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* ERROR REPORTING */
			IF _pipe1.azimuth IS NULL THEN
				RAISE NOTICE '*******';
				RAISE NOTICE 'POINT: %', ST_AsText(_crossing.cross_geometry);
				RAISE NOTICE 'PIPE: %', _crossing.pipe1_id;
				RAISE NOTICE 'LINE: %', ST_AsText(_crossing.pipe1_geometry);
			END IF;
			IF _pipe2.azimuth IS NULL THEN
				RAISE NOTICE '*******';
				RAISE NOTICE 'POINT: %', ST_AsText(_crossing.cross_geometry);
				RAISE NOTICE 'PIPE: %', _crossing.pipe2_id;
				RAISE NOTICE 'LINE: %', ST_AsText(_crossing.pipe2_geometry);
			END IF;
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* UPDATE OR INSERT NEW CROSSING */
			SELECT id FROM qwat_od.crossing WHERE ST_Equals(_crossing.cross_geometry,geometry) IS TRUE LIMIT 1 INTO _crossing_id;
			IF _crossing_id IS NULL THEN
				INSERT INTO qwat_od.crossing
						(         _pipe1_id,          _pipe2_id, _pipe1_angle,     _pipe2_angle,                 geometry )
					VALUES
						(_crossing.pipe1_id, _crossing.pipe2_id, _pipe1.azimuth, _pipe2.azimuth, ST_Force2d(_crossing.cross_geometry) )
					RETURNING id INTO _crossing_id;
				_inserted_crossing_count := _inserted_crossing_count + 1;
			ELSIF update_existing IS TRUE THEN
				UPDATE qwat_od.crossing
				SET
					_pipe1_id     = _crossing.pipe1_id,
					_pipe1_angle  = _pipe1.azimuth,
					_pipe2_id     = _crossing.pipe2_id,
					_pipe2_angle  = _pipe2.azimuth,
					geometry      = ST_Force2d(_crossing.cross_geometry)
				WHERE crossing.id = _crossing_id;
				_updated_crossing_count := _updated_crossing_count + 1;
			END IF;
			_updated_crossing := array_append(_updated_crossing, _crossing_id);
		END LOOP;
/* * * * * * * * * * * * * * * * * * * * * * * * */
		/* DELETE OLD CROSSINGS */
		IF delete_unused IS TRUE THEN
			DELETE FROM qwat_od.crossing WHERE NOT ( id = ANY(_updated_crossing) );
			GET DIAGNOSTICS _deleted_crossing_count = ROW_COUNT;
		END IF;
		RAISE NOTICE '';
		RAISE NOTICE '* * * * * * * * * * * * * * * * *';
		RAISE NOTICE '';
		RAISE NOTICE 'Added % new crossing.', _inserted_crossing_count;
		RAISE NOTICE 'Updated % existing crossing.', _updated_crossing_count;
		RAISE NOTICE 'Deleted % unused crossing.', _deleted_crossing_count;
		RAISE NOTICE '';
		RAISE NOTICE '* * * * * * * * * * * * * * * * *';
		RAISE NOTICE '';
	END;
"
"version_dump","character varying","
select
    a[1], a[2]::int, a[3]::int, a[4]::int, a[5], a[6]
from
    regexp_matches(version, '^v?((\d+)\.(\d+)\.(\d+))(?:-([\dA-Za-z\-]+(?:\.[\dA-Za-z\-]+)*))?(?:\+([\dA-Za-z\-]+(?:\.[\dA-Za-z\-]+)*))?$') as a
"
"qwat_od","pipe","DELETE"
"qwat_od","vw_installation_tank","SELECT"
"qwat_od","vw_installation_treatment","SELECT"
"qwat_od","vw_installation_chamber","SELECT"
"qwat_od","vw_pipe_schema_visibleitems","DELETE"
"qwat_od","vw_pipe_schema_visibleitems","UPDATE"
"qwat_od","vw_pipe_schema_visibleitems","SELECT"
"qwat_od","vw_pipe_schema_merged","SELECT"
"qwat_od","vw_pipe_schema","UPDATE"
"qwat_od","vw_pipe_schema","SELECT"
"qwat_od","vw_pipe_schema_error","SELECT"
"qwat_od","vw_installation_source","SELECT"
"qwat_od","vw_installation_pump","SELECT"
"qwat_od","vw_installation_pressurecontrol","SELECT"
"qwat_od","vw_qwat_installation","SELECT"
"qwat_od","vw_remote","SELECT"
"qwat_od","vw_element_meter","SELECT"
"qwat_od","vw_node_element","SELECT"
"qwat_od","vw_pipe","SELECT"
"qwat_od","vw_qwat_node","SELECT"
"qwat_od","vw_leak","SELECT"
"qwat_od","vw_consumptionzone","DELETE"
"qwat_od","vw_consumptionzone","UPDATE"
"qwat_od","vw_consumptionzone","INSERT"
"qwat_od","vw_consumptionzone","SELECT"
"qwat_od","vw_element_subscriber","SELECT"
"qwat_od","vw_printmap","SELECT"
"qwat_od","vw_element_part","SELECT"
"qwat_od","vw_protectionzone","SELECT"
"qwat_od","vw_export_installation","SELECT"
"qwat_od","vw_element_installation","SELECT"
"qwat_od","vw_export_valve","SELECT"
"qwat_od","vw_element_hydrant","SELECT"
"qwat_od","vw_export_hydrant","SELECT"
"qwat_od","vw_export_meter","SELECT"
"qwat_od","vw_element_samplingpoint","SELECT"
"qwat_od","vw_export_part","SELECT"
"qwat_od","vw_element_valve","SELECT"
"qwat_od","vw_export_subscriber","SELECT"
"qwat_od","vw_qwat_network_element","SELECT"
"qwat_od","vw_search_view","SELECT"
"qwat_od","vw_subscriber_pipe_relation","SELECT"
"qwat_od","vw_valve_lines","SELECT"
"qwat_od","vw_pipe_child_parent","SELECT"
