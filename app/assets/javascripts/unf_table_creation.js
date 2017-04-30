$(function() {
  if (document.getElementById("unfinished-pricing") != null) {
    //page variables
    var widths = gon.widths;
    var heights = gon.heights;
    var product = gon.product;
    var builder = gon.builder;
    var table = $("#unfinished-pricing-table-" + product.id);

    if (builder.name !== "Evergreen" && widths[0] === "Size") {

      if (builder.name === "Penns Creek") {
        var header = $("<thead><tr><th width='150' colspan=" + (widths.length + 1) + " style='text-align:center;'>Unfinished " + product.build_material + "</th></tr></thead>");
        var row = $("<tr><td colspan=" + (widths.length + 1) + "><b>Currently not available unfinished</b></td></tr>")
        table.append(header);
        table.append(row)

      } else {
      var header = $("<thead><tr><th width='150' colspan=" + (widths.length + 1) + " style='text-align:center;'>" + product.build_material + " - unfinished</th></tr></thead>");
      table.append(header);
      // add widths to top of table
      var rowWidthFunction = function(inputArray) {
        var widthRowStart = "<tr style='text-align:center; border-bottom:1px solid #439B4F;'>";
        for(i = 0; i < inputArray.length; i++) {
          widthRowStart = widthRowStart + "<td><b>" + inputArray[i] + "</b></td>";
        };
        widthRowStart = widthRowStart + "</tr>";
        table.append(widthRowStart);
      }

      // add pricing below
      var rowPriceFunction = function(inputArray) {
        for(n = 0; n < inputArray.length; n++) {
          var prices = gon.unf_prices[n];
          var priceRowStart = "<tr style='text-align:center;'>";
          priceRowStart = priceRowStart + "<td>" + heights[n].split("_").join(" ") + "</td>";

          for(x = 0; x < prices.length; x++) {
            var price = Math.round(prices[x] * .75)
            if (price % 5 === 0) {
              price = price - 1;
            }
            priceRowStart = priceRowStart + "<td>$" + price + ".99</td>";
          }
          table.append(priceRowStart);
      }};

      rowWidthFunction(widths);
      rowPriceFunction(heights);

    }}

    if (builder.name === "Evergreen" && widths[0] === "Size") {
        var header = $("<thead><tr><th width='150' colspan=" + (widths.length + 1) + " style='text-align:center;'>" + product.build_material + " - unfinished</th></tr></thead>");
        table.append(header);
        // add widths to top of table
        var rowWidthFunction = function(inputArray) {
          var widthRowStart = "<tr style='text-align:center; border-bottom:1px solid #439B4F;'>";
          for(i = 0; i < inputArray.length; i++) {
            widthRowStart = widthRowStart + "<td><b>" + inputArray[i] + "</b></td>";
          };
          widthRowStart = widthRowStart + "</tr>";
          table.append(widthRowStart);
        }

        // add pricing below
        var rowPriceFunction = function(inputArray) {
          for(n = 0; n < inputArray.length; n++) {
            var prices = gon.unf_prices[n];
            var priceRowStart = "<tr style='text-align:center;'>";
            priceRowStart = priceRowStart + "<td>" + heights[n].split("_").join(" ") + "</td>";

            for(x = 0; x < prices.length; x++) {
              var price = prices[x]
              if (price % 5 === 0) {
                price = price - 1;
              };
              priceRowStart = priceRowStart + "<td>$" + price + ".99</td>";
            }
            table.append(priceRowStart);
        }};

        rowWidthFunction(widths);
        rowPriceFunction(heights);
      }

      if (builder.name !== "Evergreen" && widths[0] !== "Size") {
          // add header to table
          var header = $("<thead><tr><th width='150' colspan=" + (widths.length + 2) + " style='text-align:center;'>" + product.build_material + " - unfinished</th></tr></thead>");
          table.append(header);
          //add widths name to table
          var widthsTitle = $("<tr><td colspan=" + (widths.length + 2) + " style='text-align:center;' class='width-name'><b>width</b></td></tr>")
          table.append(widthsTitle);

          // add widths to top of table
          var rowWidthFunction = function(inputArray) {
            var widthRowStart = "<tr style='text-align:center; border-bottom:1px solid #439B4F; background-color:white;'><td></td><td></td>";
            for(i = 0; i < inputArray.length; i++) {
              widthRowStart = widthRowStart + "<td class='width-dim'><b>" + inputArray[i] + "\"</b></td>";
            };
            widthRowStart = widthRowStart + "</tr>";
            table.append(widthRowStart);
          }
          rowWidthFunction(widths);
          // add pricing below
          var rowPriceFunction = function(inputArray) {
            for(n = 0; n < inputArray.length; n++) {
              var prices = gon.unf_prices[n];
              var priceRowStart = "<tr style='text-align:center;'>";
              if (n === 0) {
                priceRowStart = priceRowStart + "<td class='first-td last' rowspan=" + inputArray.length + "><p><b>height</b></p></td><td class='height-dim'><b>" + heights[n] + "\"</b></td>";
              }
              else {
                priceRowStart = priceRowStart + "<td class='height-dim'><b>" + heights[n] + "\"</b></td>";
              }

              for(x = 0; x < prices.length; x++) {
                var price = Math.round(prices[x] * .75)
                priceRowStart = priceRowStart + "<td>$" + price + ".99</td>";
              }
              table.append(priceRowStart);
          }};
          rowPriceFunction(heights);
      }

      if (builder.name === "Evergreen" && widths[0] !== "Size") {

          // add header to table
          var header = $("<thead><tr><th width='150' colspan=" + (widths.length + 2) + " style='text-align:center;'>" + product.build_material + " - unfinished</th></tr></thead>");
          table.append(header);
          //add widths name to table
          var widthsTitle = $("<tr><td colspan=" + (widths.length + 2) + " style='text-align:center;' class='width-name'><b>width</b></td></tr>")
          table.append(widthsTitle);
          // add widths to top of table
          var rowWidthFunction = function(inputArray) {
            var widthRowStart = "<tr style='text-align:center; border-bottom:1px solid #439B4F; background-color:white;'><td></td><td></td>";
            for(i = 0; i < inputArray.length; i++) {
              widthRowStart = widthRowStart + "<td class='width-dim'><b>" + inputArray[i] + "\"</b></td>";
            };
            widthRowStart = widthRowStart + "</tr>";
            table.append(widthRowStart);
          }
          rowWidthFunction(widths);

          // add pricing below
          var rowPriceFunction = function(inputArray) {
            for(n = 0; n < inputArray.length; n++) {
              var prices = gon.unf_prices[n];
              var priceRowStart = "<tr style='text-align:center;'>";
              if (n === 0) {
                priceRowStart = priceRowStart + "<td class='first-td last' rowspan=" + inputArray.length + "><p><b>height</b></p></td><td class='height-dim'><b>" + heights[n] + "\"</b></td>";
              } else {
                priceRowStart = priceRowStart + "<td class='height-dim'><b>" + heights[n] + "\"</b></td>";
              }

              for(x = 0; x < prices.length; x++) {
                var price = prices[x];
                priceRowStart = priceRowStart + "<td>$" + price + ".99</td>";
              }

              table.append(priceRowStart);
          }};
          rowPriceFunction(heights);
        }
      }

});
