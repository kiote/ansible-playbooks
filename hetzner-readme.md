run playbook: `ansible-playbook hetzner-setup.yml -i ansible-hosts -e 'ansible_python_interpreter="/usr/bin/python3"'`
```
sudo -i -u postgres
psql
create user imposter with password 'imposter';
create database imposter;
grant all privileges on database imposter to imposter;
python3 manage.py migrate
python3 manage.py createsuperuser 
htpasswd -c /etc/apache2/.htpasswd user1
```

add IP-address to settings.py ALOWED_HOSTS
and run `python3 manage.py runserver 0.0.0.0:8000`

