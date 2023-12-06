#!/bin/bash

# HL7 message format
HL7_MESSAGE="MSH|^~\&|SENDING_APP|SENDING_FACILITY|RECEIVING_APP|RECEIVING_FACILITY|$(date +%Y%m%d%H%M%S)||ADT^A04|1234567|P|2.3||||\rEVN|A04|$(date +%Y%m%d%H%M%S)|||\rPID|1||12345^^^YOUR_AUTHORITY^^MR||Doe^John^||19700101|M|||123 Main St^^City^State^ZIP^USA||(555)555-5555|||M|||123456789|987654321|||\rPV1|1|O|||||^^^^^||||||||||||||||||||||||||||||||||||||||||||"

# Set the server host and port
SERVER_HOST="127.0.0.1"
SERVER_PORT=12345

# Send the HL7 message using netcat
echo -e "$HL7_MESSAGE" | nc $SERVER_HOST $SERVER_PORT
