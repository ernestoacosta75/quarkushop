# WHAT IS DATABASE VERSIONING?

Versioning a database means **sharing all changes of a database that are necessary for the application to run properly**. Database 
versioning **starts with an initial database schema and optionally with some data**. When there are database changes in a new release 
of the application, we ship a new patch file to perform changes on an existing database instead of starting from scratch with an 
updated dump, so when deploying the new version, the application will run properly. A patch file describes how to transform an 
existing database into a new state and how to revert it in order to get back to the old state.

### V1.0__Init_app.sql

The initial skeleton creation script that contains the SQL queries to create the tables and their constraints that we defined in the 
source code, such as primary keys, foreign keys between entities, and non￾nullable columns. This Flyway script will also bring the 
Hibernate SQL sequence needed by the ORM to provide IDs for entities while persisted.

### V1.1__Insert_samples.sql

The initial sample data insertion script, which contains the sample data that we will insert into the database in order to have 
sample data during the execution.

## **Notice the versioning used here—V1.0 and V1.1—this is used to guarantee the execution order of the Flyway scripts**.