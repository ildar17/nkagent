let Main = require('./model/index');

let list_menu = '';


exports.list = function (req, res, next) {


  function listPermit() {

    Main.getPermit(function (err, result) {
      if (err) return next(err);

      if(result.rowCount > 0){

        let list = '';

        list += '<li><a href="/">Главная страница</li></a>\n';

        for(let i = 0; i < result.rows.length; i++){

          if(result.rows[i].temp === 'apartment' || result.rows[i].temp === 'cottages' || result.rows[i].temp === 'commercial' || result.rows[i].temp === 'agency' || result.rows[i].temp === 'article'){

            list += "\t\t\t\t\t"+'<li><a href="/'+result.rows[i].temp+'">' + result.rows[i].name + '</li></a>\n';

          }

        }

        list_menu = list;
        list = '';

        noend();

      } else {
        noend();
      }

    });
  }



  function listRender() {

    let titlePage = 'Главная страница';

    res.render('home/index',
      {
        layout: 'main',
        title: titlePage,
        listMenu: list_menu
      }
    );
  }


  let tasks = [listPermit, listRender];

  function noend() {
    let currentTask = tasks.shift();
    if (currentTask) currentTask();
  }

  noend();

};