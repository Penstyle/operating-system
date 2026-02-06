#!/bin/bash
# 1. ps aux | grep nginx
# 2. pkill my_script.sh
# 3. nohup ./backup.sh &
# 4. pgrep sshd
# 5. pstree
# 6. lsof -p 1234
# 7. systemctl status docker
# 8. nice -n 19 ./heavy_calc.sh
# 9. cp -r /var/www/html /backup/html
# 10. cp -p secret.key /tmp
# 11. rsync -av --update src/ dest/
# 12. cp -u dir1/* dir2/
# 13. scp app.conf user@192.168.1.50:/etc/  # Replace 'user'
# 14. tar -czf logs.tar.gz /var/log
# 15. find /home -type f -size +500M
# 16. find /var/log -type f -mtime -7
# 17. find /tmp -type f -user jenkins
# 18. find /data -type d -empty -delete
# 19. find . -type f -perm 777
# 20. find . -type f -name "*.jpg" -exec cp {} /images/ \;
# 21. grep -oE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' contacts.txt
# 22. grep -i "error" syslog
# 23. grep '^root' config.ini
# 24. grep -v "192.168.1.1" access.log
# 25. grep -r "TODO" .
# 26. sed -i 's/localhost/127.0.0.1/g' hosts.txt
# 27. grep -v '^#' configfile  # Or sed '/^#/d' configfile
# 28. grep -E '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$' file
# 29. ps aux | grep root
# 30. find . -type f -name "*.log" -exec grep -l "Critical" {} \;
