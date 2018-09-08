# Simon Bengtsson
Home page for simonbengtsson.com and simonbengtsson.se

### Deploy
- `dart2js --out=web/sb_snake.dart.js web/sb_snake.dart`
- Swap *.dart to *.js in build/index.html
- `rsync -a  -e 'ssh -p 3333' --chown=www-data:www-data --exclude="orgimages" web/ root@flown.io:/var/www/simonbengtsson`

### Note
- For some reason the dart version of the snake app is buggy, but the js version works fine.
- Might need to make images public, `chmod 777 -R images`