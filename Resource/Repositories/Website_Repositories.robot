*** Variables ***


# - Login

${Login_username}                                id=username
${Login_password}                                id=password

# - Button

${btn_login}                                     //*[@id="login"]/button
${btn_logout}                                    css=a[href="/logout"]


# - Message

${Message_alert}                                 id=flash-messages
