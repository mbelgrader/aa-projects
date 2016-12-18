/* eslint no-return-assign: 0 */

// function sum() {
//   let result = 0;
//   for (let i = 0; i < arguments.length; i++) {
//     result += arguments[i];
//   }
//
//   return result;
// }

// function sum(...nums) {
//   let result = 0;
//   nums.forEach(function(num) {
//     result += num;
//   });
//   return result;
// }


function sum(...nums) {
  let result = 0;
  nums.forEach(num => result += num );
  return result;
}

// console.log(sum(1,2,3,4)); // 10
// console.log(sum(1,2,3,4,5)); // 15

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}`);
    return true;
  }
}

const markov = new Cat('Markov');
const breakfast = new Cat('Breakfast');

// Function.prototype.myBind = function(ctx) {
//   let that = this;
//   const bindArgs = Array.from(arguments).slice(1);
//
//   return function() {
//     const callArgs = Array.from(arguments);
//     return that.apply(ctx, bindArgs.concat(callArgs));
//   };
// };

Function.prototype.myBind = function(ctx, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(ctx, bindArgs.concat(callArgs));
  };
};

// markov.says('meow', 'Ned');
// // Markov says meow to Ned!
// markov.says.myBind(breakfast, 'meow', 'Kush')();
// // Breakfast says meow to Kush!
// markov.says.myBind(breakfast)('meow', 'a tree');
// markov.says.myBind(breakfast, 'meow')('Markov');

const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays('meow', 'me');
