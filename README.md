# Simon Bengtsson
Home page for simonbengtsson.com and simonbengtsson.se

### Develop
- `webdev serve`

### Deploy
- `webdev build`
- `rsync -a -e 'ssh -p 3333' --exclude="packages" build/ simonb@flown.io:/var/www/simonbengtsson --stats --progress`

### Note
- Might need to make images public, `chmod 777 -R images`