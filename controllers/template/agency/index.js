let Agency = require('./model/index');
let table = require('../../../lib/tableList');
let menu = require('../../../lib/menu');
let Permit = require('../../../lib/permit');
let url = require('url');


exports.list = function (req, res, next) {

  res.locals.urlPage = req.url;
  let urlParsed = url.parse(req.url, true);
  let pathname = urlParsed.pathname;
  let temp = '';
  let resultList = '';
  let formValue = '';
  let permission = '00000';
  let users = null;
  let action = {};
  let sidebar = '';
  let permitForm = '';
  let selectOnePage = '';
  let titlePage = '';
  let administrator = true;
  let id_user = null;
  let nameTemplate = '';
  let value = '';
  let id_city = null;
  let nameCity = '';
  let cityList = '';
  let yesPage = true;

  function getSection() {

    if (!req.session.uid) {

      res.redirect(303, '/admin/login');

    } else {

      Permit.getSection(pathname, function (err, result) {
        if (err) return next(err);

        if (result.rowCount > 0) {

          nameTemplate = result.rows[0].name;
          temp = result.rows[0].temp;
          value = req.body[temp];

          noend();

        } else {

          noend();
        }
      });
    }
  }

  function initialization() {

    if (req.admin === req.session.uid) {

      let permit = new Permit({
        url: pathname,
        email: req.session.uid
      });

      permit.init(function (err, result) {
        if (err) return next(err);

        if (result.command === 'SELECT') {

          permit.form(function (err, result) {
            if (err) return next(err);

            if (result.rowCount !== 0) {

              permitForm = result;
              noend();
            }
          });
        }

        if (result.command === 'INSERT') {
          res.redirect(303, pathname);
        }

        if (result.command === 'UPDATE') {

          permit.form(function (err, result) {
            if (err) return next(err);

            if (result.rowCount !== 0) {
              permitForm = result;
              noend();
            }
          });
        }
      });

    } else {

      noend();

    }
  }

  function accessValue() {

    let permit = new Permit({
      url: urlParsed.pathname,
      email: req.session.uid
    });

    permit.accessModerator(function (err, result) {
      if (err) return next(err);

      id_user = result.rows[0].id_user;

      if (req.admin !== req.session.uid) {

        if (result.rows[0].role_id == null) {
          administrator = false;
          users = 1;
        } else {
          administrator = false;
          users = 0;
        }
      }

      permit.access(function (err, result) {
        if (err) return next(err);

        permission = result;

        if( req.admin !== req.session.uid) {
          permitForm = '';
        }

        Permit.getCity(req.session.uid, function (err, result) {
          if (err) return next(err);

          if (result === 0) {

            req.session.flash = {
              type: 'danger',
              intro: 'Ошибка администрирования!',
              message: 'В разделе "Настройки сайта" нужно установить город по умолчанию.'
            };
            res.redirect('/admin/template/admin');

          } else {

            id_city = result;
            noend();
          }
        });
      });
    });
  }

  function userMenu() {

    menu.adminMenu(permission, users, req.session.uid, urlParsed, function (err, result) {
      if (err) return next(err);

      sidebar = result;

      noend();
    });
  }

  function accessTemplate() {

    if (permission === '00000') {

      res.locals.flash = {
        type: 'danger',
        intro: 'Ошибка доступа!',
        message: 'У Вас нет прав доступа к шаблону "agency".'
      };

      yesPage = false;

      res.render('template/agency/body',
        {
          layout: 'admin',
          sidebar: sidebar,
          yesPage: yesPage,
          administrator: administrator
        }
      );
    } else {
      noend();
    }
  }

  function editCity() {

    if (urlParsed.query.editCity) {

      Agency.setCity(urlParsed.query.editCity, req.session.uid, function (err, result) {
        if (err) return next(err);

        if (result.rowCount > 0) {

          req.session.flash = {
            type: 'success',
            intro: 'Успех!',
            message: 'Город установлен.'
          };
          res.redirect(pathname);

        } else {

          req.session.flash = {
            type: 'danger',
            intro: 'Ошибка сервера!',
            message: "В ближайшее время ошибка будет устранена."
          };
          res.redirect(pathname);
        }
      })

    } else {
      noend();
    }
  }

  function listAccess() {

    if (urlParsed.query.edit) {

      if (permission.indexOf('1', 2) === 2) {

        noend();

      } else {
        req.session.flash = {
          type: 'danger',
          intro: 'Ошибка доступа!',
          message: "У Вас нет прав на правку."
        };
        res.redirect(303, pathname);
      }

    } else if (urlParsed.query.drop) {

      if (permission.indexOf('1', 1) === 1) {

        noend();

      } else {
        req.session.flash = {
          type: 'danger',
          intro: 'Ошибка доступа!',
          message: "У Вас нет прав на удаление."
        };
        res.redirect(pathname);
      }


    } else if (urlParsed.query.party) {

      if (permission.indexOf('1', 3) === 3 && permission.indexOf('1', 2) === 2) {

        noend();

      } else {
        req.session.flash = {
          type: 'danger',
          intro: 'Ошибка доступа!',
          message: "У Вас нет прав на просмотр или создание модератора агенства."
        };
        res.redirect(pathname);
      }

    } else if (urlParsed.query.user) {

      if (permission.indexOf('1', 3) === 3 && permission.indexOf('1', 4) === 4) {

        noend();

      } else {
        req.session.flash = {
          type: 'danger',
          intro: 'Ошибка доступа!',
          message: "У Вас нет прав на просмотр или создание модератора агенства."
        };
        res.redirect(pathname);
      }

    } else {

      noend();
    }
  }

  function noStatus() {

    if (urlParsed.query.noStatus && urlParsed.query.party) {

      let noParty = new Agency(
        {
          party: urlParsed.query.party
        }
      );

      noParty.allEmptyAgency(function (err, result) {
        if (err) return next(err);

        res.redirect(303, '/admin/template/agency?party=' + urlParsed.query.party);
      })

    } else {
      noend();
    }

  }


  function listUser() {

    if (urlParsed.query.user && urlParsed.query.party) {

      let party = urlParsed.query.party;
      let user = urlParsed.query.user;

      let updateParty = new Agency(
        {
          party: party,
          user: user
        }
      );

      updateParty.allEmptyAgency(function (err, result) {
        if (err) return next(err);

        updateParty.oneAgency(function (err, result) {
          if (err) return next(err);

          noend();

        })

      })
    } else {
      noend();
    }
  }

  function listParty() {

    let titleParty = '';

    if (urlParsed.query.party) {

      let party = new Agency(
        {
          id: urlParsed.query.party,
          template: temp
        }
      );

      party.getOneForm(function (err, result) {
        if (err) return next(err);

        if (result.rowCount > 0) {

          titleParty = result.rows[0].title;

        }

        party.listAgency(function (err, result) {
          if (err) return next(err);

          if (result.rowCount > 0) {

            resultList = table.tableListParty(result, urlParsed.query.party);
          }


          titlePage = 'Администрирование. Сотрудники агенства: <span class="content-edit">' + titleParty + '</span>';

          res.render('template/agency/body-edit',
            {
              layout: 'admin',
              title: titlePage,
              permit: permitForm,
              sidebar: sidebar,
              table: resultList,
              administrator: administrator,
              party: urlParsed.query.party
            }
          );

        });

      });

    } else {
      noend()
    }
  }


  function listEdit() {

    if (urlParsed.query.edit) {

      action.edit = true;
      action.drop = false;
      action.create = false;

      let edit = new Agency(
        {
          id: urlParsed.query.edit,
          template: temp
        }
      );

      edit.getOneRecord(function (err, result) {
        if (err) return next(err);

        if (result.rowCount > 0) {

          let getAuthor = result.rows[0].author;

          edit = new Agency(
            {
              id: urlParsed.query.edit,
              author_edit: id_user,
              template: temp
            }
          );

          if (permission.indexOf('1', 4) === 4 || users == null || getAuthor === req.session.uid) {

            edit.getOneForm(function (err, result) {
              if (err) return next(err);

              formValue = result.rows[0];

              noend();

            });

          } else {

            req.session.flash = {
              type: 'danger',
              intro: 'Ошибка доступа!',
              message: "Вам не хватает прав на правку записи с id=" + urlParsed.query.edit
            };
            res.redirect(303, pathname);

          }


        } else {
          req.session.flash = {
            type: 'danger',
            intro: 'Ошибка записи!',
            message: "Такой записи не существует."
          };
          res.redirect(303, pathname);
        }
      });


    } else {
      noend();
    }

  }

  function listDrop() {

    if (urlParsed.query.drop) {

      action.drop = true;
      action.create = false;
      action.edit = false;

      let drop = new Agency(
        {
          id: urlParsed.query.drop,
          template: temp
        }
      );

      drop.getOneRecord(function (err, result) {
        if (err) return next(err);

        if (result.rowCount > 0) {

          let getAuthor = result.rows[0].author;

          drop = new Agency(
            {
              id: urlParsed.query.drop,
              author_edit: id_user,
              template: temp
            }
          );

          if (permission.indexOf('1', 4) === 4 || users == null || getAuthor === req.session.uid) {

            drop.getOneForm(function (err, result) {
              if (err) return next(err);

              formValue = result.rows[0];

              noend();

            });

          } else {

            req.session.flash = {
              type: 'danger',
              intro: 'Ошибка доступа!',
              message: "Вам не хватает прав на правку записи с id=" + urlParsed.query.edit
            };
            res.redirect(pathname);

          }

        } else {
          req.session.flash = {
            type: 'danger',
            intro: 'Ошибка записи!',
            message: "Такой записи не существует."
          };
          res.redirect(pathname);
        }

      });

    } else {

      noend();
    }
  }


  function listTable() {

    let agencyList = new Agency({
      template: temp,
      users: users,
      email: id_user,
      id_city: id_city,
      permission: permission
    });

    agencyList.list(function (err, result) {
      if (err) return next(err);

      if (result === '') {

        resultList = '';

        noend();

      } else if (result.rowCount > 0) {

        resultList = result;

        let urlPage = urlParsed.query.page;
        let limit = 30;
        let linkLimit = 5;
        let offset = urlPage * limit - limit;

        if (offset < 0 || !offset) offset = 0;

        agencyList.listLimit(limit, offset, function (err, result) {
          if (err) return next(err);

          let resultLimit = result;

          resultList = Agency.tableListAgency(req, resultList, urlParsed, permission, limit, linkLimit, urlPage, resultLimit, temp);

          noend();

        });

      } else {
        noend();
      }
    });
  }

  function listCity() {

    Agency.oneCity(id_city, function (err, result) {
      if (err) return next(err);
      if (result.rowCount > 0) {
        nameCity = result.rows[0].title;

        Agency.listCity(function (err, result) {
          if (err) return next(err);

          cityList = result.rows;

          let city = '';

          city += '<ul class="listCity">\n';
          for (let i = 0; i < cityList.length; i++) {
            city += '\t<li><a href="/admin/template/agency?editCity=' + cityList[i].id_city + '"><b>' + cityList[i].title + '</b> - ' + cityList[i].region + '</a></li>\n';
          }
          cityList = city;

          noend();

        });

      } else {
        req.session.flash = {
          type: 'danger',
          intro: 'Ошибка администрирования!',
          message: "Не определяется город."
        };
        res.redirect('/admin/template/admin');
      }
    })
  }


  function listRender() {

    //Просматривать(0) | Удалять(1) | Править, редактировать(2) | Сохранять, добавлять(3) | Редактировать всех(4)

    if (action.edit || action.drop) {

      action.create = false;
    } else {
      action.create = true;
    }


    titlePage = nameTemplate + '<span class = "city">' + nameCity + '</span>';
    titlePage += '<span class="btn btn-primary selectCity" data-toggle="modal" data-target=".bs-example-modal-lg">Выбрать город</span>';

    res.render('template/agency/body',
      {
        layout: 'admin',
        urlPage: req.url,
        title: titlePage,
        formValue: formValue,
        permit: permitForm,
        action: action,
        permission: permission,
        sidebar: sidebar,
        template: temp,
        renew: '<a class="renew_btn" href="' + urlParsed.pathname + '">Вернуться</a>',
        selectOnePage: selectOnePage,
        table: resultList,
        administrator: administrator,
        yesPage: yesPage,
        cityList: cityList

      }
    );

  }

  let tasks = [getSection, initialization, accessValue, userMenu, accessTemplate, editCity, listAccess, noStatus, listUser, listParty, listEdit, listDrop, listTable, listCity, listRender];

  function noend() {
    let currentTask = tasks.shift();
    if (currentTask) currentTask();
  }

  noend();


};

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

exports.submit = function (req, res, next) {

  res.locals.urlPage = req.url;
  let urlParsed = url.parse(req.url, true);
  let pathname = urlParsed.pathname;
  let permission = '00000';
  let users = null;
  let temp = '';
  let nameTemplate = '';
  let value = {};
  let id_user = null;
  let administrator = true;
  let yesPage = true;
  let sidebar = '';
  let id_city = null;

  function getSection() {

    if (!req.session.uid) {

      res.redirect(303, '/admin/login');

    } else {

      Permit.getSection(pathname, function (err, result) {
        if (err) return next(err);

        if (result.rowCount === 1) {

          temp = result.rows[0].temp;
          nameTemplate = result.rows[0].name;
          value = req.body[temp];

          noend();

        } else {
          return next();
        }
      });
    }
  }

  function initialization() {

    if (req.admin === req.session.uid) {

      let permit = new Permit({
        url: pathname,
        email: req.session.uid,
        submit: req.body
      });

      permit.init(function (err, result) {
        if (err) return next(err);

        if (result.rowCount === 1 && result.command === 'UPDATE') {
          req.session.flash = {
            type: 'success',
            intro: 'Успех!',
            message: 'Права доступа адреса изменены.'
          };
          res.redirect(303, pathname);

        } else {
          noend();
        }
      });

    } else {
      noend();
    }
  }

  function accessValue() {

    let permit = new Permit({
      url: urlParsed.pathname,
      email: req.session.uid
    });

    permit.accessModerator(function (err, result) {
      if (err) return next(err);

      id_user = result.rows[0].id_user;

      if (req.admin !== req.session.uid) {

        if (result.rows[0].role_id == null) {
          administrator = false;
          users = 1;
        } else {
          administrator = false;
          users = 0;
        }
      }

      permit.access(function (err, result) {
        if (err) return next(err);

        permission = result;

        Permit.getCity(req.session.uid, function (err, result) {
          if (err) return next(err);

          if (result === 0) {

            req.session.flash = {
              type: 'danger',
              intro: 'Ошибка администрирования!',
              message: 'В разделе "Настройки сайта" нужно установить город по умолчанию.'
            };
            res.redirect('/admin/template/admin');

          } else {

            id_city = result;
            noend();
          }
        });
      });
    });
  }

  function userMenu() {

    menu.adminMenu(permission, users, req.session.uid, urlParsed, function (err, result) {
      if (err) return next(err);

      sidebar = result;

      noend();
    });
  }

  function accessTemplate() {

    if (permission === '00000') {

      res.locals.flash = {
        type: 'danger',
        intro: 'Ошибка доступа!',
        message: 'У Вас нет прав доступа к шаблону "agency".'
      };

      yesPage = false;

      res.render('template/agency/body',
        {
          layout: 'admin',
          sidebar: sidebar,
          yesPage: yesPage,
          administrator: administrator
        }
      );
    } else {
      noend();
    }
  }

  function accessUrl() {

    let id = null;
    if(urlParsed.query.edit){
      id = urlParsed.query.edit;
    }
    if(urlParsed.query.drop){
      id = urlParsed.query.drop;
    }
/*    Agency.getIdPage(temp, id, function (err, result) {
      if (err) return next(err);

      if(result.rowCount > 0){
        noend();
      } else {
        req.session.flash = {
          type: 'danger',
          intro: 'Ошибка проверки!',
          message: "Адрес страницы в браузере набран неверно."
        };
        res.redirect(pathname);
      }
    });*/
  noend();
  }

  function submitAccess() {

    if (value.create) {

      if (permission.indexOf('1', 3) === 3) {
        noend();
      } else {
        req.session.flash = {
          type: 'danger',
          intro: 'Ошибка доступа!',
          message: "У Вас нет прав на сохранение."
        };
        res.redirect(pathname);
      }
    } else {
      noend();
    }
  }

  function submitValidate() {

    if (value.title === ' ') {
      req.session.flash = {
        type: 'danger',
        intro: 'Ошибка проверки!',
        message: "Полe не может быть пробелом."
      };
      req.session.repeatData = {
        errTitle: true,
        title: value.title,
        alias: value.alias,
        line: value.line,
        note: value.note
      };
      res.redirect(303, 'back');

    } else if (value.alias === ' ') {

      req.session.flash = {
        type: 'danger',
        intro: 'Ошибка проверки!',
        message: "Полe не может быть пробелом."
      };
      req.session.repeatData = {
        errAlias: true,
        title: value.title,
        alias: value.alias,
        line: value.line,
        note: value.note
      };
      res.redirect(303, 'back');

    } else if (value.line === ' ') {

      req.session.flash = {
        type: 'danger',
        intro: 'Ошибка проверки!',
        message: "Полe не может быть пробелом."
      };
      req.session.repeatData = {
        errLine: true,
        title: value.title,
        alias: value.alias,
        line: value.line,
        note: value.note
      };
      res.redirect(303, 'back');

    } else if (value.title.length < 1) {
      req.session.flash = {
        type: 'danger',
        intro: 'Ошибка проверки!',
        message: "Поля отмеченные звёздочкой обязательны для заполнения."
      };
      req.session.repeatData = {
        errTitle: true,
        title: value.title,
        alias: value.alias,
        note: value.note,
        line: value.line
      };
      res.redirect(303, 'back');
    } else if (value.title.length > 60) {
      req.session.flash = {
        type: 'danger',
        intro: 'Ошибка проверки!',
        message: value.title + ' - должно быть не более 60 символов.'
      };
      req.session.repeatData = {
        errTitle: true,
        title: value.title,
        alias: value.alias,
        note: value.note,
        line: value.line
      };
      res.redirect(303, 'back');
    } else if (value.alias.length > 60) {
      req.session.flash = {
        type: 'danger',
        intro: 'Ошибка проверки!',
        message: 'Должно быть не более 60 символов.'
      };
      req.session.repeatData = {
        errAlias: true,
        title: value.title,
        alias: value.alias,
        note: value.note,
        line: value.line
      };
      res.redirect(303, 'back');
    } else if (value.note.length > 2000) {
      req.session.flash = {
        type: 'danger',
        intro: 'Ошибка проверки!',
        message: 'Должно быть не более 2000 символов.'
      };
      req.session.repeatData = {
        errNote: true,
        title: value.title,
        alias: value.alias,
        note: value.note,
        line: value.line
      };
      res.redirect(303, 'back');
    } else if (value.line.length > 10) {
      req.session.flash = {
        type: 'danger',
        intro: 'Ошибка проверки!',
        message: 'Должно быть не более 10 символов.'
      };
      req.session.repeatData = {
        errLine: true,
        title: value.title,
        alias: value.alias,
        note: value.note,
        line: value.line
      };
      res.redirect(303, 'back');

    } else {
      noend();
    }
  }

  function alias() {


    if (value.latin === '1') {

      if (value.alias.length < 1) {

        value.alias = translite(value.title.trim()).toLowerCase();

        noend();

      } else {

        value.alias = translite(value.alias.trim()).toLowerCase();

        noend();

      }

    } else {

      if (value.alias.length < 1) {
        req.session.flash = {
          type: 'danger',
          intro: 'Ошибка проверки!',
          message: 'Если поле "Псевдоним" отмечено как "original", то поле обязательно для заполнения.'
        };
        req.session.repeatData = {
          errAlias: true,
          title: value.title,
          alias: value.alias,
          note: value.note,
          line: value.line
        };
        res.redirect(303, 'back');

      } else {
        noend();
      }
    }

  }

  function submitCreate() {


    if (value.create) {

      let create = new Agency({

        title: value.title.trim(),
        alias: value.alias.trim(),
        note: value.note.trim(),
        line: value.line.trim(),
        date_create: Date.now(),
        author: id_user,
        id_city: id_city,
        template: temp

      });

      create.issetCreate(function (err, result) {
        if (err) return next(err);

        if (result.rowCount > 0) {
          req.session.flash = {
            type: 'danger',
            intro: 'Ошибка проверки!',
            message: "Псевдоним не уникален."
          };
          req.session.repeatData = {
            errAlias: true,
            title: value.title,
            alias: value.alias,
            note: value.note,
            line: value.line
          };
          res.redirect(303, 'back');

        } else {

          create.save(function (err, result) {
            if (err) return next(err);

            if (result.rowCount > 0) {
              req.session.flash = {
                type: 'success',
                intro: 'Успех!',
                message: 'Запись сохранена.'
              };
              res.redirect(303, urlParsed.pathname);

            } else {
              req.session.flash = {
                type: 'danger',
                intro: 'Ошибка записи!',
                message: "Запись не сохранена."
              };
              res.redirect(303, urlParsed.pathname);
            }
          });
        }
      });

    } else {
      noend();
    }
  }

  function submitEdit() {

    if ( urlParsed.query.edit ) {

      if (permission.indexOf('1', 2) === 2 ) {

        let edit = new Agency({
          id: urlParsed.query.edit,
          title: value.title.trim(),
          alias: value.alias.trim(),
          note: value.note.trim(),
          line: value.line.trim(),
          date_create: Date.now(),
          author_edit: id_user,
          id_city: id_city,
          template: temp
        });


        edit.getOneRecord(function (err, result) {
          if (err) return next(err);

          let getAuthor = result.rows[0].author;

          edit.issetEdit(function (err, result) {
            if (err) return next(err);

            if (result.rowCount > 0) {
              req.session.flash = {
                type: 'danger',
                intro: 'Ошибка проверки!',
                message: "Псевдоним не уникален."
              };
              req.session.repeatData = {
                errAlias: true,
                title: value.title,
                alias: value.alias,
                description: value.description,
                content: value.content,
                priority: value.priority
              };
              res.redirect(303, 'back');

            } else {

              if (permission.indexOf('1', 4) === 4 || getAuthor === req.session.uid) {

                edit.edit(function (err, result) {
                  if (err) return next(err);

                  if (result.rowCount > 0) {
                    req.session.flash = {
                      type: 'success',
                      intro: 'Успех!',
                      message: 'Запись отредактирована.'
                    };
                    let str = '';
                    if(urlParsed.query.page){
                      str += "?page=" + urlParsed.query.page;
                    }
                    res.redirect(pathname + str);

                  } else {
                    req.session.flash = {
                      type: 'danger',
                      intro: 'Ошибка записи!',
                      message: "Запись не отредактирована."
                    };
                    res.redirect(pathname);
                  }
                });

              } else {
                req.session.flash = {
                  type: 'danger',
                  intro: 'Ошибка доступа!',
                  message: "Вам не хватает прав на правку записи"
                };
                res.redirect(pathname);
              }
            }
          });
        });

      } else {
        req.session.flash = {
          type: 'danger',
          intro: 'Ошибка доступа!',
          message: "У Вас нет прав на правку."
        };
        res.redirect(pathname);
      }

    } else {
      noend();
    }
  }

  function submitDrop() {

    if (urlParsed.query.drop) {

      if (permission.indexOf('1', 1) === 1) {

        let drop = new Agency({
          id: urlParsed.query.drop,
          author_edit: id_user,
          template: temp
        });

        drop.getOneRecord(function (err, result) {
          if (err) return next(err);

          let getAuthor = result.rows[0].author;

          if (permission.indexOf('1', 4) === 4 || getAuthor === req.session.uid) {

            drop.drop(function (err, result) {
              if (err) return next(err);

              if (result.rowCount > 0) {

                req.session.flash = {
                  type: 'success',
                  intro: 'Успех!',
                  message: 'Запись удалена.'
                };
                let str = '';
                if(urlParsed.query.page){
                  str += "?page=" + urlParsed.query.page;
                }

                res.redirect(urlParsed.pathname + str);

              } else {
                req.session.flash = {
                  type: 'danger',
                  intro: 'Ошибка записи!',
                  message: "Запись не удалена."
                };
                res.redirect(urlParsed.pathname);
              }

            })

          } else {
            req.session.flash = {
              type: 'danger',
              intro: 'Ошибка доступа!',
              message: "Вам не хватает прав на удаление записи"
            };
            res.redirect(pathname);
          }
        });
      } else {
        req.session.flash = {
          type: 'danger',
          intro: 'Ошибка доступа!',
          message: "У Вас нет прав на удаление."
        };
        res.redirect(pathname);
      }
    } else {
      next();
    }
  }


  let tasks = [getSection, initialization, accessValue, userMenu, accessTemplate, accessUrl, submitAccess, submitValidate, alias, submitCreate, submitEdit, submitDrop];

  function noend() {
    let currentTask = tasks.shift();
    if (currentTask) currentTask();
  }

  noend();

};

function translite(str) {

  let arr = {
    'а': 'a', 'б': 'b', 'в': 'v', 'г': 'g', 'д': 'd', 'е': 'e', 'ж': 'g',
    'з': 'z', 'и': 'i', 'й': 'y', 'к': 'k', 'л': 'l', 'м': 'm', 'н': 'n', 'о': 'o',
    'п': 'p', 'р': 'r', 'с': 's', 'т': 't', 'у': 'u', 'ф': 'f', 'ы': 'i', 'э': 'e',
    'А': 'A', 'Б': 'B', 'В': 'V', 'Г': 'G', 'Д': 'D', 'Е': 'E', 'Ж': 'G', 'З': 'Z',
    'И': 'I', 'Й': 'Y', 'К': 'K', 'Л': 'L', 'М': 'M', 'Н': 'N', 'О': 'O', 'П': 'P',
    'Р': 'R', 'С': 'S', 'Т': 'T', 'У': 'U', 'Ф': 'F', 'Ы': 'I', 'Э': 'E', 'ё': 'yo',
    'х': 'h', 'ц': 'ts', 'ч': 'ch', 'ш': 'sh', 'щ': 'shch', 'ъ': '', 'ь': '', 'ю': 'yu',
    'я': 'ya', 'Ё': 'YO', 'Х': 'H', 'Ц': 'TS', 'Ч': 'CH', 'Ш': 'SH', 'Щ': 'SHCH', 'Ъ': '',
    'Ь': '', 'Ю': 'YU', 'Я': 'YA', ' ': '-', ';': '', ':': '', '?': '', "'": '', '"': '',
    '}': '', '{': '', ']': '', '[': '', '+': '', '_': '', '*': '', '&': '', '%': '',
    '^': '', '$': '', '#': '', '@': '', '!': '', '~': '', ')': '', '(': '', '|': '', '\\': '',
    '/': '', '.': '', ',': '', '<': '', '>': '', '«': '', '»': ''
  };

  str = str.split('');


  let strstr = '';

  for (let i = 0; i < str.length; i++) {

    if (arr[str[i]]) {

      strstr += arr[str[i]];

    } else {

      if (arr[str[i]] === '') {
        strstr += arr[str[i]];
      } else {
        strstr += str[i];
      }
    }
  }

  if (strstr.indexOf('-', strstr.length - 1) == strstr.length - 1) {
    strstr = strstr.substring(0, strstr.length - 1);
  }

  return strstr;

}
