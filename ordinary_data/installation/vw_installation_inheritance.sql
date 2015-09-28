



SELECT qwat_sys.fn_inherited_table_view(
	'{
		"installation": {
			"table_name":"qwat_od.installation",
			"pkey": "id",
			"pkey_nextval":"nextval(''qwat_od.installation_id_seq'')",
			"inherited_by": {
				"chamber": {
					"table_name":"qwat_od.chamber",
					"pkey": "id"
				},
				"pressurecontrol": {
					"table_name":"qwat_od.pressurecontrol",
					"pkey": "id"
				},
				"pump": {
					"table_name":"qwat_od.pump",
					"pkey": "id"
				},
				"source": {
					"table_name":"qwat_od.source",
					"pkey": "id"
				},
				"tank": {
					"table_name":"qwat_od.tank",
					"pkey": "id"
				},
				"treatment": {
					"table_name":"qwat_od.treatment",
					"pkey": "id"
				}
			},
			"merge_view": {
				"view_name":"vw_qwat_installation",
				"destination_schema": "qwat_od",
				"allow_type_change": false
			}
		}	
	}'::json
);





