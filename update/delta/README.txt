Copy here your delta.
Files must respect the following format :

    delta_x.x.x_xxxx_ddmmyyyy.sql

x.x.x is the semantic version number. The _xxxx allows to order delta files for a same version number. So it's a technical versioning in a way. 


If you have to provide a post-delta file (SQL to be executed after the view are generated), name your file  according to the following format :

    delta_x.x.x_xxxx_ddmmyyyy.sql.post

The delta_x.x.x_xxxx_ddmmyyyy part MUST be in correspondance with a delta file named delta_x.x.x_ddmmyyyy.sql

