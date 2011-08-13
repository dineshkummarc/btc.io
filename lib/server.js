(function() {
  var DEBUG, PORT, app, express;
  express = require('express');
  PORT = process.env.PORT || 3000;
  DEBUG = !process.env.PORT;
  app = express.createServer(express.logger());
  app.set('views', "" + __dirname + "/../views");
  app.set('view engine', 'jade');
  app.use(app.router);
  app.use(express.static("" + __dirname + "/../public"));
  if (DEBUG) {
    app.use(express.errorHandler({
      dumpExceptions: true,
      showStack: true
    }));
  } else {
    app.use(express.errorHandler());
  }
  require('./app')(app);
  app.listen(PORT, function() {
    return console.log("Listening on " + PORT + "...");
  });
}).call(this);
