db.py is based on python3 and requires the psycopg2 library

If you run db.py in command line rather in pycharm, you need to make sure you are in the file directory.

(cd [file directory])

Before running db.py, please make sure that the python version is above 3.0 and psycopg2 is installed; make sure that the postgresql service has been running, the default port number is 5432, and the ip address is the local host.

```python
conn = psycopg2.connect(database='LOL',
                        user='postgres',
                        password='04691268',
                        host='127.0.0.1',
                        port='5432')
```

In postgresql, a database named "LOL" or a database with other names must be established in advance; the user name and password need to be changed according to the host configuration to change the python code to make the program run normally.

