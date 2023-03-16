ALTER TABLE qwat_sys.upgrades DROP CONSTRAINT upgrades_pk;
ALTER TABLE qwat_sys.upgrades ADD CONSTRAINT upgrades_pkey PRIMARY KEY(id);

/* Drop the fkey constraints dependant on the qwat_od.distributor pkey*/
ALTER TABLE qwat_od.pressurezone DROP CONSTRAINT pressurezone_fk_distributor;
ALTER TABLE qwat_od.network_element DROP CONSTRAINT element_fk_distributor;
ALTER TABLE qwat_od.pipe DROP CONSTRAINT pipe_fk_distributor;
ALTER TABLE qwat_od.valve DROP CONSTRAINT valve_fk_distributor;
ALTER TABLE qwat_od.remote DROP CONSTRAINT remote_fk_distributor;

/* Do the renaming of the qwat_od.distributor pkey*/
ALTER TABLE qwat_od.distributor DROP CONSTRAINT distributor_pk;
ALTER TABLE qwat_od.distributor ADD CONSTRAINT distributor_pkey PRIMARY KEY(id);

/* Recreate the dropped fkeys*/
ALTER TABLE qwat_od.pressurezone
    ADD CONSTRAINT pressurezone_fk_distributor FOREIGN KEY (fk_distributor)
    REFERENCES qwat_od.distributor (id) MATCH FULL;
ALTER TABLE qwat_od.network_element
    ADD CONSTRAINT element_fk_distributor FOREIGN KEY (fk_distributor)
    REFERENCES qwat_od.distributor (id) MATCH FULL;
ALTER TABLE qwat_od.pipe
    ADD CONSTRAINT pipe_fk_distributor FOREIGN KEY (fk_distributor)
    REFERENCES qwat_od.distributor (id) MATCH FULL;
ALTER TABLE qwat_od.valve
    ADD CONSTRAINT valve_fk_distributor FOREIGN KEY (fk_distributor)
    REFERENCES qwat_od.distributor (id) MATCH FULL;
ALTER TABLE qwat_od.remote
    ADD CONSTRAINT remote_fk_distributor FOREIGN KEY (fk_distributor)
    REFERENCES qwat_od.distributor (id) MATCH FULL;

ALTER TABLE qwat_od.protectionzone DROP CONSTRAINT protectionzone_pk;
ALTER TABLE qwat_od.protectionzone ADD CONSTRAINT protectionzone_pkey PRIMARY KEY(id);
