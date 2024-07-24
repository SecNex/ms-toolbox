[array]$TargetApps = "SharePoint News", "RSS", "Incoming Webhook"

# Get all Microsoft teams in the tenant
# TODO: Add microsoft teams module and request the list of teams
$Report = @()
ForEach ($Team in $Teams) {
    # Get all channels in the team
    $TeamName = $Team.DisplayName
    Write-Host "Processing team $TeamName..."
    $Apps = Get-MgTeamInstalledApp -TeamId $Team.Id -ExpandProperty TeamsAppDefinition
    if ($Apps) {
        ForEach ($App in $Apps) {
            if ($App.TeamsAppDefinition.DisplayName -in $TargetApps) {
                $Report.Add([PSCustomObject]@{
                    TeamName = $TeamName
                    AppName = $App.TeamsAppDefinition.DisplayName
                    Description = $App.TeamsAppDefinition.ShortDescription
                    AppVersion = $App.TeamsAppDefinition.Version
                    AppState = $App.TeamsAppDefinition.PublishingState
                    AppId = $App.TeamsAppDefinition.Id
                })
            }
        }
    }
}

# Output the report to a CSV file
$Report | Export-Csv -Path "C:\temp\TeamsAppsReport.csv" -NoTypeInformation