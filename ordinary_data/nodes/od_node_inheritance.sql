



ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_pipe FOREIGN KEY (fk_pipe) REFERENCES qwat_od.pipe(id) MATCH FULL; CREATE INDEX fki_node_fk_pipe  ON qwat_od.node(fk_pipe);


SELECT qwat_sys.fn_inherited_table_view(
	'{
		"node": {
			"table_name":"qwat_od.node",
			"pkey": "id",
			"pkey_value": "qwat_od.fn_node_create(NEW.geometry)",
			"pkey_value_create_entry": true,
			"inherited_by": {
				"installation": {
					"table_name":"qwat_od.vw_qwat_installation",
					"pkey": "id"
				},
				"valve": {
					"table_name":"qwat_od.valve",
					"pkey": "id"
				},
				"hydrant": {
					"table_name":"qwat_od.hydrant",
					"pkey": "id"
				},
				"element": {
					"table_name":"qwat_od.element",
					"pkey": "id"
				},
				"meter": {
					"table_name":"qwat_od.meter",
					"pkey": "id"
				},
				"subscriber": {
					"table_name":"qwat_od.subscriber",
					"pkey": "id"
				},
				"cover": {
					"table_name":"qwat_od.cover",
					"pkey": "id"
				},
				"samplingpoint": {
					"table_name":"qwat_od.samplingpoint",
					"pkey": "id"
				},
				"surveypoint": {
					"table_name":"qwat_od.surveypoint",
					"pkey": "id"
				}
			},
			"merge_view": {
				"view_name":"vw_qwat_node",
				"destination_schema": "qwat_od",
				"allow_type_change": false,
				"allow_parent_only": true,
				"merge_columns": {
					"parcel": {
						"meter": "parcel",
						"subscriber": "parcel",
						"installation": "parcel"
					},
					"networkseparation": {
						"valve": "networkseparation",
						"installation": "networkseparation"
					}
				}
			}
		}	
	}'::json
);
