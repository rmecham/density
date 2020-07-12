# Density Assignment

## General Approach

The database schema includes tables for the spaces, doorways, and DPUs indicated in the
assignment overview. The only columns for the spaces and doorways are their names. The
DPU table contains more: a reference to the doorway and two references to the space table.
One references indicates which space, if any, will have an occupancy increase for an
entry event (direction = 1) and another to indicate which space, if any, will have an
occupancy decrease for an exit event (direction = -1). The values in this table can be
changed (e.g. if the DPU is moved) without affecting historical data.

The time series data is contained in two other tables: `dpuevent` and `spaceoccupancy`.
The `dpuevent` table contains the raw data coming in from the DPUs: a reference to the
DPU, a timestamp, and a direction. The `spaceoccupancy` table tracks the calculated
occupancy of a space as of each event in the `dpuevent` table that affected the given
space. In order to accommodate DPU events being received out-of-sequence, each occupancy
calculation is initially marked as “pending”. After a configurable amount of time, after
which we can be reasonably confident that no more out-of-sequence events will be received,
space occupancy rows are marked as “settled”. When a new DPU event comes in, all pending
space occupancy rows are recalculated, based on the most recent settled occupancy.

## Possibilities for Scaling

Possible strategies for scaling to 100,000 DPUs. Strategies can be mixed and matched,
depending on real needs and the results of careful performance profiling. These strategies
all presume that the typical steps for horizontally scaling the database (i.e. the
creation of replicas) have already been taken. The strategies below are not necessarily
in order.

*  **Asynchronous Occupancy Calculations:** As implemented in this example project, the
`record_dpu_event` function synchronously marks older space occupancy records as settled
and recalculates records that are still pending when recording new DPU events. These tasks
would be better performed using an asynchronous task queue.

*  **Archive:** DPU events and space occupancy records older than a certain threshold —
for example 6 months — can be moved from the main database to a separate archive database.

*  **Buffer:** Setting up an in-memory queue for incoming DPU events will help ensure that
new DPU events don’t get lost while the database works to catch up on writes.

*  **Cache:** It will depend on usage patterns but caching API responses could help. Also,
caching the DPU and space occupancy lookups in `record_dpu_event` and `calculate_occupancy`
could likely help as well.

*  **Shard:** Given that information about spaces, doorways, individual DPUs, DPU events,
and space occupancy is fairly well isolated, this application is a good candidate for
database sharding. Data for each customer (or perhaps a range of customers) could be
isolated into separate databases. That way, data processing can be more easily done in
parallel.

## Code Layout

This project uses Django as the web framework and ORM. The `config` directory contains
all of the files created by Django’s `startproject` command, while the apps and other main
source files are contained in `source`. Currently, there is only one app, `dpu`, which
contains the models corresponding to the tables mentioned above as well as a simple API
view. The `record_dpu_event` and `calculate_occupancy` functions are found in the `utils`
module of the `dpu` app.

Dependencies are managed with `pipenv` and the corresponding `Pipfile` and `Pipfile.lock`
are included in the repository. An export of the the database schema in SQL format is
included in the file `db_schema.sql`.
