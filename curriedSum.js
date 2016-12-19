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

console.log(curriedSum(3)(4)(20)(6)); // 30
console.log(curriedSum(2)(4)(20)); // 24
