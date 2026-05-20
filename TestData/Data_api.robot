*** Variables ***
${Api_user_id}            12
${Api_user_not_found}     1234

#Data test TSA_01 Get user profile success
&{TSA01_Api}
...    id=${12}
...    email=rachel.howell@reqres.in
...    first_name=Rachel
...    last_name=Howell
...    avatar=https://reqres.in/img/faces/12-image.jpg

