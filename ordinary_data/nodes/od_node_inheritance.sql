/*
	qWat - QGIS Water Module

	SQL file :: node inheritance

	This file creates the view that allow editing all node inherited tables

*/

SELECT qwat_sys.fn_inherited_table_view(
	'{
		"node": {
			"table_name":"qwat_od.node",
			"pkey": "id",
			"pkey_value": "qwat_od.fn_node_create(NEW.geometry)",
			"pkey_value_create_entry": true,
			"destination_schema": "qwat_od",
			"alter": {
				"geometry": {"read":"ST_Force2D", "write": "ST_Force3D"},
				"geometry_alt1": {"read":"ST_Force2D", "write": "ST_Force3D"},
				"geometry_alt2": {"read":"ST_Force2D", "write": "ST_Force3D"}
				},
			"inherited_by": {
				"element": {
					"table_name":"qwat_od.network_element",
					"pkey": "id",
					"custom_parent_delete": "PERFORM qwat_od.fn_node_set_type(OLD.id);"
				}
			},
			"merge_view": {
				"view_name":"vw_qwat_node",
				"allow_type_change": false,
				"allow_parent_only": true
			}
		}
	}'::json
);



SELECT qwat_sys.fn_inherited_table_view(
	'{
		"element": {
			"table_name":"qwat_od.vw_node_element",
			"pkey": "id",
			"pkey_value": "NEW.id",
			"destination_schema": "qwat_od",
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
				"part": {
					"table_name":"qwat_od.part",
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
				}
			},
			"merge_view": {
				"view_name":"vw_qwat_network_element",
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
					},
					"fk_pipe": {
						"meter": "fk_pipe",
						"part": "fk_pipe",
						"subscriber": "fk_pipe",
						"valve": "fk_pipe"
					}
				}
			}
		}
	}'::json
);
