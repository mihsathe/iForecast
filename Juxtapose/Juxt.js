(
    function () {
        var juxt = window.juxt = function () {
            juxt.param = null;

            juxt.init = function (param) {
                juxt.param = param;
                juxt.queries = juxt.qs();
            };

            juxt.qs = function () {
                var result = {}, keyValuePairs = location.search.slice(1).split('&');

                keyValuePairs.forEach(function (keyValuePair) {
                    keyValuePair = keyValuePair.split('=');
                    result[keyValuePair[0]] = keyValuePair[1] || '';
                });

                return result;
            };

            juxt.summarize = function () {
                var data = juxt.param.data;
                var total = data.length;
                var togs = data.reduce(function (i, j) {
                    var prev = i;
                    if (typeof i == "object") { prev = i.dir == 0 ? 1 : 0 }
                    return prev + (j.dir == 0 ? 1 : 0);
                });
                var opps = data.reduce(function (i, j) {
                    var prev = i;
                    if (typeof i == "object") { prev = i.dir == 1 ? 1 : 0 }
                    return prev + (j.dir == 1 ? 1 : 0);
                });
                var irrevs = data.reduce(function (i, j) {
                    var prev = i;
                    if (typeof i == "object") { prev = i.dir == 2 ? 1 : 0 }
                    return prev + (j.dir == 2 ? 1 : 0);
                });

                document.getElementById('total').innerHTML = total;
                document.getElementById('togs').innerHTML = togs;
                document.getElementById('opps').innerHTML = opps;
                document.getElementById('irrs').innerHTML = irrevs;
                document.getElementById('spd').innerHTML = ((togs / total) * 100).toFixed(4);

                document.getElementById('ser1').innerHTML = juxt.queries["s1"];
                document.getElementById('ser2').innerHTML = juxt.queries["s2"];
                document.getElementById('thr').innerHTML = juxt.queries["th"];
            };

            juxt.visualize = function () {
                var data = juxt.param.data;

                var base = d3.select("#" + juxt.param.dom);

                var titles = ["t", juxt.queries["s1"], "Percent Rise", juxt.queries["s2"], "Percent Rise", "Abs. Difference", "Direction"];
                var title = base.append("tr")
                .selectAll("circle")
                .data(titles)
                .enter()
                .append("th")
                .text(function (d) { return d; })
                .style({
                    "background-color": "#444444",
                    "color": "white"
                })

                var row = base.selectAll("circle")
                .data(data)
                .enter()
                .append("tr")
                .attr("class", function (d) {
                    return d["dir"] == "0" ? "success" : d["dir"] == "1" ? "error" : "info";
                });

                var col = row
                .selectAll("circle")
                .data(function (d) {
                    var temp = [];
                    var j = 0;
                    for (var i in d) { if (j < 7) { temp.push(d[i]); j++; } }
                    return temp;
                })
                .enter()
                .append("td")
                .attr("class", function (d, i) {
                    sizes = [1, 1, 2, 1, 2, 2, 1];
                    return "span" + sizes[i];
                })
                .text(function (d, i) {
                    if (i == 6) {
                        return d == "1" ? "opposite" : d == "0" ? "together" : "irrelevant";
                    }
                    return d;
                });
            };
        }
        juxt();
    }
)();