(function() {
  "use strict";
  var Hampshire = this.Hampshire || {};
  var app = Hampshire;

  app.init = function() {
    // this function is execute on start and can call other function
    // usually a lot of the hooks are places here
    console.log('this is where it all starts');

    setupClickListeners();
  };

  function setupClickListeners () {
    jQuery('.click-me').click(function (){
      alert('Like clicking just about any button?');
    });
  }


  this.Hampshire = Hampshire;
}).call(this);
