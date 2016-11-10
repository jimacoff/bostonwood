$(function() {
  //page variables
  var widths = gon.widths;
  var heights = gon.heights;
  var product = gon.product;
  var table = $("#finished-pricing-table-" + product.id);

  // add header to table
  var header = $("<thead><tr><th width='150' colspan=" + (widths.length + 1) + " style='text-align:center;'>Widths</th></tr></thead>");
  table.append(header);

  // add widths to top of table
  function rowWidthFunction(inputArray) {
    var widthRowStart = "<tr style='text-align:center;'><td></td>";
    for(i = 0; i < inputArray.length; i++) {
      widthRowStart = widthRowStart + "<td>" + inputArray[i] + "\"</td>";
    };
    widthRowStart = widthRowStart + "</tr>";
    table.append(widthRowStart);
  };
  rowWidthFunction(widths);

  // add pricing below
  function rowPriceFunction(inputArray) {
    for(n = 0; n < (inputArray.length - 1); n++) {
      var prices = gon.fin_prices[n];
      var priceRowStart = "<tr style='text-align:center;'>";
      priceRowStart = priceRowStart + "<td>" + heights[n] + "\"</td>";

      for(x = 0; x < prices.length; x++) {
        priceRowStart = priceRowStart + "<td>" + prices[x] + ".99</td>";
      }
      table.append(priceRowStart)
    }
  };
  rowPriceFunction(widths);
});
