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

//Company Detail and decision
$("#companyDetail").submit(function(e){
  var sym = $("#sym").val();
  $.ajax({
    type: "GET",
    url: "/company_detail/" + sym + "/20150506/3",
    success:function(data){
      Object.keys(data['prices']).forEach(function (key) {
        alert(data['prices'][key]);
      });
    }
  });
  return false;
});