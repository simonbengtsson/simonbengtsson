# Simon Bengtsson
Home page for simonbengtsson.com and simonbengtsson.se

### Deploy
- `dart2js --out=web/sb_snake.dart.js web/sb_snake.dart`
- Swap *.dart to *.js in build/index.html
- `rsync -a web/ root@flown.io:~/sites/simonbengtsson`

### Note
- For some reason the dart version of the snake app is buggy, but the js version works fine.
- Might need to make images public, `chmod 777 -R images`