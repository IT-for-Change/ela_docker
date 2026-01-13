1. Specify a TAG while building the ELA docker image ela:TAG.
   
`ela.sh <<TAG>>`

2. Specify the same TAG as an environment variable while starting the services using docker compose.
   
`TAG=<<TAG>> docker compose -f ela.yml up -d`
