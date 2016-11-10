function generateRows() {
  event.preventDefault();
  $(".generate-button")[0].setAttribute("hidden", true);

  var heightsField = $("#height-field")[0].value
  var heightsFieldArray = heightsField.split(" ")

  for (i = 0; i < heightsFieldArray.length; i++) {
    var object = $("#append-after")[0]
    var inputField = $("<input type='text' class='price-row-" + i +"' name='" + i + "'>")
    var inputText = $("<p>row " + (i + 1) + " - " + heightsFieldArray[i] + "\" high prices <i>(seperate by space)<i/></p>")
    $(".append-after").append(inputText)
    $(".append-after").append(inputField)
  }
}
