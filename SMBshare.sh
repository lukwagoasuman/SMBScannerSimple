#!/bin/bash

# Check if IP of target is entered

if [ -z "$1" ]

 then

    echo "Correct usage is ./recon.sh "

   exit

  else

    echo "Target IP $1"

    echo "Running Nmap…"

# Run Nmap scan on target and save results to file

    nmap -sV $1 > scan_results.txt

    echo "Scan complete – results written to scan_results.txt"

fi

# If the Samba port 445 is found and open, run enum4linux.

if grep 445 scan_results.txt | grep -iq open

  then

    enum4linux -U -S $1 >> scan_results.txt

    echo "Samba found. Enumeration complete."

    echo "Results added to scan_results.txt."

    echo "To view the results, cat the file."

  else

   echo "Open SMB share ports not found."

fi

# lukewago