#!/bin/bash

HOST=${GR_MONGO_HOST}
PORT=27017
DATABASE=smartcity

function loadFile() {
    if [ -f $2 ]; then
        echo "Import $2 file on $1 collection"
        mongoimport --host $HOST --port $PORT --db $DATABASE --collection $1 --drop --file $2
    else
        echo "File $2 not found"
    fi
}

loadFile 'country' '/sample-data/country_file.json'
loadFile 'region' '/sample-data/region_file.json'
loadFile 'locality' '/sample-data/locality_file.json'
loadFile 'notification' '/sample-data/notification_file_new.json'
loadFile 'vehicleType' '/sample-data/vehicle_type_file.json'
loadFile 'publicTransportFuelType' '/sample-data/public_transport_fuel_type_file.json'
loadFile 'agency' '/sample-data/agency_file.json'
