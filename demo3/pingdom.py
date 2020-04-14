import requests

token = "$PINGDOM_TOKEN"
hed = {'Authorization': 'Bearer ' + token}
url = "https://api.pingdom.com/api/3.1/checks"
host = "34.69.1.126"
team_id = "482197"
port = [ "8080", "8081", "8082", "8083", "8084" ]


i = 0
while i < 5:
    request = {	"name": port[i], "host": host, "port": port[i], "type": "tcp", "resolution": "1", "sendnotificationwhendown": "1", "teamids": team_id } 
    response = requests.post(url, data=request, headers=hed)
    i += 1

    
    
