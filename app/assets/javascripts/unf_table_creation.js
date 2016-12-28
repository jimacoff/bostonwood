$(function() {
  if (document.getElementById("unfinished-pricing") != null) {
    //page letiables
    let widths = gon.widths;
    let heights = gon.heights;
    let product = gon.product;
    let builder = gon.builder;
    let table = $("#unfinished-pricing-table-" + product.id);

    if (builder.name !== "Evergreen" && widths[0] === "Size") {

      let header = $("<thead><tr><th width='150' colspan=" + (widths.length + 1) + " style='text-align:center;'>Unfinished Pricing</th></tr></thead>");
      table.append(header);
      // add widths to top of table
      let rowWidthFunction = function(inputArray) {
        let widthRowStart = "<tr style='text-align:center; border-bottom:1px solid #439B4F;'>";
        for(i = 0; i < inputArray.length; i++) {
          widthRowStart = widthRowStart + "<td><b>" + inputArray[i] + "</b></td>";
        };
        widthRowStart = widthRowStart + "</tr>";
        table.append(widthRowStart);
      }

      // add pricing below
      let rowPriceFunction = function(inputArray) {
        for(n = 0; n < inputArray.length; n++) {
          let prices = gon.unf_prices[n];
          let priceRowStart = "<tr style='text-align:center;'>";
          priceRowStart = priceRowStart + "<td>" + heights[n].split("_").join(" ") + "</td>";

          for(x = 0; x < prices.length; x++) {
            let price = Math.round(prices[x] * .75)
            if (price % 5 === 0) {
              price = price - 1;
            }
            priceRowStart = priceRowStart + "<td>" + price + ".99</td>";
          }
          table.append(priceRowStart);
      }};

      rowWidthFunction(widths);
      rowPriceFunction(heights);

    }

    if (widths[0] === "Size") {
        let header = $("<thead><tr><th width='150' colspan=" + (widths.length + 1) + " style='text-align:center;'>Unfinished Pricing</th></tr></thead>");
        table.append(header);
        // add widths to top of table
        let rowWidthFunction = function(inputArray) {
          let widthRowStart = "<tr style='text-align:center; border-bottom:1px solid #439B4F;'>";
          for(i = 0; i < inputArray.length; i++) {
            widthRowStart = widthRowStart + "<td><b>" + inputArray[i] + "</b></td>";
          };
          widthRowStart = widthRowStart + "</tr>";
          table.append(widthRowStart);
        }

        // add pricing below
        let rowPriceFunction = function(inputArray) {
          for(n = 0; n < inputArray.length; n++) {
            let prices = gon.unf_prices[n];
            let priceRowStart = "<tr style='text-align:center;'>";
            priceRowStart = priceRowStart + "<td>" + heights[n].split("_").join(" ") + "</td>";

            for(x = 0; x < prices.length; x++) {
              let price = prices[x]
              if (price % 5 === 0) {
                price = price - 1;
              };
              priceRowStart = priceRowStart + "<td>" + price + ".99</td>";
            }
            table.append(priceRowStart);
        }};

        rowWidthFunction(widths);
        rowPriceFunction(heights);
      }

      if (builder.name !== "Evergreen" && widths[0] !== "Size") {
          // add header to table
          let header = $("<thead><tr><th width='150' colspan=" + (widths.length + 1) + " style='text-align:center;'>" + builder.name + "Unfinished Pricing</th></tr></thead>");
          table.append(header);

          // add widths to top of table
          function rowWidthFunction(inputArray) {
            let widthRowStart = "<tr style='text-align:center; border-bottom:1px solid #439B4F;'><td></td>";
            for(i = 0; i < inputArray.length; i++) {
              widthRowStart = widthRowStart + "<td><b>" + inputArray[i] + "\"</b></td>";
            };
            widthRowStart = widthRowStart + "</tr>";
            table.append(widthRowStart);
          }

          // add pricing below
          function rowPriceFunction(inputArray) {
            for(n = 0; n < inputArray.length; n++) {
              let prices = gon.unf_prices[n];
              let priceRowStart = "<tr style='text-align:center;'>";
              priceRowStart = priceRowStart + "<td><b>" + heights[n] + "\"</b></td>";
              console.log("hi!")
              for(x = 0; x < prices.length; x++) {
                let price = Math.round(prices[x] * 50)
                console.log(price)
                priceRowStart = priceRowStart + "<td>" + price + ".00</td>";
              }
              table.append(priceRowStart);
          }};
          console.log(rowPriceFunction)
          console.log(rowWidthFunction)
          console.log(widths)
          console.log(heights)
          rowWidthFunction(widths);
          rowPriceFunction(heights);
      }

      if (builder.name === "Evergreen") {
          // add header to table
          let header = $("<thead><tr><th width='150' colspan=" + (widths.length + 1) + " style='text-align:center;'>Unfinished Pricing</th></tr></thead>");
          table.append(header);

          // add widths to top of table
          function rowWidthFunction(inputArray) {
            let widthRowStart = "<tr style='text-align:center; border-bottom:1px solid #439B4F;'><td></td>";
            for(i = 0; i < inputArray.length; i++) {
              widthRowStart = widthRowStart + "<td><b>" + inputArray[i] + "\"</b></td>";
            };
            widthRowStart = widthRowStart + "</tr>";
            table.append(widthRowStart);
          }
          rowWidthFunction(widths);

          // add pricing below
          function rowPriceFunction(inputArray) {
            for(n = 0; n < inputArray.length; n++) {
              let prices = gon.unf_prices[n];
              let priceRowStart = "<tr style='text-align:center;'>";
              priceRowStart = priceRowStart + "<td><b>" + heights[n] + "\"</b></td>";

              for(x = 0; x < prices.length; x++) {
                let price = prices[x]
                priceRowStart = priceRowStart + "<td>" + price + ".99</td>";
              }
              table.append(priceRowStart);
          }};
          rowPriceFunction(heights);
      }

      }
});
