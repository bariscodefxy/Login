Login is a security plugin for MCServer.  It requires a player to log in before they can do any action on the server.  This way people can't login on the account of an admin or moderator. This would be particuarly useful for servers that don't use the traditional Minecraft authentication.

# Fork Features
- Do not teleport player to world spawn when spawned

# Configuration
If a configuration file doesn't exist yet Login will create one with the default settings. Currently there are 2 things you can configurate 
 
 -  Storage: This can be "sqlite" (default). If choosen for sqlite the plugin will save everything in an sqlite database.


 -  LoginMessageTime: This is the time in ticks (50 msec) between an "You have to login" message. 


# Commands

### General
| Command | Permission | Description |
| ------- | ---------- | ----------- |
|/changepass | login.changepass | Change your password|
|/login | login.login | Login into the server|
|/register | login.register | Register an account|
|/removeacc | login.removeacc | Remove an account from the database|



# Permissions
| Permissions | Description | Commands | Recommended groups |
| ----------- | ----------- | -------- | ------------------ |
| login.changepass | Allows a player to change his password. | `/changepass` | Default |
| login.login | Allows a player to log in | `/login` | Default |
| login.register | Allows a player to create an account for himself. | `/register` | Default |
| login.removeacc | Allows a player to remove an account | `/removeacc` | Admins |
