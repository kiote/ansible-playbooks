run playbook: `ansible-playbook hetzner-setup.yml -i ansible-hosts -e 'ansible_python_interpreter="/usr/bin/python3"'`
```
sudo -i -u postgres
psql
create user your_user with password 'your_password';
create database mydb;
grant all privileges on database mydb to your_user;
export DATABASE_URL=postgres://your_user:your_password@127.0.0.1:5432/mydb
export REDIS_URL=redis://127.0.0.1:6379
python3 manage.py migrate
python3 manage.py createsuperuser 
```

add IP-address to settings.py ALOWED_HOSTS
and run `python3 manage.py runserver 0.0.0.0:8000`

