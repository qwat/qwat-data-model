
-- DROP FUNCTION qwat_od.ft_element_installation_delete();

CREATE OR REPLACE FUNCTION qwat_od.ft_element_installation_delete()
  RETURNS trigger AS
$BODY$
	BEGIN





	CASE
		WHEN OLD.installation_type::qwat_od.installation_type = 'chamber'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.chamber WHERE id = OLD.id;
		WHEN OLD.installation_type::qwat_od.installation_type = 'pressurecontrol'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.pressurecontrol WHERE id = OLD.id;
		WHEN OLD.installation_type::qwat_od.installation_type = 'pump'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.pump WHERE id = OLD.id;
		WHEN OLD.installation_type::qwat_od.installation_type = 'source'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.source WHERE id = OLD.id;
		WHEN OLD.installation_type::qwat_od.installation_type = 'tank'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.tank WHERE id = OLD.id;
		WHEN OLD.installation_type::qwat_od.installation_type = 'treatment'::qwat_od.installation_type THEN
			DELETE FROM qwat_od.treatment WHERE id = OLD.id;
		ELSE NULL;
	END CASE;
	DELETE FROM qwat_od.installation WHERE id = OLD.id;

		DELETE FROM qwat_od.network_element WHERE id = OLD.id;

		PERFORM qwat_od.fn_node_set_type(OLD.id);

		RETURN NULL;
	END;
	$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

- Function: qwat_od.ft_element_installation_update()

-- DROP FUNCTION qwat_od.ft_element_installation_update();

CREATE OR REPLACE FUNCTION qwat_od.ft_element_installation_update()
  RETURNS trigger AS
$BODY$
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

		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		-- TODO handle going to NULL on update
		IF	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 OR
				NEW.altitude IS NOT NULL AND ( ST_Z(NEW.geometry) IS NULL OR ST_Z(NEW.geometry) <> NEW.altitude ) THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
		END IF;


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
		-- delete old sub type
		CASE
			WHEN OLD.installation_type::qwat_od.installation_type = 'chamber'::qwat_od.installation_type
				THEN DELETE FROM qwat_od.chamber WHERE id = OLD.id;
			WHEN OLD.installation_type::qwat_od.installation_type = 'pressurecontrol'::qwat_od.installation_type
				THEN DELETE FROM qwat_od.pressurecontrol WHERE id = OLD.id;
			WHEN OLD.installation_type::qwat_od.installation_type = 'pump'::qwat_od.installation_type
				THEN DELETE FROM qwat_od.pump WHERE id = OLD.id;
			WHEN OLD.installation_type::qwat_od.installation_type = 'source'::qwat_od.installation_type
				THEN DELETE FROM qwat_od.source WHERE id = OLD.id;
			WHEN OLD.installation_type::qwat_od.installation_type = 'tank'::qwat_od.installation_type
				THEN DELETE FROM qwat_od.tank WHERE id = OLD.id;
			WHEN OLD.installation_type::qwat_od.installation_type = 'treatment'::qwat_od.installation_type
				THEN DELETE FROM qwat_od.treatment WHERE id = OLD.id;
			ELSE NULL;
		END CASE;
		-- insert new sub type
		CASE
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
						OLD.id
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
						OLD.id
						, NEW.fk_pressurecontrol_type
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
						OLD.id
						, NEW.fk_pump_type
						, NEW.fk_pipe_in
						, NEW.fk_pipe_out
						, NEW.fk_pump_operating
						, NEW.no_pumps
						, NEW.rejected_flow
						, NEW.manometric_height
					);
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
						OLD.id
						, NEW.fk_source_type
						, NEW.fk_source_quality
						, NEW.flow_lowest
						, NEW.flow_average
						, NEW.flow_concession
						, NEW.contract_end
						, NEW.gathering_chamber
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
						OLD.id
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
						OLD.id
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
			ELSE NULL;
		END CASE;
		-- return now as child has been updated
		RETURN NEW;
	END IF;
	CASE
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
	ELSE NULL;
	END CASE;





		RETURN NEW;
	END;
	$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
