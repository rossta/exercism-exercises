'use strict';

class ETL {
  transform(old) {
    return Object.keys(old).reduce((hash, key) => {
      old[key].forEach((val) => {
        hash[val.toLowerCase()] = +key;
      });
      return hash;
    }, {});
  }
}

module.exports = ETL;
