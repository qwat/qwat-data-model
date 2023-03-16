/* Complete hydrant_output ro values */

UPDATE qwat_vl.hydrant_output SET value_ro = '1x75' WHERE id = 7401;
UPDATE qwat_vl.hydrant_output SET value_ro = '2x75' WHERE id = 7402;
UPDATE qwat_vl.hydrant_output SET value_ro = '3x75' WHERE id = 7403;
UPDATE qwat_vl.hydrant_output SET value_ro = '2x55' WHERE id = 7404;
UPDATE qwat_vl.hydrant_output SET value_ro = '1x55_1x75' WHERE id = 7405;
UPDATE qwat_vl.hydrant_output SET value_ro = '2x55_1x75' WHERE id = 7406;
UPDATE qwat_vl.hydrant_output SET value_ro = '2x55_1x100' WHERE id = 7407;


/* Complete hydrant model inf/sup with ro values */

UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'Hawle' WHERE id = 7201;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'Hawle_H4' WHERE id = 7202;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'Hinni' WHERE id = 7203;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'Hinni_6000' WHERE id = 7204;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'Hinni_6006' WHERE id = 7205;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll' WHERE id = 7206;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_4105_Mod_1896' WHERE id = 7207;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_4107_Mod_1935' WHERE id = 7208;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_7500_Mod_1955' WHERE id = 7209;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_7502_Mod_1970' WHERE id = 7210;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_Hy_clasic_Serie_5500' WHERE id = 7211;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_Hy_plus_Serie_5700' WHERE id = 7212;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_Hy_5000s_Serie_5400_Cobra' WHERE id = 7213;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_Hy_deco_Mod_1896_Nostalgie' WHERE id = 7214;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_Hytec_5601' WHERE id = 7215;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_Hytec_5602' WHERE id = 7216;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_Hytec_5603' WHERE id = 7217;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_Hytec_5607' WHERE id = 7218;
UPDATE qwat_vl.hydrant_model_sup SET value_ro = 'VonRoll_5000_Mod_1989' WHERE id = 7219;

UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'Hawle' WHERE id = 7301;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'Hawle_H4' WHERE id = 7302;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'Hinni' WHERE id = 7303;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'Hinni_Standard' WHERE id = 7304;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'Hinri_închidere_dublă' WHERE id = 7305;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll' WHERE id = 7306;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll_4105_Mod_1896' WHERE id = 7307;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll_4107_Mod_1935' WHERE id = 7308;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRolI_7500' WHERE id = 7309;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll_5500' WHERE id = 7310;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll_fix' WHERE id = 7311;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonFloll_reglabil' WHERE id = 7312;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll_vario' WHERE id = 7313;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll_ufFix' WHERE id = 7314;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll_variabil' WHERE id = 7315;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll_1955' WHERE id = 7316;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll_1989_5000' WHERE id = 7317;
UPDATE qwat_vl.hydrant_model_inf SET value_ro = 'VonRoll_2007_5000' WHERE id = 7318;

/* Add comments on the hydrant model inf/sup tables */

COMMENT ON TABLE qwat_vl.hydrant_model_sup IS 'Holds the values for the above ground hydrant models';

COMMENT ON TABLE qwat_vl.hydrant_model_sup IS 'Holds the values for the underground hydrant models';
