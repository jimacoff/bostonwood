$(function() {
  if (document.getElementById("finished-pricing") != null) {
    //page variables
    var widths = gon.widths;
    var heights = gon.heights;
    var product = gon.product;
    var table = $("#finished-pricing-table-" + product.id);
    var builder = gon.builder;
    var category = gon.category;

    if (builder.name !== "Evergreen" && widths[0] === "Size") {

      var header = $("<thead><tr><th width='150' colspan=" + (widths.length + 1) + " style='text-align:center;'>Professionally Finished - Choose your color below</th></tr></thead>");
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
            priceRowStart = priceRowStart + "<td>$" + prices[x] + ".99</td>";
          }
          table.append(priceRowStart);
      }};

      rowWidthFunction(widths);
      rowPriceFunction(heights);

    }

    if (builder.name === "Evergreen" && widths[0] === "Size") {
        var header = $("<thead><tr><th width='150' colspan=" + (widths.length + 1) + " style='text-align:center;'>Professionally Finished - Choose your color below</th></tr></thead>");
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
              var price = Math.round(prices[x] * 1.5);
              priceRowStart = priceRowStart + "<td>$" + price + ".99</td>";
            }
            table.append(priceRowStart);
        }};

        rowWidthFunction(widths);
        rowPriceFunction(heights);
      }

      if (builder.name !== "Evergreen" && widths[0] !== "Size") {
          // add header to table
          var header = $("<thead><tr><th width='150' colspan=" + (widths.length + 2) + " style='text-align:center;'>Professionally Finished - Choose your color below</th></tr></thead>");
          table.append(header);

          // add widths to top of table
          var rowWidthFunction = function(inputArray) {
            var widthRowStart = "<tr style='text-align:center; border-bottom:1px solid #439B4F; background-color:white;'><td></td><td></td>";
            for(i = 0; i < inputArray.length; i++) {
              widthRowStart = widthRowStart + "<td class='width-dim'><b>" + inputArray[i] + "\"</b></td>";
            };
            widthRowStart = widthRowStart + "</tr>";
            table.append(widthRowStart);
          }
          //add widths name to table
          var widthsTitle = $("<tr><td colspan=" + (widths.length + 2) + " style='text-align:center;' class='width-name'><b>width</b></td></tr>")
          table.append(widthsTitle);

          // add pricing below
          var rowPriceFunction = function(inputArray) {
              for(n = 0; n < (inputArray.length); n++) {
                var prices = gon.unf_prices[n];
                var priceRowStart = "<tr style='text-align:center;'>";
                if (n === 0) {
                  if (product.name === "Design-Your-Own" && category.name === "desks, hutches, file cabinets") {
                    priceRowStart = priceRowStart + "<td class='first-td last' rowspan=" + inputArray.length + "><p><b>depth</b></p></td><td class='height-dim'><b>" + heights[n] + "\"</b></td>";
                  }
                  else if (category.name === "dining tables") {
                    priceRowStart = priceRowStart + "<td class='first-td last' rowspan=" + inputArray.length + "><p><b>depth</b></p></td><td class='height-dim'><b>" + heights[n] + "\"</b></td>";
                  }
                  else {
                    priceRowStart = priceRowStart + "<td class='first-td last' rowspan=" + inputArray.length + "><p><b>height</b></p></td><td class='height-dim'><b>" + heights[n] + "\"</b></td>";
                  }
                } else {
                  priceRowStart = priceRowStart + "<td class='height-dim'><b>" + heights[n] + "\"</b></td>";
                }

                for(x = 0; x < prices.length; x++) {
                  var price = prices[x];
                  priceRowStart = priceRowStart + "<td>$" + price + ".99</td>";
                }
                table.append(priceRowStart);
              }
            }

          rowWidthFunction(widths);
          rowPriceFunction(heights);
      }

      if (builder.name === "Evergreen" && widths[0] !== "Size") {
        // add header to table
        var header = $("<thead><tr><th width='150' colspan=" + (widths.length + 2) + " style='text-align:center;'>Professionally Finished - Choose your color below</th></tr></thead>");
        table.append(header);
        //add widths name to table
        var widthsTitle = $("<tr><td colspan=" + (widths.length + 2) + " style='text-align:center;' class='width-name'><b>width</b></td></tr>")
        table.append(widthsTitle);

        // add widths to top of table
        function rowWidthFunction(inputArray) {
          var widthRowStart = "<tr style='text-align:center; border-bottom:1px solid #439B4F; background-color:white;'><td></td><td></td>";
          for(i = 0; i < inputArray.length; i++) {
            widthRowStart = widthRowStart + "<td class='width-dim'><b>" + inputArray[i] + "\"</b></td>";
          };
          widthRowStart = widthRowStart + "</tr>";
          table.append(widthRowStart);
        }
        rowWidthFunction(widths);

        // add pricing below
        function rowPriceFunction(inputArray) {
          for(n = 0; n < (inputArray.length); n++) {
            var prices = gon.unf_prices[n];
            var priceRowStart = "<tr style='text-align:center;'>";
            if (n === 0) {
              priceRowStart = priceRowStart + "<td class='first-td last' rowspan=" + inputArray.length + "><p><b>height</b></p></td><td class='height-dim'><b>" + heights[n] + "\"</b></td>";
            } else {
              priceRowStart = priceRowStart + "<td class='height-dim'><b>" + heights[n] + "\"</b></td>";
            }

            for(x = 0; x < prices.length; x++) {
              var price = Math.round(prices[x] * 1.5);
              priceRowStart = priceRowStart + "<td>$" + price + ".99</td>";
            }
            table.append(priceRowStart);
          }
        }
        rowPriceFunction(heights);
      };
    }
  })
