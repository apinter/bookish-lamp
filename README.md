#BOOKISH-LAMP

#Licensing Information: READ LICENSE

Project scource available here: https://github.com/apinter/bookish-lamp.git

##Authors & Contributors

Attila Pinter

##File List

bookish-lamp_bk.sh - General backup 

bookish-lamp_postubi.sh - Ubuntu and derivatives post-installation

bookish-lamp_swap.sh - Swappiness and cache config

bookish-lamp_sqlitefix.sh - Malformed sqlite db fix

README.md - This document


##About

Bookish-Lamp is nothing else, but a collection of my most used scripts in the world of Linux. Since I 
deploy a lot it helps to make things get up and running as fast as possible, keep everything in sync if
needed or just quickly make a few changes in config files or fix something etc.
We all have this kind of programs and we love to use them. This is just me opening up my scripts 
for the public and the FOSS community.


##How to run bookish-lamp and what it does

###I. bookish-lamp_postubi.sh

The postubi script is something what I created for Ubuntu and Ubuntu based systems like Mint or 
Elementary. 
The script simply add a few necessary repos like Owncloud, Java or even Numix for decoration.
Eventually running the script will install the necessary codecs for the system, compression softwares,
graphic softwares, browsers, Skype, Atom etc.
It's a simple way of getting started or adding/removing the apps you like to have on your desktop.

Before running it just make sure the file is executable, if not just type: chmod +x bookish-lamp_postubi.sh.
You need to run it with sudo: sudo ./bookish-lamp_postubi.sh


###II. bookish-lamp_swap.sh

Swap is simply changes the swappiness and caching settings to use the swap as less as possible, only if necessary 
since using the swap can be pretty expensive.

Before running it just make sure the file is executable, if not just type: chmod +x bookish-lamp_swap.sh.
You need to run it with sudo: sudo ./bookish-lamp_swap.sh


###III. bookish-lamp_bk.sh

Bk is a pretty obvious system backup tool. It takes care of the /home, /etc and /var, but of course 
can be modified and add or exclude as many items you want. This particular app runs as a cronjob 
(in my case) and it looks for my external HDD to be connected. Usually before closing the day I just
plug in the disk and bk will do it's job once recognize that the disk is connected.
This might actually won't work with Debian based systems, but works great with Arch and Fedora.
YOu might need to modify the mount point to /media/username

Before running it just make sure the file is executable, if not just type: chmod +x bookish-lamp_nk.sh.
You can run it manually - not much fun in that - or add to cron like this:
1. Edit crontab: crontab -u user -e
2. Add the following line to your cronjob:
	* * * * * /home/user/bookish-lamp_bk.sh
3. Save it and quit


###IV. bookish-lamp_sqlitefix.sh

Sqlitefix is a special case. I work with a lot of embeded solutions and embeded db which is not as durable
as a DBMS and a poorly scheduled power cycle can cause some massive troubles. Sqlitefix is looking out
for the db file and fix it once it got corrupted.

You can run it manually after you made sure it is executable (chmod +x bookish-lamp_sqlitefix.sh) or add
to cron:
1. Edit crontab: crontab -u user -e
2. Add the following line to your cronjob to run the script every day @5am:
        0 5 1 * * /home/user/bookish-lamp_bk.sh
3. Save it and quit

###Known bugs

###What's next?
