#!/usr/bin/env bash
# Run this on your VPS to debug the 404 issue

echo "=== 1. Check if backend is running ==="
sudo systemctl status w9 --no-pager | head -20

echo -e "\n=== 2. Check backend routes (should see /api/admin/items) ==="
sudo journalctl -u w9 -n 50 --no-pager | grep -i "route\|started\|listening"

echo -e "\n=== 3. Test backend directly (bypass nginx) ==="
curl -v http://127.0.0.1:10105/health 2>&1 | head -20

echo -e "\n=== 4. Test admin items endpoint directly ==="
curl -v http://127.0.0.1:10105/api/admin/items 2>&1 | head -20

echo -e "\n=== 5. Check nginx config ==="
sudo nginx -T 2>&1 | grep -A 5 "location /api/"

echo -e "\n=== 6. Check if nginx was reloaded ==="
sudo systemctl status nginx --no-pager | head -10

echo -e "\n=== 7. Check backend binary timestamp ==="
ls -lh /opt/w9/w9

echo -e "\n=== 8. Verify git commit on VPS ==="
cd /root/W9 && git log --oneline -1

