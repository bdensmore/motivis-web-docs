var express = require('express');
var app = express();
var execFile = require('child_process').execFile;

app.set('port', process.env.PORT || 3000);

app.post('/git/hook', function(req, res) {
  console.log('hit the hook');
  var execOptions = {
     maxBuffer: 1024 * 1024 // 1mb
  };

  // Pass execOptions
  execFile('bash_scripts/hook.sh', execOptions, function(error, stdout, stderr) {
    if (error) {
      console.log('There was an error: ' + error.toString());
    }
  });
});

app.use(express.static(__dirname + '/public'));

app.listen(app.get('port'), function() {
  console.log('Express server started on port ' + app.get('port'));
});
