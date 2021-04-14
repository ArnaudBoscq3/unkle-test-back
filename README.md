<b>A. DEPENDENCIES</b><br/>
1. Ruby versions: 2.7.1<br/>
2. Rails versions: 6.0.3.6<br/>
3. DB: postgresql<br/>

<b>B. INSTALL THE UNKLE PROJECT LOCALLY</b><br/>
1. Clone the project<br/>
2. ```bundle```<br/>
3. ```rails db:create db:migrate db:seed```<br/>
The seed will fill our db with all that we need to test our API: 2 admins, 3 clients, 5 contracts, 5 options<br/>
We can see all datas added in ```db/seeds.rb```<br/>
5. Boot up the local server with ```rails s```, and follow the steps below with ```POSTMAN``` or another ```API TEST```.<br/>

<b>C. SIGN UP & LOG IN</b><br/>
All actions below will need an ```Admin``` or a ```Client``` to request our API.<br/>
So first, we need to ```Sign up``` and/or ```Log in``` to be authenticated<br/>
<b>Check the following items in the response headers, because we will need them in subsequent requests: access-token, client, expiry, uid.</b>.<br/>

<b>I. Client</b><br/>

1. Sign up<br/>
Send a JSON request to ```POST localhost:3000/auth/``` with the parameters below.<br/>
```
{
    "email": "johndoe@gmail.com",
    "password": "client123"
}
```

2. Log in<br/>
Send a JSON request to ```POST localhost:3000/auth/sign_in``` with the parameters below.<br/>
```
{
    "email": "arnaud@gmail.com",
    "password": "client123"
}
```

<b>II. Admin</b><br/>
We don't have a ```Sign up``` for ```Admin```, only an ```Admin``` could create another one.<br/>
We already added two ```Admins``` in our project who will be allowed to manage that.<br/>

1. Log in<br/>
Send a JSON request to ```POST localhost:3000/auth_admin/sign_in``` with the parameters below.<br/>
```
{
    "email": "matthieu@unkle.fr",
    "password": "unkle123"
}
```

<b>III. SEND REQUEST AS AN AUTHENTICATED ClIENT/ADMIN </b><br/>
Now we will need to send the four items listed above in our header to be authenticated. We will need to change them for testing as an ```Admin``` and as a ```Client```<br/>

Headers<br/>

```
Content-Type: application/json
access-token:  <long string>
expiry: <long integer>
client: <long string>
uid: test@email.com
```

(access-token, client, expiry and uid need to be changed with our previous response headers (Log in)).<br/>

<b>D. ADMIN TEST</b><br/>
We need to be authenticated as an ```Admin```. <br/>

1. List Admins<br/>
```GET localhost:3000/admin/admins```

2. Create Admin<br/>
Send a JSON request to ```POST localhost:3000/admin/admins``` with the parameters below.<br/>
```
{
    "admins": {"email": "johndoe@unkle.fr"}
}
```

3. Destroy Admin<br/>
```DELETE localhost:3000/admin/admins/2```

<hr/>

4. List Clients & Contracts<br/>
```GET localhost:3000/admin/clients```

5. Show Client<br/>
```GET localhost:3000/admin/clients/1```<br/>

6. Create Client<br/>
Send a JSON request to ```POST localhost:3000/admin/clients``` with the parameters below.<br/>
```
{
    "clients": {"email":"johndoe@gmail.com"}
}
```

7. Destroy Client<br/>
```DELETE localhost:3000/admin/clients/3```<br/>

<hr/>

8. Create Contract<br/>
Send a JSON request to ```POST localhost:3000/admin/contracts``` with the parameters below.<br/>
```
{
    "contracts": {"start_date":"10/08/2021", "client_ids": [1,2], "option_ids": [2,4] }
}
```
9. Cancel Contract<br/>
Send a JSON request to ```PUT localhost:3000/admin/contracts/1``` with the parameters below.<br/>
```
{
    "contracts": {"end_date":"10/12/2021" }
}
```

<b>E. CLIENT TEST</b><br/>
We need to be authenticated as a ```Client```. <br/>

1. Show Current Client & Contracts<br/>
```GET localhost:3000/clients_contracts```

2. Cancel Contract<br/>
Send a JSON request to ```POST localhost:3000/clients_contracts/4``` with the parameters below.<br/>
```
{
    "contracts": {"end_date":"10/12/2021" }
}
```

<b>F. CRON JOBS (WHENEVER GEM)</b><br/>
We use ```gem 'whenever'``` to change dynamically the ```status``` of the```Contracts```. (```config/schedule.rb```)<br/>
