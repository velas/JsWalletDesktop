// Generated by LiveScript 1.6.0
(function(){
  var getErrorMessage, out$ = typeof exports != 'undefined' && exports || this;
  out$.getErrorMessage = getErrorMessage = function(err, result){
    var errMessage, error, topic, firstLetter;
    if (!(err != null || (result != null && result.error))) {
      return null;
    }
    errMessage = (function(){
      var ref$;
      switch (false) {
      case (result != null ? result.error : void 8) == null:
        error = result.description;
        if (error.indexOf("Failed to fetch")) {
          topic = (ref$ = error.split(":")[0]) != null ? ref$ : "";
          firstLetter = topic.substr(0, 1);
          return topic = firstLetter.toUpperCase() + topic.substr(1);
        } else {
          return error;
        }
      case !(err.toString().indexOf("Insufficient funds for fee") > -1):
        return "Not enough VLX Native balance to execute this operation.\nYou need at least 0.000005 VLX.";
      case !(err.toString().indexOf("Attempt to debit an account but found no record of a prior credit") > -1):
        return "Not enough VLX Native balance to execute this operation.\nYou need at least 0.000005 VLX.";
      case err == null:
        error = err.toString();
        if (error.indexOf("Failed to fetch")) {
          return topic = error;
        }
        break;
      default:
        return "Error occured";
      }
    }());
    return errMessage;
  };
}).call(this);