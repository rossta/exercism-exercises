'use strict';

const PLANET_YEAR_DAYS = {
  Earth: 365.26,
  Jupiter: 4332.82,
  Mars: 686.98,
  Mercury: 87.97,
  Neptune: 60190.03,
  Saturn: 10755.70,
  Uranus: 30687.15,
  Venus: 224.7
};
const PLANETS = Object.keys(PLANET_YEAR_DAYS);
const DAY_SECONDS = 24 * 60 * 60;

class SpaceAge {
  constructor(seconds) {
    this.seconds = seconds;
  }
}

PLANETS.forEach((planet) => {
  let functionName = 'on' + planet;
  SpaceAge.prototype[functionName] = function() {
    return onPlanet(this.seconds, planet);
  }
});

function onPlanet(seconds, planet) {
  return round(seconds / (DAY_SECONDS * PLANET_YEAR_DAYS[planet]));
}

function round(float) {
  return Math.round(float * 100) / 100;
}

module.exports = SpaceAge;
