/* qwat - Demo data organisation for sia405 control cable and protection tube*/

INSERT INTO qwat_od.organisation (
	obj_id,
	identifier,
	identifier_short,
	municipality_number,
	organisation_type,
	remark,
	status,
	uid,
	last_modification,
	fk_dataowner,
	fk_provider
	) 
VALUES (
	'ch20p3q400002114',
	'Service intercommunal de gestion SIGE',
	'SIGE',
	NULL,
	8608,
	NULL,
	9047,
	'CHE108954487',
	'20240906',
	NULL,
	NULL
	);

INSERT INTO qwat_od.organisation (
	obj_id,
	identifier,
	identifier_short,
	municipality_number,
	organisation_type,
	remark,
	status,
	uid,
	last_modification,
	fk_dataowner,
	fk_provider
	) 
VALUES (
	'ch20p3q400000107',
	'unbekannt',
	'inconnu',
	NULL,
	8606, -- Privat
	'Für alle Objekte mit unklarer Zuständigkeit',
	9047,
	'CHE108954487',
	'20211116',
	NULL,
	NULL
	);



