# Microsoft Teams: Webhook Deprecation

Microsoft Teams is deprecating the webhook connector. This means that you will no longer be able to use the webhook connector to send messages to a Teams channel.

## What do I need to do?

To continue sending messages to a Teams channel, you will need to switch to the Workflows app in Microsoft Teams which means you need to use the Microsoft Power Automate service.

## How to find the Teams where the webhook is used?

To find the Teams where the webhook is used, you can use the following steps:

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

6. Run the Teams Webhook Finder tool with the following command:

```bash
chmod +x webhook-finder
./webhook-finder
```

Or on Windows:

```cmd
webhook-finder.exe
```