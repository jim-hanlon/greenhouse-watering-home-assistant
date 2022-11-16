alias chmod='chmod -v'
alias chown='chown -v'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias rmdir='rmdir -v'

export PROJECT_DIRECTORY=${HOME}/home-assistant
export COMPOSE_FILE=${PROJECT_DIRECTORY}/docker-compose.yml
export DOCKER_USER="$(id -u):$(id -g)"

