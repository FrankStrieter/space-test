# Dockerized Self Hosted Agent to run pipelines on Azure

## Instructions
- clone the recopistiory
- copy `.env.template` to `.env`
- insert your credetials and settings to `.env`
  - you can have a look at https://docs.microsoft.com/de-de/azure/devops/pipelines/agents/v2-linux?view=azure-devops#authenticate-with-a-personal-access-token-pat to get your credentials for `AZP_TOKEN` and `AZP_URL` (https://dev.azure.com/{your_organization})
- create an agent pool and put the name into `AZP_POOL` (https://docs.microsoft.com/de-de/azure/devops/pipelines/agents/pools-queues?view=azure-devops&tabs=yaml%2Cbrowser)
- optional: copy `.cache-images.sh.template` to `.cache-images.sh`
  - put docker pull commands in the scipt for images you need to use often
- run `docker-compose up -d` to start your agent
- you will see it as online at `https://dev.azure.com/{your_organization}/{your_project}/_settings/agentqueues`


test
