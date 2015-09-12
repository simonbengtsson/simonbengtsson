# Simon Bengtsson

### Deploy
dart2js --out=web/sb_snake.dart.js web/sb_snake.dart
Swap *.dart to *.js in build/index.html
rsync -a build/ root@flown.io:~/sites/flown.io

### Note
For some reason the dart version of the snake app is buggy, but the js version works fine.