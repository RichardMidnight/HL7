#!/bin/bash


function process_hl7_message() {
    # Extract relevant information from the HL7 message
    patient_id=$(echo "$1" | awk -F'|' '{print $1}')
    first_name=$(echo "$1" | awk -F'|' '{print $2}')
    last_name=$(echo "$1" | awk -F'|' '{print $3}')
    location=$(echo "$1" | awk -F'|' '{print $4}')

    # Process and store the location information (replace with your logic)
    store_patient_location "$patient_id" "$first_name" "$last_name" "$location"
}

function store_patient_location() {
    # Implement your logic to store the patient's location
    echo "Patient $2 $3 (ID: $1) is now at location $4"
}

function hl7_listener() {
    local host="127.0.0.1"
    local port=12345

    echo "Listening for HL7 messages on $host:$port"

    while true; do
        # Use netcat to listen for incoming connections and receive HL7 message
        hl7_message=$(nc -l -p $port)

        # Process the received HL7 message
        process_hl7_message "$hl7_message"
    done
}

# Start the HL7 listener
hl7_listener
