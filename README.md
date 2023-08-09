# PrintFromFolder
Used to automagically print any files dropped into a specific folder 

I used this to send files from a Linux machine running Debian to a windows machine. Acting as a print server, the powershell script would monitor a folder for files, print them, then archive them.

On the linux side, Samba was used to create an SMB share for sending files. 
