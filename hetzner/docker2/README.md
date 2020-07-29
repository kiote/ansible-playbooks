## How to init new server for instagram:

1. add it to `hosts` file
2. copy `*`:vars section, add specific for your server vars, if needed 
3. run 

```
ansible-playbook setup.yml --verbose
ansible-playbook configure-for-inst.yml --verbose
```
