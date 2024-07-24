# Microsoft Teams: Webhook Deprecation

Microsoft Teams is deprecating the webhook connector. This means that you will no longer be able to use the webhook connector to send messages to a Teams channel.

## What do I need to do?

To continue sending messages to a Teams channel, you will need to switch to the Workflows app in Microsoft Teams which means you need to use the Microsoft Power Automate service.

## How to find the teams where the webhook is used?

To find the teams where the webhook is used, you can use the following steps:

1. Download the [Teams Webhook Finder](https://github.com/SecNex/teams-webhook-finder) tool from GitHub.
2. Create a new app registration in Azure AD.
3. Grant the app registration the following permissions:
   - Microsoft Graph: `AppCatalog.Read.All`
   - Microsoft Graph: `Team.ReadBasic.All`
   - Microsoft Graph: `TeamsAppInstallation.ReadForTeam.All`
4. Create a new client secret for the app registration.
5. Create a new configuration file `config.json` for the Teams Webhook Finder tool in the same directory as the tool.

```json
{
    "client": {
        "client_id": "YOUR_CLIENT_ID",
        "client_secret": "YOUR_CLIENT_SECRET",
        "tenant_id": "YOUR_TENANT_ID"
    }
}
```

6. Run the Teams Webhook Finder tool with the following command:

```bash
chmod +x webhook-finder
./webhook-finder
```

Or on Windows:

```cmd
webhook-finder.exe
```

7. The application will output a list of teams where the webhook is used.

## How to migrate my webhooks and what are the alternatives?

Four solutions are available to migrate your webhooks:

1. **Microsoft Power Automate**: You can use the Workflows app in Microsoft Teams which is triggered by a webhook and sends a message to a Teams channel.

2. **Microsoft Graph API**: You can use the Microsoft Graph API to send messages to a Teams channel.

3. **Microsoft Teams Bot**: You can create a Teams bot that sends messages to a Teams channel and use the bot's webhook to trigger the message.

4. **Own webhook service** / **SecNex Webhook Solution**: You can create your own webhook service that sends messages to a Teams channel using the Microsoft Graph API.

## SecNex Webhook Solution

SecNex offers a webhook solution that allows you to send messages to a Teams channel using the Microsoft Graph API. The solution is easy to use and can be integrated into your existing applications. You becames a webhook URL that you can use to send messages to a Teams channel.
With simple parameters, you control the target channel.

To get started, you can visit the [SecNex Webhook Solution](https://secnex.io/webhook) website.

Your benefits:

- **Easy to use**: The solution is easy to use and can be integrated into your existing applications.
- **Secure**: The solution is secure and uses the Microsoft Graph API to send messages to a Teams channel. We use a additional query parameter in the webhook URL with a token to authenticate the request and prevent unauthorized access. If you have a ip address, you can restrict the access to the webhook.
- **Customizable**: The solution is customizable and allows you to control the target channel with simple parameters.
- **Flexible**: The solution is flexible and can be used in any programming language that supports HTTP requests.
- **Low cost**: The solution is low cost and offers a free tier with limited messages per month.