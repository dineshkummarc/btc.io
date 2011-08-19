(function() {
  var querystring, url;
  url = require('url');
  querystring = require('querystring');
  module.exports = function(app) {
    app.get('/', function(req, res, next) {
      return res.render('index');
    });
    app.get('/pay/:address', function(req, res, next) {
      var GET, i, k, queryParts, _len, _ref;
      GET = url.parse(req.url, true).query;
      GET.address = req.params.address;
      queryParts = [];
      _ref = ['address', 'amount', 'label', 'message'];
      for (i = 0, _len = _ref.length; i < _len; i++) {
        k = _ref[i];
        if (GET[k]) {
          queryParts.push(k + "=" + querystring.escape(GET[k]));
        }
      }
      return res.render('pay', {
        locals: {
          suffix: '?' + queryParts.join('&'),
          queryParts: queryParts,
          options: [
            {
              name: "webcoin.ch",
              url: "https://webcoin.ch"
            }
          ]
        }
      });
    });
    return app.get('/logos', function(req, res, next) {
      return res.render('logos');
    });
  };
}).call(this);
