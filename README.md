This is an absolutely general back-up script saving the content of the 
- ~ (/home/user)
- /etc 
- /var

What makes this short scrip usefull is a small check at the start looking for the presence of the external drive.
If present start the backup procedure, but if not it skip the session.
Recommended to add it to the system as a cronjob.

To be improved with:
- Set how long to keep a back-up
		-OR-
- Rsync to delete the files missing from the original system
- Add encryption option to the back-up folder



