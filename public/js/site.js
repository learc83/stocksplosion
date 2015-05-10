//Autocomplete
var companies = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('symbol'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,

  prefetch: 'http://localhost:4567/list_companies'
});

$('#autocomplete .typeahead').typeahead({
  hint: true,
  highlight: true,
  minLength: 1,
},
{
  name: 'states',
  display: 'symbol',
  source: companies,
  templates: {
    empty: [
      '<div class="empty-message">',
        'No ticker symbols match the current entry',
      '</div>'
    ].join('\n'),
    suggestion: Handlebars.compile('<div><strong>{{symbol}}</strong> – {{name}}</div>')}
});

//Price Chart
var chartData = {
    labels: [],
    datasets: [
        {
            label: "dataset",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: []
        },
    ]
};

Chart.defaults.Line.bezierCurve = false;
var ctx = $("#priceChart").get(0).getContext("2d");
var priceChart = new Chart(ctx).Line(chartData);


//Company Detail and decision
$("#companyDetail").submit(function(e){
  var sym = $("#sym").val();
  $.ajax({
    type: "GET",
    url: "/company_detail/" + sym + "/20150506/4",
    success:function(response){
      //priceData = data['prices']
      chartData.labels = [];
      chartData.datasets[0].data = [];

      Object.keys(response['prices']).forEach(function (key) {
        //alert(data['prices'][key]);
        chartData.labels.push(key);
        chartData.datasets[0].data.push(response['prices'][key])
      });
      priceChart.destroy();
      priceChart = new Chart(ctx).Line(chartData);

      var decision = $("#decision")
      decision.html(sym + ': ' + response['decision']);
      
      switch(response['decision']) {
        case 'buy':
          decision.css("color", "green");
          break;
        case 'sell':
          decision.css("color", "red");
          break;
        case 'wait':
          decision.css("color", "black");
          break;
      }
    }
  });
  return false;
});











