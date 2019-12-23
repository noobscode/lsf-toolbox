# lsf-toolbox
This Toolkit was made to simplify the use of LSF cluster commands

Note that you can run this without installing, first we just need to make the script executable by typing:
```
$ sudo chmod +x lsf-toolbox.sh
```
To run the script just type:
```
$ sudo ./lsf-toolbox.sh
```
When you run the script you will se the following:
```
# LSF Toolkit
# Author: Alexander A. Nordbø
# https://github.com/noobscode
#
# This Toolkit was made to simplify the use of LSF cluster commands

1) List all jobs                         7) List resources reserved by cluster
2) List jobs for a spesific user         8) New cluster user
3) List job based on #ID                 9) Remove cluster user
4) Kill a job                           10) Persistent Install
5) List all queues                      11) Quit
6) List all nodes
Please enter your choice:
```

To install it choose option #10. When installed you can simply run it by typing:
```
$ lsf
```

Note that you will need to be root or use a user with proper permissions to actually perform cluster tasks.
