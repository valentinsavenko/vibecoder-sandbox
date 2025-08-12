# vibecoder-sandbox
Docker compose magic to start testing multiple LLMs in their own sandbox container for comparison/fun. 
TMUX is used to manage multiple LLMs in a single session. Each LLM-cli is running in its own container and can be accessed via SSH. The tmux session allows for easy switching between LLMs and interacting with them.

TMUX is very unintuitive and if you're not familiar with it this will hurt :) 

## this is playground, don't use it in production
these ssh keys are publicly available and insecure for any production use now

## prepare env vars
```bash
cp .env_TEMPLATE .env # change file and add your api keys
```

## starting the containers
```bash
docker-compose up -d
```

## stopping the containers
```bash
docker-compose down
```

## starting the tmux session
```bash
docker-compose exec vibecoder /app/start_vibing_tmux.sh
```
