# Simon Bengtsson
Home page for simonbengtsson.com and simonbengtsson.se

### Develop
- `webdev serve`

### Deploy
- `webdev build`
- `rsync -a  -e 'ssh -p 3333' --chown=www-data:www-data build/ simonb@flown.io:/var/www/simonbengtsson`

### Note
- For some reason the dart version of the snake app is buggy, but the js version works fine.
- Might need to make images public, `chmod 777 -R images`