#!/bin/bash

# Pull time (hh:mm:ss) and the current timezone in 24-hr format from the date command
tiime=`date | awk -F'( |,|:)+' '{print $4":"$5":"$6,$7}'`
# Pull date (DD MMM YYYY) from the date command
daate=`date | awk -F'( |,|:)+' '{print $3,$2,$8}'`
# Pull the system uptime ("DD days, HH hours, and MM minutes") from the uptime command
uptiime=`uptime | awk -F'( |,|:)+' '{print $6,$7",",$8,"hours, and",$9,"minutes"}'`
# Pull the number of users (## users) presently logged into the system.
upuusers=`uptime | awk -F'( |,|:)+' '{print $10}'`
# prints a line containing the names of all users currently logged in.
uusers=`users`

# Appends the finished statement to a log file.
printf "\n\nAs of $tiime on $daate, the system has been running for $uptiime. Currently, there are $upuusers users logged in. Their names are: \n$uusers\n\n" >> log_file_GROSS.txt
