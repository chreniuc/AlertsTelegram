# AlertsTelegram from StorjShare
A simple script to send alerts from StorjShare using Telegram bot.

## Requirements

* Bash
* CURL
* Telegram Bot
## Output Demo
<img src="http://i.imgur.com/CqqUvrd.jpg" height="400"  >

## Create Telegram Bot

If you don't have a Telegram Bot, just [create one](https://core.telegram.org/bots#create-a-new-bot). By using a Telegram bot you don’t have to use a real Telegram client or reuse your Telegram account. 

### Getting Bot Token

You will get a **Telegram Bot Token** after bot created. Keep this token, we will use it later. The bot token is looked like this.

```nginx
123456789:aBcDeFgHiJkLmN-OpQrStUvWXyZ12345678
```

### Getting Chat ID

To send messages to a Telegram chat, you must first needs to start a chat with the bot. Clicking on the bot link after creation should be enough, it will automatically send a message of `/start` to the bot.

To get the **Chat ID** from Telegram bot, execute this command using [getUpdates](https://core.telegram.org/bots/api#getupdates) function of Telegram API.

```
Go to "https://api.telegram.org/bot{TOKEN}/getUpdates" : 
{
  "ok": true,
  "result": [
    {
      "update_id": 17082016,
      "message": {
        "message_id": 17,
        "from": {
          "id": 22031984,
          "first_name": "User"
        },
        "chat": {
          "id": 22031984,
          "first_name": "User",
          "type": "private"
        },
        "date": 1471402800,
        "text": "Hello from the other side~"
      }
    }
  ]
}
```

In this example the **Chat ID** to look out for is **22031984**. Replace `{TOKEN}` with your Telegram bot token.

## Usage

Clone this repo or download the zipped file. 

```console
# git clone https://github.com/kznamst/AlertsTelegram.git
# cd AlertsTelegram
# chmod +x cron.sh 
# chmod +x sendtelegram.sh
# env > ~/.env
# crontab -e
In cron add: 
55 * * * * /home/storj/AlertsTelegram/cron.sh >> /dev/null 2>&1
#That means that it will be executed every hour at x:55
```

## Cron.sh
Here we parse the data from the `storjshare status` command and we get only the *%* and the space used.
Output will look something like this: ` Vps : hostname (%) xGB `


Test the `sendtelegram` script by running this command.

```console
# ./sendtelegram.sh -m "Hello from the other side!"
Sending message 'Hello from the other side!' to 22031984
Done!
#
```
You should see Telegram message sent by your Telegram bot.
