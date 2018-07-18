#!/bin/bash
# basic enum script created by @ping_of_death_
# http://hired.team/
# such hax
#                   ▄              ▄
#                  ▌▒█           ▄▀▒▌
#                  ▌▒▒█        ▄▀▒▒▒▐
#                 ▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐
#amaze        ▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐
#             ▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌ 
#            ▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌
#            ▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐
#  so leet  ▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌
#           ▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌
#          ▌▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐
#          ▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌
#          ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐ many planet
#           ▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌
#           ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐
#            ▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌
#              ▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀
#                ▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀ wow
#                   ▒▒▒▒▒▒▒▒▒▒▀▀
#

if [[ $EUID -ne 0 ]]; then
   echo "cool story bro, now try 'sudo !!'" 
   exit 1
fi

# Check for and install HTML2Text if not installed
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' html2text|grep "install ok installed")
echo Checking for html2text package.

if [ "" == "$PKG_OK" ]; then
  echo "HTML2Text not installed. Installing..."
  apt install html2text --yes
fi
# End dependency check. Script should be run as root/sudo so sudo not required for apt.

for ip in "$@"
do
echo '[elevator music plays softly]'
echo '****************************************************' > "$1"
echo '****************Unicorn Scan************************' >> "$1"
echo '****************************************************' >> "$1"
echo '**********Currently doing Unicorn Scan**************'
#echo $1
unicornscan "$1" >> "$1"
echo '****************************************************' >> "$1"
echo '**********************NMAP**************************' >> "$1"
echo '****************************************************' >> "$1"
echo '*************Currently doing NMAP*******************'
echo '[elevator music intensifies]'
nmap \-T4 \-Pn \-sV \-A "$1" >> "$1"
echo '****************************************************' >> "$1"
echo '*********************Curl***************************' >> "$1"
echo '****************************************************' >> "$1"
echo '**************Currently curling*********************'
echo '[elevator music switches to death metal]'
echo 'You have arrived at your destination. Check the current working directory for the file with the same name as the ip of your target'
curl \-L \-\-silent "$1" | html2text >> "$1"
done
