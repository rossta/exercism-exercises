'use strict';

class Clock {
  constructor(hour, min) {
    this.hour = normalizeHour(hour);
    this.min  = normalizeMin(min);
  }

  plus(min) {
    return addMinutes(this.hour, this.min, min);
  }

  minus(min) {
    return subtractMinutes(this.hour, this.min, min);
  }

  equals(other) {
    return this.hour == other.hour && this.min == other.min;
  }

  toString() {
    return `${leftPad(this.hour, 2)}:${leftPad(this.min, 2)}`
  }
}

function normalizeHour(hour) {
  hour = hour || 0;
  return hour < 0 ? normalizeHour(hour + 24) : (hour % 24);
}

function normalizeMin(min) {
  return (min || 0) % 60;
}

function addMinutes(hour, min, add) {
  if (min+add < 60) {
    return new Clock(hour, min+add);
  } else {
    return addMinutes(hour+1, min, add-60);
  }
}

function subtractMinutes(hour, min, sub) {
  if (sub <= min) {
    return new Clock(hour, min-sub);
  } else if (sub > 60) {
    return subtractMinutes(hour-1, min, sub-60);
  } else {
    return addMinutes(hour-1, min, 60-sub);
  }
}

function timeAt(hour, min) {
  return new Clock(hour, min);
}

function leftPad(str, len) {
  str = String(str);
  let i = -1;
  const ch = 0;

  len = len - str.length;

  while (++i < len) {
    str = ch + str;
  }
  return str;
}

module.exports = {
  at: timeAt
}
