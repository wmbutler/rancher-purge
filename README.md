# Purpose
The purpose of rancher-purge is to keep your rancher hosts uncluttered. Currently, Rancher doesn't have a clean way to remove hosts that are no longer communicating with the Rancher Server. This container will:
- Identify hosts marked as deactivated
- Issue a `rancher rm --type host` to each
- Allow you to set a custom interval in seconds

# Sample docker-compose.yml
```
version: '2'
services:
  rancher-purge:
    image: wmbutler/rancher-purge
    environment:
      RANCHER_ACCESS_KEY: YOUR_RANCHER_ACCESS_KEY
      RANCHER_SECRET_KEY: YOUR_RANCHER_SECRET_KEY
      RANCHER_URL: http://rancher.cavo.io:8080/v2-beta/schemas
      RANCHER_ENVIRONMENT: YOUR_RANCHER_ENVIRONMENT_ID
      INTERVAL: 180
```
# Notes
- Environment settings are case sensitive!
- You can obtain your ACCESS_KEY and SECRET_KEY from the Rancher Server API -> Keys Menu.
- The RANCHER_URL can be used exactly as shown above. This tool does not support the v1 URL.
- Your RANCHER_ENVIRONMENT is a bit less obvious but can be found in the address bar of your browser while logged into your Rancher Server.  `/settings/env/1a5`. In this case, the environment is **1a5**
- The default interval is 300 seconds, but you can override that in your environment settings.