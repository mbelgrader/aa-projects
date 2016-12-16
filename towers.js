const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class HanoiGame {
  constructor() {
    this.towers = [[3,2,1], [], []];
  }

  run(completionCallback) {
    this.getInput((from, to) => {
      this.moveDisc(from, to);
      if (this.gameOver()) {
        console.log('You win!');
        completionCallback();
      } else {
        this.run(completionCallback);
      }
    });

  }


  getInput(callback) {
    console.log(this.towers);
    reader.question('What tower do you want to move from?', fromTower => {
      let from = parseInt(fromTower);
      reader.question('What tower do you want to move to?', toTower => {
        let to = parseInt(toTower);
        console.log(from, to);
        callback(from, to);
      });
    });
  }

  moveDisc(from, to) {
    if (this.validMove(from, to)) {
      let disc = this.towers[from].pop();
      this.towers[to].push(disc);
    } else {
      console.log("Invalid move");
    }
  }

  validMove(from, to) {
    to = this.towers[to];
    from = this.towers[from];
    const lastTo = to[to.length-1];
    const lastFrom = from[from.length-1];

    if (lastFrom === undefined)
      return false;
    else if (lastTo === undefined)
      return true;
    else if (lastTo > lastFrom)
      return true;
    else
      return false;
  }

  gameOver() {
    return this.towers[0].length < 1 &&
      (this.towers[1].length < 1 || this.towers[2].length < 1);
  }
}

const g = new HanoiGame();
g.run(() => reader.close() );
