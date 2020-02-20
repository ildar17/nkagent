let conf = require('../../../../config');
let pg = require('pg');
let dbConf = conf.get('db');
let pool = new pg.Pool(dbConf);
let co = require("co");

module.exports = Main;

function Main(obj) {
  for (let key in obj) {
    this[key] = obj[key];
  }
}

Main.getPermit = function (fn) {

  pool.connect(function (err, client, done) {
    if (err) return fn(err);

    client.query("SELECT * FROM permit ORDER BY priority DESC", function (err, result) {
        done();
        if (err) return fn(err, null);

        return fn(null, result);

      });

  });
};

