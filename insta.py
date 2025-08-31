import requests
from time import sleep
E = '\033[1;31m'
B = '\033[2;36m'
G = '\033[1;32m'
S = '\033[1;33m'
print(S+'rro_311💀💀                            ')
user=input(G+F'Enter Username :{B} ')
headers = {
    'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
    'accept-language': 'en-US,en;q=0.9',
    'cache-control': 'max-age=0',
    'content-type': 'application/x-www-form-urlencoded',
    'cookie': 'token=4b718a618d5bdae00ade708833612c4f; ci_session=e59850bd1423aedccf5f801c48817deb2a307aae; _gcl_au=1.1.1334450127.1723798582; _ga=GA1.1.602114032.1723798582; _ga_0SK2540MBC=GS1.1.1723798582.1.1.1723798738.0.0.0',
    'origin': 'https://leofame.com',
    'priority': 'u=0, i',
    'referer': 'https://leofame.com/free-instagram-followers',
    'sec-ch-ua': '"Not/A)Brand";v="8", "Chromium";v="126", "Opera";v="112"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"Windows"',
    'sec-fetch-dest': 'document',
    'sec-fetch-mode': 'navigate',
    'sec-fetch-site': 'same-origin',
    'sec-fetch-user': '?1',
    'upgrade-insecure-requests': '1',
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 OPR/112.0.0.0',
}

data = {
    'token': '4b718a618d5bdae00ade708833612c4f',
    'free_link': f'{user}',
}

response = requests.post('https://leofame.com/free-instagram-followers',  headers=headers, data=data)
if     'Please' in   response.text:
        print(E+'انتظر شوي وراح يوصلك الرشق')

else:
        print(B+'          DONE SENT       ')
