function curriedSum(numArgs) {
  let nums = [];

  function _curriedSum(num) {
    nums.push(num);

    if (nums.length === numArgs) {
      let sum = 0;
      for (let i = 0; i < nums.length; i++) {
        sum += nums[i];
      }
      return sum;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

// console.log(curriedSum(3)(4)(20)(6)); // 30
// console.log(curriedSum(2)(4)(20)); // 24

Function.prototype.curry = function(numArgs) {
  const args = [];
  const that = this;

  function _curried(arg) {
    args.push(arg);

    if (args.length === numArgs)
      return that.apply(null, args);
    else
      return _curried;
  }

  return _curried;
};

function sumIt() {
  let result = 0;
  for (let i = 0; i < arguments.length; i++) {
    result += arguments[i];
  }
  return result;
}

// console.log(sumIt.curry(3)(4)(20)(6));

Function.prototype.curry2 = function(numArgs) {
  const args = [];
  const that = this;

  function _curried(arg) {
    args.push(arg);

    if (args.length === numArgs)
      return that(...args);
    else
      return _curried;
  }

  return _curried;
};

console.log(sumIt.curry2(3)(4)(20)(6));
