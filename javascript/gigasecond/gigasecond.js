var Gigasecond = function(startDate) {
  this.startDate = startDate;
};

var GIGAMILLISECONDS = 1000000000 * 1000;

Gigasecond.prototype.date = function() {
  var startMilliseconds = this.startDate.getTime()
  return new Date(startMilliseconds + GIGAMILLISECONDS);
};

module.exports = Gigasecond;
